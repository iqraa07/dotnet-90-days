<#
.SYNOPSIS
    Helper for the "90 Days of .NET" learning repo.

.DESCRIPTION
    Commands:
      help                 Show this help.
      status               Progress summary, active day, next day, streak, last commits.
      new  [N]             Start day N (default: active or next day). Creates journal + console project (phase 1).
      done [N]             Finish day N: checks build + journal, marks done in README, commits "day-NN: <title>".
      skip [N]             Mark day N as skipped.
      sync                 Re-sync README progress table titles with ROADMAP.md (keeps status/date/journal).
      push                 git push (sets upstream on first push).
      init                 One-time: git init (main), fill GitHub username in README, first commit.
      publish              One-time: create the GitHub repo with gh and push.

    Options:
      -Message "text"      Custom commit summary for 'done'  ->  "day-NN: text"
      -NoProject           'new': do not create a console project.
      -NoCommit            'done': update README only, do not commit.
      -CodeOnly            'done': complete verified implementation; reflection may remain pending.
      -Force               'done': skip build + journal checks.
      -Private             'publish': create a private repo instead of public.

.EXAMPLE
    .\day new 1
    .\day done 1
    .\day status
    .\day push

.NOTES
    This file is intentionally ASCII-only so it works in Windows PowerShell 5.1 and PowerShell 7+.
#>
[CmdletBinding()]
param(
    [Parameter(Position = 0)] [string] $Command = 'help',
    [Parameter(Position = 1)] [int] $Day = 0,
    [string] $Message = '',
    [switch] $NoProject,
    [switch] $NoCommit,
    [switch] $CodeOnly,
    [switch] $Force,
    [switch] $Private
)

Set-StrictMode -Version 2.0
$ErrorActionPreference = 'Stop'

# ---------------------------------------------------------------------------
# Paths and constants
# ---------------------------------------------------------------------------
function Join-Parts {
    $p = $args[0]
    for ($i = 1; $i -lt $args.Count; $i++) { $p = Join-Path $p $args[$i] }
    return $p
}

$Root       = Split-Path -Parent $PSScriptRoot
$ReadmePath = Join-Parts $Root 'README.md'
$RoadmapPath = Join-Parts $Root 'ROADMAP.md'
$TemplatePath = Join-Parts $Root 'templates' 'journal.md'
$JournalDir = Join-Parts $Root 'journal'
$Utf8NoBom  = New-Object System.Text.UTF8Encoding($false)

# Status icons built from code points (keeps this file ASCII-only).
$IconTodo  = [char]::ConvertFromUtf32(0x2B1C)
$IconDoing = [char]::ConvertFromUtf32(0x1F7E1)
$IconDone  = [char]::ConvertFromUtf32(0x2705)
$IconSkip  = [char]::ConvertFromUtf32(0x23ED) + [char]::ConvertFromUtf32(0xFE0F)
$Dot       = [string][char]0x00B7

$RowRegex  = '^\| (\d{2}) \| (.*?) \| (\d) \| (.*?) \| (.*?) \| (.*?) \|\s*$'
$DayRegex  = '^### Day (\d{1,2})\s*[\u2014\u2013:-]\s*(.+?)\s*$'
$Today     = Get-Date -Format 'yyyy-MM-dd'

# ---------------------------------------------------------------------------
# Small helpers
# ---------------------------------------------------------------------------
function Write-Info([string]$Text) { Write-Host $Text -ForegroundColor Cyan }
function Write-Ok([string]$Text)   { Write-Host $Text -ForegroundColor Green }
function Write-Note([string]$Text) { Write-Host $Text -ForegroundColor Yellow }
function Stop-WithError([string]$Text) {
    Write-Host "ERROR: $Text" -ForegroundColor Red
    exit 1
}

function Read-Text([string]$Path) {
    return [System.IO.File]::ReadAllText($Path, [System.Text.Encoding]::UTF8)
}
function Write-Text([string]$Path, [string]$Content) {
    [System.IO.File]::WriteAllText($Path, $Content, $Utf8NoBom)
}
function Get-Newline([string]$Text) {
    if ($Text.Contains("`r`n")) { return "`r`n" } else { return "`n" }
}

function Test-Tool([string]$Name) {
    return [bool](Get-Command $Name -ErrorAction SilentlyContinue)
}

# Run a native command and stream its output. Returns the exit code.
function Invoke-Tool {
    param([string]$Exe, [string[]]$Arguments)
    $old = $ErrorActionPreference
    $ErrorActionPreference = 'Continue'
    try {
        & $Exe @Arguments | Out-Host
        return $LASTEXITCODE
    } finally {
        $ErrorActionPreference = $old
    }
}

# Run a native command quietly and capture stdout. Returns $null on failure.
function Get-ToolOutput {
    param([string]$Exe, [string[]]$Arguments)
    $old = $ErrorActionPreference
    $ErrorActionPreference = 'Continue'
    try {
        $out = & $Exe @Arguments 2>$null
        if ($LASTEXITCODE -ne 0) { return $null }
        return $out
    } catch {
        return $null
    } finally {
        $ErrorActionPreference = $old
    }
}

# Run a native command silently. Returns $true when the exit code is 0.
function Test-ToolOk {
    param([string]$Exe, [string[]]$Arguments)
    $old = $ErrorActionPreference
    $ErrorActionPreference = 'Continue'
    try {
        & $Exe @Arguments *> $null
        return ($LASTEXITCODE -eq 0)
    } catch {
        return $false
    } finally {
        $ErrorActionPreference = $old
    }
}

function Format-Day([int]$N) { return '{0:D2}' -f $N }

function Get-Phase([int]$N) {
    if ($N -le 30) { return 1 }
    if ($N -le 60) { return 2 }
    return 3
}

function Get-PhaseFolder([int]$Phase) {
    switch ($Phase) {
        1 { return 'phase-1-csharp' }
        2 { return 'phase-2-webapi' }
        default { return 'phase-3-capstone' }
    }
}

function Get-PhaseLabel([int]$Phase) {
    switch ($Phase) {
        1 { return '1 (C# Fundamentals)' }
        2 { return '2 (ASP.NET Core Web API)' }
        default { return '3 (Capstone: HelpdeskLite)' }
    }
}

function Get-Slug([string]$Title) {
    $s = ($Title.ToLowerInvariant() -replace '[^a-z0-9]+', '-').Trim('-')
    if ($s.Length -gt 40) {
        $s = $s.Substring(0, 40)
        $cut = $s.LastIndexOf('-')
        if ($cut -gt 10) { $s = $s.Substring(0, $cut) }
    }
    return $s
}

function Get-Pascal([string]$Slug) {
    $parts = $Slug -split '-' | Where-Object { $_ -ne '' } | ForEach-Object {
        $_.Substring(0, 1).ToUpperInvariant() + $_.Substring(1)
    }
    return ($parts -join '')
}

function Assert-RepoFiles {
    foreach ($p in @($ReadmePath, $RoadmapPath)) {
        if (-not (Test-Path $p)) { Stop-WithError "File not found: $p" }
    }
}

# ---------------------------------------------------------------------------
# ROADMAP.md
# ---------------------------------------------------------------------------
function Get-RoadmapDays {
    $days = @{}
    $current = $null
    foreach ($line in ((Read-Text $RoadmapPath) -split "`r?`n")) {
        $m = [regex]::Match($line, $DayRegex)
        if ($m.Success) {
            $current = [int]$m.Groups[1].Value
            $days[$current] = [pscustomobject]@{
                Number  = $current
                Title   = $m.Groups[2].Value.Trim()
                Bullets = New-Object System.Collections.Generic.List[string]
            }
            continue
        }
        if ($line -match '^(#{1,3} |---)') { $current = $null; continue }
        if (($null -ne $current) -and ($line -match '^\s*- ')) {
            $days[$current].Bullets.Add($line.Trim())
        }
    }
    return $days
}

function Get-RoadmapDay([int]$N) {
    $days = Get-RoadmapDays
    if (-not $days.ContainsKey($N)) { Stop-WithError "Day $(Format-Day $N) not found in ROADMAP.md (heading format: '### Day NN - Title')." }
    return $days[$N]
}

# ---------------------------------------------------------------------------
# README.md progress table
# ---------------------------------------------------------------------------
function Get-Rows {
    $rows = New-Object System.Collections.Generic.List[object]
    foreach ($line in ((Read-Text $ReadmePath) -split "`r?`n")) {
        $m = [regex]::Match($line, $RowRegex)
        if ($m.Success) {
            $rows.Add([pscustomobject]@{
                Day     = [int]$m.Groups[1].Value
                Title   = $m.Groups[2].Value
                Phase   = $m.Groups[3].Value
                Status  = $m.Groups[4].Value
                Date    = $m.Groups[5].Value
                Journal = $m.Groups[6].Value
            })
        }
    }
    return ,$rows
}

function Format-Row($Row) {
    return "| $(Format-Day $Row.Day) | $($Row.Title) | $($Row.Phase) | $($Row.Status) | $($Row.Date) | $($Row.Journal) |"
}

function Update-ProgressBlock([string]$Text, [string]$Nl) {
    $total = 0; $done = 0
    $doing = New-Object System.Collections.Generic.List[string]
    foreach ($line in ($Text -split "`r?`n")) {
        $m = [regex]::Match($line, $RowRegex)
        if (-not $m.Success) { continue }
        $total++
        $st = $m.Groups[4].Value
        if ($st -eq $IconDone) { $done++ }
        elseif ($st -eq $IconDoing) { $doing.Add('Day ' + $m.Groups[1].Value) }
    }
    if ($total -eq 0) { return $Text }
    $pct = [math]::Floor($done * 100 / $total)
    $cur = '-'
    if ($doing.Count -gt 0) { $cur = $doing -join ', ' }
    $line = "**Implementation:** $done / $total exercises ($pct%) $Dot **Current:** $cur $Dot **Last update:** $Today"

    $startTag = '<!-- progress:start -->'
    $endTag = '<!-- progress:end -->'
    $s = $Text.IndexOf($startTag)
    $e = $Text.IndexOf($endTag)
    if ($s -lt 0 -or $e -le $s) { return $Text }
    return $Text.Substring(0, $s + $startTag.Length) + $Nl + $line + $Nl + $Text.Substring($e)
}

function Set-DayRow {
    param([int]$N, [string]$Status, [string]$Date, [string]$Journal)
    $text = Read-Text $ReadmePath
    $nl = Get-Newline $text
    $lines = $text -split "`r?`n"
    $key = Format-Day $N
    $found = $false
    for ($i = 0; $i -lt $lines.Length; $i++) {
        $m = [regex]::Match($lines[$i], $RowRegex)
        if ($m.Success -and $m.Groups[1].Value -eq $key) {
            $row = [pscustomobject]@{
                Day = $N; Title = $m.Groups[2].Value; Phase = $m.Groups[3].Value
                Status = $m.Groups[4].Value; Date = $m.Groups[5].Value; Journal = $m.Groups[6].Value
            }
            if ($Status)  { $row.Status = $Status }
            if ($Date)    { $row.Date = $Date }
            if ($Journal) { $row.Journal = $Journal }
            $lines[$i] = Format-Row $row
            $found = $true
            break
        }
    }
    if (-not $found) { Stop-WithError "Day $key not found in the README progress table. Run '.\day sync'." }
    $text = Update-ProgressBlock ($lines -join $nl) $nl
    Write-Text $ReadmePath $text
}

function Get-RowStatus([int]$N) {
    foreach ($r in (Get-Rows)) { if ($r.Day -eq $N) { return $r.Status } }
    return $null
}

# Active day = first in-progress; otherwise first not started.
function Resolve-Day([int]$N, [string]$Purpose) {
    if ($N -gt 0) { return $N }
    $rows = Get-Rows
    foreach ($r in $rows) { if ($r.Status -eq $IconDoing) { return $r.Day } }
    if ($Purpose -eq 'new') {
        foreach ($r in $rows) { if ($r.Status -eq $IconTodo) { return $r.Day } }
    }
    Stop-WithError "Please give a day number, e.g. '.\day $Purpose 5'."
}

# ---------------------------------------------------------------------------
# Journal and code folders
# ---------------------------------------------------------------------------
function Find-Journal([int]$N) {
    if (-not (Test-Path $JournalDir)) { return $null }
    $hit = Get-ChildItem -Path $JournalDir -Filter "day-$(Format-Day $N)-*.md" -File -ErrorAction SilentlyContinue | Select-Object -First 1
    if ($hit) { return $hit.FullName }
    return $null
}

function Find-DayCodeDir([int]$N) {
    $phaseDir = Join-Parts $Root (Get-PhaseFolder 1)
    if (-not (Test-Path $phaseDir)) { return $null }
    $hit = Get-ChildItem -Path $phaseDir -Directory -Filter "day-$(Format-Day $N)-*" -ErrorAction SilentlyContinue | Select-Object -First 1
    if ($hit) { return $hit.FullName }
    return $null
}

function Get-RelativePath([string]$Path) {
    $full = [System.IO.Path]::GetFullPath($Path)
    $base = [System.IO.Path]::GetFullPath($Root).TrimEnd('\', '/')
    if ($full.StartsWith($base)) { $full = $full.Substring($base.Length).TrimStart('\', '/') }
    return ($full -replace '\\', '/')
}

function Test-Understanding([string]$JournalPath) {
    $text = Read-Text $JournalPath
    $m = [regex]::Match($text, '(?ms)^## (?:What I understood|Yang saya pahami)[^\n]*\n(.*?)(?=^## |\z)')
    if (-not $m.Success) { return $false }
    $body = [regex]::Replace($m.Groups[1].Value, '(?s)<!--.*?-->', '')
    $body = [regex]::Replace($body, '(?m)^\s*[-*]\s*$', '')
    return ($body.Trim().Length -gt 0)
}

function Invoke-Build {
    param([int]$N, [switch]$RequireTarget)
    if (-not (Test-Tool 'dotnet')) {
        Write-Note 'dotnet not found - build verification cannot run.'
        return $false
    }
    $phase = Get-Phase $N
    $target = $null
    if ($phase -eq 1) {
        $dir = Find-DayCodeDir $N
        if ($dir) {
            $proj = Get-ChildItem -Path $dir -Filter '*.csproj' -File -Recurse | Select-Object -First 1
            if ($proj) { $target = $proj.FullName }
        }
    } else {
        $phaseDir = Join-Parts $Root (Get-PhaseFolder $phase)
        if (Test-Path $phaseDir) {
            $sln = Get-ChildItem -Path $phaseDir -Include '*.slnx', '*.sln' -File -Recurse -ErrorAction SilentlyContinue |
                Where-Object { $_.FullName -notmatch '[\\/](bin|obj)[\\/]' } | Select-Object -First 1
            if ($sln) { $target = $sln.FullName }
        }
    }
    if (-not $target) {
        if ($RequireTarget) {
            Write-Note 'No project/solution found - code-only completion requires a build target.'
            return $false
        }
        Write-Note 'No project/solution found for this day - skipping build check.'
        return $true
    }
    Write-Info "Building $(Get-RelativePath $target) ..."
    $code = Invoke-Tool 'dotnet' @('build', $target, '-nologo', '-v', 'q')
    return ($code -eq 0)
}

# ---------------------------------------------------------------------------
# Git helpers
# ---------------------------------------------------------------------------
function Test-GitRepo {
    if (-not (Test-Tool 'git')) { return $false }
    $r = Get-ToolOutput 'git' @('-C', $Root, 'rev-parse', '--is-inside-work-tree')
    return ($r -eq 'true')
}

function Invoke-Commit([string]$Msg) {
    if (-not (Test-GitRepo)) {
        Write-Note "Not a git repo yet - run '.\day init' first. Skipping commit."
        return
    }
    [void](Invoke-Tool 'git' @('-C', $Root, 'add', '-A'))
    $staged = Get-ToolOutput 'git' @('-C', $Root, 'diff', '--cached', '--name-only')
    if (-not $staged) {
        Write-Note 'Nothing to commit.'
        return
    }
    $code = Invoke-Tool 'git' @('-C', $Root, 'commit', '-m', $Msg)
    if ($code -ne 0) { Stop-WithError 'git commit failed (see message above).' }
    Write-Ok "Committed: $Msg"
}

# ---------------------------------------------------------------------------
# Commands
# ---------------------------------------------------------------------------
function Invoke-New {
    Assert-RepoFiles
    $n = Resolve-Day $Day 'new'
    $info = Get-RoadmapDay $n
    $key = Format-Day $n
    $phase = Get-Phase $n
    $slug = Get-Slug $info.Title

    $status = Get-RowStatus $n
    if ($status -eq $IconDone) { Write-Note "Day $key is already marked done. Re-opening files only." }
    foreach ($r in (Get-Rows)) {
        if ($r.Status -eq $IconDoing -and $r.Day -ne $n) { Write-Note "Heads-up: Day $(Format-Day $r.Day) is still in progress." }
    }

    # Code folder (phase 1 = one console project per day)
    $codeRel = Get-PhaseFolder $phase
    if ($phase -eq 1) {
        $codeDir = Find-DayCodeDir $n
        if (-not $codeDir) { $codeDir = Join-Parts $Root (Get-PhaseFolder 1) "day-$key-$slug" }
        $codeRel = Get-RelativePath $codeDir
        if (-not $NoProject -and -not (Test-Path (Join-Parts $codeDir '*.csproj'))) {
            if (Test-Tool 'dotnet') {
                $projName = "Day$key." + (Get-Pascal $slug)
                Write-Info "Creating console project $projName ..."
                $code = Invoke-Tool 'dotnet' @('new', 'console', '-n', $projName, '-o', $codeDir, '--no-update-check', '--no-restore')
                if ($code -ne 0) { Stop-WithError 'dotnet new failed (see message above).' }
            } else {
                Write-Note 'dotnet not found - creating an empty folder only.'
                New-Item -ItemType Directory -Path $codeDir -Force | Out-Null
            }
        }
    }

    # Journal
    if (-not (Test-Path $JournalDir)) { New-Item -ItemType Directory -Path $JournalDir -Force | Out-Null }
    $journal = Find-Journal $n
    if (-not $journal) {
        $journal = Join-Parts $JournalDir "day-$key-$slug.md"
        $tpl = Read-Text $TemplatePath
        $nl = Get-Newline $tpl
        $target = '- (lihat ROADMAP.md)'
        if ($info.Bullets.Count -gt 0) { $target = $info.Bullets -join $nl }
        $codeLink = '[`' + $codeRel + '`](../' + $codeRel + ')'
        $content = $tpl.Replace('{{DAY}}', $key).Replace('{{TITLE}}', $info.Title).Replace('{{DATE}}', $Today)
        $content = $content.Replace('{{PHASE}}', (Get-PhaseLabel $phase)).Replace('{{CODE}}', $codeLink).Replace('{{TARGET}}', $target)
        Write-Text $journal $content
        Write-Ok "Journal created: $(Get-RelativePath $journal)"
    } else {
        Write-Info "Journal exists: $(Get-RelativePath $journal)"
    }

    $journalRel = Get-RelativePath $journal
    if ($status -ne $IconDone) {
        Set-DayRow -N $n -Status $IconDoing -Date $Today -Journal "[journal]($journalRel)"
    }

    Write-Host ''
    Write-Ok "Day $key started: $($info.Title)"
    Write-Host "  Code   : $codeRel"
    Write-Host "  Journal: $journalRel"
    if ($phase -eq 1) { Write-Host "  Run    : dotnet run --project $codeRel" }
    Write-Host "  Finish : .\day done $n"
}

function Invoke-Done {
    Assert-RepoFiles
    $n = Resolve-Day $Day 'done'
    $info = Get-RoadmapDay $n
    $key = Format-Day $n

    $journal = Find-Journal $n
    if (-not $journal -and -not $Force) { Stop-WithError "Journal for Day $key not found. Run '.\day new $n' first." }

    if (-not $Force) {
        if (-not (Test-Understanding $journal)) {
            if ($CodeOnly) {
                Write-Note 'Personal reflection is pending. Verifying implementation only.'
            } else {
                Stop-WithError "Section 'What I understood' in $(Get-RelativePath $journal) is empty or missing. Add your reflection, or use -CodeOnly for verified implementation progress."
            }
        }
        if (-not (Invoke-Build -N $n -RequireTarget:$CodeOnly)) {
            Stop-WithError 'Build verification failed. Fix the errors before completing this day.'
        }
    }

    $journalCell = '-'
    if ($journal) { $journalCell = "[journal]($(Get-RelativePath $journal))" }
    Set-DayRow -N $n -Status $IconDone -Date $Today -Journal $journalCell
    Write-Ok "Day $key implementation marked as complete."

    if (-not $NoCommit) {
        $summary = $info.Title
        if ($Message) { $summary = $Message }
        Invoke-Commit "day-${key}: $summary"
        Write-Info "Next: '.\day push' to publish to GitHub."
    }
}

function Invoke-Skip {
    Assert-RepoFiles
    if ($Day -le 0) { Stop-WithError "Usage: .\day skip N" }
    [void](Get-RoadmapDay $Day)
    $journal = Find-Journal $Day
    $cell = '-'
    if ($journal) { $cell = "[journal]($(Get-RelativePath $journal))" }
    Set-DayRow -N $Day -Status $IconSkip -Date $Today -Journal $cell
    Write-Ok "Day $(Format-Day $Day) marked as skipped. Commit it with your next change (or '.\day done' later)."
}

function Invoke-Sync {
    Assert-RepoFiles
    $days = Get-RoadmapDays
    $old = @{}
    foreach ($r in (Get-Rows)) { $old[$r.Day] = $r }

    $text = Read-Text $ReadmePath
    $nl = Get-Newline $text
    $lines = $text -split "`r?`n"
    $first = -1; $last = -1
    for ($i = 0; $i -lt $lines.Length; $i++) {
        if ([regex]::IsMatch($lines[$i], $RowRegex)) {
            if ($first -lt 0) { $first = $i }
            $last = $i
        }
    }
    if ($first -lt 0) { Stop-WithError 'Progress table not found in README.md.' }

    $newRows = New-Object System.Collections.Generic.List[string]
    foreach ($n in ($days.Keys | Sort-Object)) {
        $row = [pscustomobject]@{ Day = $n; Title = $days[$n].Title; Phase = [string](Get-Phase $n); Status = $IconTodo; Date = '-'; Journal = '-' }
        if ($old.ContainsKey($n)) {
            $row.Status = $old[$n].Status; $row.Date = $old[$n].Date; $row.Journal = $old[$n].Journal
        }
        $newRows.Add((Format-Row $row))
    }
    foreach ($k in $old.Keys) {
        if (-not $days.ContainsKey($k) -and $old[$k].Status -ne $IconTodo) {
            Write-Note "Day $(Format-Day $k) is no longer in ROADMAP.md but has status $($old[$k].Status) - kept in table."
            $newRows.Add((Format-Row $old[$k]))
        }
    }

    $before = @(); if ($first -gt 0) { $before = $lines[0..($first - 1)] }
    $after = @(); if ($last -lt $lines.Length - 1) { $after = $lines[($last + 1)..($lines.Length - 1)] }
    $all = @($before) + @($newRows) + @($after)
    $text = Update-ProgressBlock ($all -join $nl) $nl
    Write-Text $ReadmePath $text
    Write-Ok "README table synced with ROADMAP.md ($($days.Count) days)."
}

function Invoke-Status {
    Assert-RepoFiles
    $rows = Get-Rows
    $total = $rows.Count
    $done = @($rows | Where-Object { $_.Status -eq $IconDone }).Count
    $skip = @($rows | Where-Object { $_.Status -eq $IconSkip }).Count
    $doing = @($rows | Where-Object { $_.Status -eq $IconDoing })
    $next = $rows | Where-Object { $_.Status -eq $IconTodo } | Select-Object -First 1

    $pct = 0
    if ($total -gt 0) { $pct = [math]::Floor($done * 100 / $total) }
    $width = 30
    $filled = 0
    if ($total -gt 0) { $filled = [int][math]::Floor($done * $width / $total) }
    $bar = ('#' * $filled) + ('.' * ($width - $filled))

    Write-Host ''
    Write-Info '90 Days of .NET - status'
    Write-Host "  Progress : [$bar] $done/$total ($pct%)  skipped: $skip"
    if ($doing.Count -gt 0) {
        foreach ($d in $doing) { Write-Host "  Active   : Day $(Format-Day $d.Day) - $($d.Title) (started $($d.Date))" }
    } else {
        Write-Host '  Active   : -'
    }
    if ($next) { Write-Host "  Next     : Day $(Format-Day $next.Day) - $($next.Title)" } else { Write-Host '  Next     : - (all days handled!)' }

    if (Test-GitRepo) {
        $log = @(Get-ToolOutput 'git' @('-C', $Root, 'log', '--date=short', '--format=%ad%x09%s', '-n', '500'))
        $dates = @{}
        foreach ($l in $log) {
            if (-not $l) { continue }
            $parts = $l -split "`t", 2
            if ($parts.Count -eq 2 -and $parts[1] -match '^day-\d+') { $dates[$parts[0]] = $true }
        }
        $streak = 0
        $d = Get-Date
        if (-not $dates.ContainsKey($d.ToString('yyyy-MM-dd'))) { $d = $d.AddDays(-1) }
        while ($dates.ContainsKey($d.ToString('yyyy-MM-dd'))) { $streak++; $d = $d.AddDays(-1) }
        Write-Host "  Streak   : $streak day(s) in a row with a day-NN commit"

        $branch = Get-ToolOutput 'git' @('-C', $Root, 'rev-parse', '--abbrev-ref', 'HEAD')
        $dirty = @(Get-ToolOutput 'git' @('-C', $Root, 'status', '--porcelain')) | Where-Object { $_ }
        Write-Host "  Branch   : $branch  (uncommitted files: $(@($dirty).Count))"
        Write-Host ''
        Write-Info 'Last commits:'
        $recent = Get-ToolOutput 'git' @('-C', $Root, 'log', '--oneline', '-5')
        if ($recent) { $recent | ForEach-Object { Write-Host "  $_" } } else { Write-Host '  (no commits yet)' }
    } else {
        Write-Note "  Git      : not initialised yet - run '.\day init'."
    }
    Write-Host ''
}

function Invoke-Push {
    if (-not (Test-GitRepo)) { Stop-WithError "Not a git repo yet - run '.\day init' first." }
    $remote = Get-ToolOutput 'git' @('-C', $Root, 'remote')
    if (-not $remote) { Stop-WithError "No GitHub remote yet - run '.\day publish' first." }
    $upstream = Get-ToolOutput 'git' @('-C', $Root, 'rev-parse', '--abbrev-ref', '--symbolic-full-name', '@{u}')
    if ($upstream) {
        $code = Invoke-Tool 'git' @('-C', $Root, 'push')
    } else {
        $branch = Get-ToolOutput 'git' @('-C', $Root, 'rev-parse', '--abbrev-ref', 'HEAD')
        $code = Invoke-Tool 'git' @('-C', $Root, 'push', '-u', 'origin', $branch)
    }
    if ($code -ne 0) { Stop-WithError "git push failed. If it says 'fetch first', run: git pull --rebase ; .\day push" }
    Write-Ok 'Pushed to GitHub.'
}

function Invoke-Init {
    Assert-RepoFiles
    Write-Info 'Checking tools...'
    $missing = @()
    foreach ($t in @('git', 'dotnet', 'gh')) {
        if (Test-Tool $t) { Write-Host "  [ok] $t" } else { Write-Host "  [--] $t (not found)"; $missing += $t }
    }
    if ($missing -contains 'git') { Stop-WithError 'Git is required. Install: winget install --id Git.Git -e' }

    $email = Get-ToolOutput 'git' @('config', '--global', 'user.email')
    if (-not $email) { Write-Note "  git user.email is not set. Run: git config --global user.email ""you@example.com"" (same email as GitHub)" }

    if (-not (Test-GitRepo)) {
        $code = Invoke-Tool 'git' @('-C', $Root, 'init', '-b', 'main')
        if ($code -ne 0) { Stop-WithError 'git init failed.' }
    } else {
        Write-Info 'Git repo already initialised.'
    }

    # Install config files kept in templates/ (CI workflow, VS Code recommendations).
    $installs = @(
        @{ From = (Join-Parts $Root 'templates' 'github' 'build.yml');      To = (Join-Parts $Root '.github' 'workflows' 'build.yml') },
        @{ From = (Join-Parts $Root 'templates' 'vscode' 'extensions.json'); To = (Join-Parts $Root '.vscode' 'extensions.json') }
    )
    foreach ($f in $installs) {
        if ((Test-Path $f.From) -and -not (Test-Path $f.To)) {
            New-Item -ItemType Directory -Path (Split-Path -Parent $f.To) -Force | Out-Null
            Copy-Item -Path $f.From -Destination $f.To
            Write-Ok "Installed $(Get-RelativePath $f.To)"
        }
    }

    if (Test-Tool 'gh') {
        $login = Get-ToolOutput 'gh' @('api', 'user', '--jq', '.login')
        if ($login) {
            $text = Read-Text $ReadmePath
            if ($text.Contains('<GITHUB_USERNAME>')) {
                Write-Text $ReadmePath ($text.Replace('<GITHUB_USERNAME>', [string]$login))
                Write-Ok "README badge set for GitHub user '$login'."
            }
        } else {
            Write-Note "  Not logged in to GitHub CLI. Run 'gh auth login' yourself, then '.\day init' again."
        }
    }

    $head = Get-ToolOutput 'git' @('-C', $Root, 'rev-parse', '--verify', 'HEAD')
    if (-not $head) { Invoke-Commit 'chore: initial setup (roadmap, docs, scripts)' }
    else { Invoke-Commit 'chore: update setup' }
    Write-Ok "Init done. Next: '.\day publish'."
}

function Invoke-Publish {
    if (-not (Test-GitRepo)) { Stop-WithError "Run '.\day init' first." }
    if (-not (Test-Tool 'gh')) { Stop-WithError 'GitHub CLI not found. Install: winget install --id GitHub.cli -e' }
    if (-not (Test-ToolOk 'gh' @('auth', 'status'))) { Stop-WithError "Not logged in. Run 'gh auth login' yourself (choose GitHub.com, HTTPS, Yes, web browser)." }

    $remote = Get-ToolOutput 'git' @('-C', $Root, 'remote', 'get-url', 'origin')
    if ($remote) {
        Write-Info "Remote 'origin' already set: $remote"
        Invoke-Push
        return
    }
    $name = Split-Path -Leaf $Root
    $visibility = '--public'
    if ($Private) { $visibility = '--private' }
    $code = Invoke-Tool 'gh' @('repo', 'create', $name, $visibility, '--source', $Root, '--remote', 'origin', '--push',
        '--description', '90 days of learning .NET 10: C#, ASP.NET Core, EF Core, SQL Server, Blazor')
    if ($code -ne 0) { Stop-WithError 'gh repo create failed (see message above).' }
    Write-Ok "Published! Open it with: gh repo view --web"
}

function Show-Help {
    Write-Host @'
day - helper for the 90 Days of .NET repo

  .\day status              progress, active day, next day, streak
  .\day new [N]             start day N (default: active/next day)
  .\day done [N]            finish day N: checks, mark done, commit
  .\day skip N              mark day N as skipped
  .\day sync                sync README table titles with ROADMAP.md
  .\day push                git push
  .\day init                one-time: git init + first commit
  .\day publish [-Private]  one-time: create GitHub repo and push

Options: -Message "text"  -NoProject  -NoCommit  -CodeOnly  -Force
'@
}

switch ($Command.ToLowerInvariant()) {
    'new'     { Invoke-New }
    'start'   { Invoke-New }
    'done'    { Invoke-Done }
    'finish'  { Invoke-Done }
    'skip'    { Invoke-Skip }
    'sync'    { Invoke-Sync }
    'status'  { Invoke-Status }
    'push'    { Invoke-Push }
    'init'    { Invoke-Init }
    'publish' { Invoke-Publish }
    default   { Show-Help }
}
