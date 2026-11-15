[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)] [ValidateRange(1, 90)] [int] $Day,
    [Parameter(Mandatory = $true)] [string] $Project,
    [Parameter(Mandatory = $true)] [string] $Title,
    [Parameter(Mandatory = $true)] [string] $WorkDirectory,
    [string] $Summary = 'Name, local time, and the .NET runtime version.',
    [string[]] $InputLines = @(),
    [ValidateRange(1, 2147483647)] [int] $SourceStartLine = 1,
    [ValidateRange(0, 2147483647)] [int] $SourceLineCount = 0
)

Set-StrictMode -Version 2.0
$ErrorActionPreference = 'Stop'
$repoRoot = [IO.Path]::GetFullPath((Split-Path -Parent $PSScriptRoot))
if ([IO.Path]::IsPathRooted($Project)) { throw 'Project must be relative to the repository root.' }
$projectDirectory = (Resolve-Path -LiteralPath (Join-Path $repoRoot $Project)).Path
if (-not ($projectDirectory + '\').StartsWith($repoRoot.TrimEnd('\') + '\', [StringComparison]::OrdinalIgnoreCase)) {
    throw 'Project must be inside the repository.'
}
$workRoot = [IO.Path]::GetFullPath($WorkDirectory)
$assetRoot = Join-Path $repoRoot 'assets\progress'
$dayLabel = '{0:D2}' -f $Day
$utf8 = New-Object System.Text.UTF8Encoding($false)
$runId = [Guid]::NewGuid().ToString('N')
$runRoot = Join-Path $workRoot ("day-$dayLabel-run-$runId")

function Ensure-Directory([string]$Path) {
    [void][IO.Directory]::CreateDirectory($Path)
}

function Assert-WritableDestinations([string[]]$Paths) {
    foreach ($path in $Paths) {
        if ([IO.Directory]::Exists($path)) { throw "An output destination is a directory: $path" }
        if (-not [IO.File]::Exists($path)) { continue }
        if (([IO.File]::GetAttributes($path) -band [IO.FileAttributes]::ReadOnly) -ne 0) {
            throw "Output is read-only; existing evidence was not changed: $path"
        }
        $stream = [IO.File]::Open($path, [IO.FileMode]::Open, [IO.FileAccess]::ReadWrite, [IO.FileShare]::ReadWrite)
        $stream.Dispose()
    }
}

function Invoke-CapturedDotnet([string]$Arguments, [string[]]$Lines = @()) {
    $startInfo = New-Object Diagnostics.ProcessStartInfo
    $startInfo.FileName = (Get-Command dotnet -ErrorAction Stop).Source
    $startInfo.Arguments = $Arguments
    $startInfo.WorkingDirectory = $projectDirectory
    $startInfo.UseShellExecute = $false
    $startInfo.CreateNoWindow = $true
    $startInfo.RedirectStandardInput = $true
    $startInfo.RedirectStandardOutput = $true
    $startInfo.RedirectStandardError = $true
    $process = New-Object Diagnostics.Process
    $process.StartInfo = $startInfo
    try {
        [void]$process.Start()
        $stdoutTask = $process.StandardOutput.ReadToEndAsync()
        $stderrTask = $process.StandardError.ReadToEndAsync()
        foreach ($line in $Lines) { $process.StandardInput.WriteLine($line) }
        $process.StandardInput.Close()
        if (-not $process.WaitForExit(120000)) {
            $process.Kill()
            throw "dotnet $Arguments exceeded 120 seconds."
        }
        $process.WaitForExit()
        return [pscustomobject]@{ ExitCode = $process.ExitCode; Stdout = $stdoutTask.Result; Stderr = $stderrTask.Result }
    } finally {
        $process.Dispose()
    }
}

function Split-Output([string]$Value) {
    if ($Value.Length -eq 0) { return @() }
    return @($Value.TrimEnd("`r", "`n") -split '\r?\n')
}

function Assert-Png([string]$Path, [int]$Width, [int]$Height) {
    if (-not [IO.File]::Exists($Path)) { throw "The browser did not produce a fresh PNG: $Path" }
    $bytes = [IO.File]::ReadAllBytes($Path)
    $signature = @(137, 80, 78, 71, 13, 10, 26, 10)
    if ($bytes.Length -lt 24) { throw "The browser produced an incomplete PNG: $Path" }
    for ($index = 0; $index -lt $signature.Count; $index++) {
        if ($bytes[$index] -ne $signature[$index]) { throw "Invalid PNG signature: $Path" }
    }
    $image = [Drawing.Image]::FromFile($Path)
    try {
        if ($image.Width -ne $Width -or $image.Height -ne $Height) {
            throw "Unexpected PNG dimensions for $Path; expected ${Width}x${Height}."
        }
    } finally { $image.Dispose() }
}

function Publish-Evidence([string[]]$Names) {
    Ensure-Directory $assetRoot
    $destinations = @($Names | ForEach-Object { Join-Path $assetRoot $_ })
    Assert-WritableDestinations $destinations
    $backupRoot = Join-Path $runRoot 'previous-evidence'
    Ensure-Directory $backupRoot
    $entries = New-Object System.Collections.Generic.List[object]
    try {
        foreach ($name in $Names) {
            $destination = Join-Path $assetRoot $name
            $pending = Join-Path $assetRoot ('.export-' + $runId + '-' + $name + '.tmp')
            $backup = Join-Path $backupRoot $name
            $existed = [IO.File]::Exists($destination)
            if ($existed) { [IO.File]::Copy($destination, $backup) }
            $entry = [pscustomobject]@{ Destination = $destination; Pending = $pending; Backup = $backup; Existed = $existed; Attempted = $false }
            $entries.Add($entry)
            [IO.File]::Copy((Join-Path $runRoot $name), $pending)
        }
        Assert-WritableDestinations $destinations
        foreach ($entry in $entries) {
            $entry.Attempted = $true
            if ($entry.Existed) { [IO.File]::Replace($entry.Pending, $entry.Destination, [NullString]::Value) }
            else { [IO.File]::Move($entry.Pending, $entry.Destination) }
        }
    } catch {
        $publicationError = $_.Exception.Message
        $rollbackErrors = New-Object System.Collections.Generic.List[string]
        for ($index = $entries.Count - 1; $index -ge 0; $index--) {
            $entry = $entries[$index]
            if (-not $entry.Attempted) { continue }
            try {
                if ($entry.Existed) {
                    Assert-WritableDestinations @($entry.Destination)
                    $restore = $entry.Pending + '.restore'
                    [IO.File]::Copy($entry.Backup, $restore)
                    if ([IO.File]::Exists($entry.Destination)) { [IO.File]::Replace($restore, $entry.Destination, [NullString]::Value) }
                    else { [IO.File]::Move($restore, $entry.Destination) }
                } elseif ([IO.File]::Exists($entry.Destination)) {
                    [IO.File]::Delete($entry.Destination)
                }
            } catch { $rollbackErrors.Add($_.Exception.Message) }
        }
        if ($rollbackErrors.Count -gt 0) {
            throw ("Evidence publication failed: $publicationError Rollback needs attention: " + ($rollbackErrors -join '; ') + ". Backups: $backupRoot")
        }
        throw "Evidence publication failed; prior evidence was preserved: $publicationError"
    } finally {
        foreach ($entry in $entries) {
            if ([IO.File]::Exists($entry.Pending)) {
                try { [IO.File]::Delete($entry.Pending) } catch { Write-Warning $_.Exception.Message }
            }
        }
    }
}

if (-not (Get-Command dotnet -ErrorAction SilentlyContinue)) {
    $sdkDirectory = Join-Path $env:ProgramFiles 'dotnet'
    if (Test-Path -LiteralPath (Join-Path $sdkDirectory 'dotnet.exe')) { $env:Path = $sdkDirectory + ';' + $env:Path }
    else { throw 'Install the .NET 10 SDK before exporting.' }
}
$browser = @(
    'C:\Program Files\Google\Chrome\Application\chrome.exe',
    'C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe',
    'C:\Program Files\Microsoft\Edge\Application\msedge.exe'
) | Where-Object { Test-Path -LiteralPath $_ } | Select-Object -First 1
if (-not $browser) { throw 'An installed Chrome or Edge browser is required for PNG export.' }
foreach ($line in $InputLines) { if ($line -match '[\r\n]') { throw 'Each InputLines entry must contain one line only.' } }
$names = @("day-$dayLabel-capture.json", "day-$dayLabel-output.txt", "day-$dayLabel-terminal.png", "day-$dayLabel-social.png")
Assert-WritableDestinations @($names | ForEach-Object { Join-Path $assetRoot $_ })
Ensure-Directory $runRoot
Add-Type -AssemblyName System.Drawing

$sourceFile = Join-Path $projectDirectory 'Program.cs'
if (-not [IO.File]::Exists($sourceFile)) { throw 'Program.cs is required to capture the source.' }
$source = [IO.File]::ReadAllText($sourceFile)
$sourceLines = [IO.File]::ReadAllLines($sourceFile)
if ($SourceStartLine -gt $sourceLines.Length) { throw 'SourceStartLine is outside Program.cs.' }
$excerptCount = $sourceLines.Length - $SourceStartLine + 1
if ($SourceLineCount -gt 0) { $excerptCount = [Math]::Min($excerptCount, $SourceLineCount) }
$sourceEndLine = $SourceStartLine + $excerptCount - 1
$sourceExcerpt = $sourceLines[($SourceStartLine - 1)..($sourceEndLine - 1)] -join [Environment]::NewLine
$sourceLabel = "Program.cs / lines $SourceStartLine-$sourceEndLine"

$sdkResult = Invoke-CapturedDotnet '--version'
if ($sdkResult.ExitCode -ne 0) { throw $sdkResult.Stderr }
$sdk = $sdkResult.Stdout.Trim()
$buildResult = Invoke-CapturedDotnet 'build -c Release'
if ($buildResult.ExitCode -ne 0) { throw ($buildResult.Stdout + $buildResult.Stderr) }
$runResult = Invoke-CapturedDotnet 'run -c Release --no-build' $InputLines
if ($runResult.ExitCode -ne 0) { throw ($runResult.Stdout + $runResult.Stderr) }
$buildOutput = @(Split-Output $buildResult.Stdout)
$runOutput = @(Split-Output $runResult.Stdout)
$runCommand = 'dotnet run -c Release --no-build'
if ($InputLines.Count -gt 0) {
    $literals = @($InputLines | ForEach-Object { "'" + $_.Replace("'", "''") + "'" })
    $runCommand = '@(' + ($literals -join ', ') + ') | ' + $runCommand
}
$capture = [ordered]@{
    day = $Day
    recordedAt = [DateTimeOffset]::Now.ToString('o')
    project = $Project
    sdk = $sdk
    source = $source
    sourceExcerpt = $sourceExcerpt
    sourceStartLine = $SourceStartLine
    sourceEndLine = $sourceEndLine
    inputLines = @($InputLines)
    buildCommand = 'dotnet build -c Release'
    buildExitCode = $buildResult.ExitCode
    buildOutput = $buildOutput
    buildStandardError = $buildResult.Stderr
    runCommand = $runCommand
    runExitCode = $runResult.ExitCode
    runOutput = $runOutput
    runStandardError = $runResult.Stderr
}
$transcript = @('> dotnet build -c Release') + $buildOutput
if ($buildResult.Stderr) { $transcript += @('stderr:') + @(Split-Output $buildResult.Stderr) }
$transcript += @('', ('> ' + $runCommand)) + $runOutput
if ($runResult.Stderr) { $transcript += @('stderr:') + @(Split-Output $runResult.Stderr) }
[IO.File]::WriteAllText((Join-Path $runRoot $names[0]), ($capture | ConvertTo-Json -Depth 6), $utf8)
[IO.File]::WriteAllText((Join-Path $runRoot $names[1]), ($transcript -join [Environment]::NewLine), $utf8)

$summaryLines = @($buildOutput | Where-Object { $_ -match 'Build succeeded\.|^\s*\d+ Warning\(s\)|^\s*\d+ Error\(s\)' } | ForEach-Object { $_.Trim() })
if ($summaryLines.Count -eq 0) { $summaryLines = $buildOutput }
$terminalText = @('> dotnet build -c Release') + $summaryLines + @('', ('> ' + $runCommand)) + $runOutput
if ($buildResult.Stderr) { $terminalText += @('Build stderr:') + @(Split-Output $buildResult.Stderr) }
if ($runResult.Stderr) { $terminalText += @('Run stderr:') + @(Split-Output $runResult.Stderr) }
function Encode-Html([string]$Value) { return [Net.WebUtility]::HtmlEncode($Value) }
$html = @'
<!doctype html>
<html lang="en">
<meta charset="utf-8">
<title>Day __DAY__ | .NET 10</title>
<style>
*{box-sizing:border-box}html,body{margin:0;width:100%;height:100%;overflow:hidden}
body{background:#111318;color:#f3f4f6;font-family:"Segoe UI",Arial,sans-serif}
main{height:100%;padding:44px 48px;display:flex;flex-direction:column}
.eyebrow{font-size:22px;color:#b5bdc9;margin:0 0 10px}
h1{font-size:56px;font-weight:650;letter-spacing:-1px;line-height:1.08;margin:0 0 14px}
.intro{font-size:22px;color:#b5bdc9;line-height:1.35;margin:0 0 26px}
.panels{display:grid;grid-template-columns:1fr 1fr;gap:24px;flex:1;min-height:0}
section{background:#181b21;border:1px solid #383d47;border-radius:10px;padding:22px;min-width:0;min-height:0;display:flex;flex-direction:column}
.label{font-size:18px;color:#b5bdc9;margin:0 0 14px;flex:none}
pre{font-family:"Cascadia Mono",Consolas,monospace;font-size:23px;line-height:1.4;white-space:pre-wrap;overflow-wrap:anywhere;margin:0;flex:1;min-height:0;overflow:hidden}
.result pre{font-size:22px}.status{font-size:17px;color:#a2dbb3;margin:16px 0 0;flex:none}
footer{display:flex;justify-content:space-between;gap:20px;font-size:18px;color:#b5bdc9;padding-top:22px;flex:none}
@media(max-aspect-ratio:4/3){
main{padding:48px}.eyebrow{font-size:23px}h1{font-size:56px}.intro{font-size:23px;margin-bottom:24px}
.panels{grid-template-columns:1fr;grid-template-rows:minmax(0,.42fr) minmax(0,.58fr);gap:22px}
pre{font-size:25px}.result pre{font-size:24px}footer{font-size:18px;flex-direction:column;gap:6px;padding-top:20px}
}
</style>
<main>
<header><p class="eyebrow">Day __DAY__ / .NET 10</p><h1>__TITLE__</h1>
<p class="intro">__SUMMARY__<br>Muhammad Iqra Nur Fajar</p></header>
<div class="panels">
<section><p class="label">__SOURCE_LABEL__</p><pre>__SOURCE__</pre><p class="status">SDK __SDK__ &middot; net10.0</p></section>
<section class="result"><p class="label">Commands and output</p><pre>__TERMINAL__</pre></section>
</div>
<footer><span>github.com/iqraa07/dotnet-90-days</span><span>Captured from a program run</span></footer>
</main>
<script>
for(const pre of document.querySelectorAll('pre')){
  const minimum=innerHeight>innerWidth?18:16;
  let size=parseFloat(getComputedStyle(pre).fontSize);
  while((pre.scrollHeight>pre.clientHeight+1||pre.scrollWidth>pre.clientWidth+1)&&size>minimum){
    size-=.5;pre.style.fontSize=size+'px';
  }
}
</script>
</html>
'@
$html = $html.Replace('__DAY__', $dayLabel).Replace('__TITLE__', (Encode-Html $Title))
$html = $html.Replace('__SUMMARY__', (Encode-Html $Summary)).Replace('__SOURCE_LABEL__', (Encode-Html $sourceLabel))
$html = $html.Replace('__SOURCE__', (Encode-Html $sourceExcerpt)).Replace('__SDK__', (Encode-Html $sdk))
$html = $html.Replace('__TERMINAL__', (Encode-Html ($terminalText -join [Environment]::NewLine)))
$htmlPath = Join-Path $runRoot "day-$dayLabel.html"
[IO.File]::WriteAllText($htmlPath, $html, $utf8)
$htmlUri = ([Uri]$htmlPath).AbsoluteUri

foreach ($size in @(
    @{ Name = 'terminal'; Width = 1600; Height = 900 },
    @{ Name = 'social'; Width = 1080; Height = 1350 }
)) {
    $output = Join-Path $runRoot ("day-$dayLabel-" + $size.Name + '.png')
    $arguments = @(
        '--headless=new', '--disable-gpu', '--hide-scrollbars',
        '--no-first-run', '--no-default-browser-check', '--disable-background-networking',
        '--force-device-scale-factor=1', ('--window-size={0},{1}' -f $size.Width, $size.Height),
        ('--user-data-dir="{0}"' -f (Join-Path $runRoot ('browser-' + $size.Name))),
        ('--screenshot="{0}"' -f $output), $htmlUri
    )
    $process = Start-Process -FilePath $browser -ArgumentList $arguments -WindowStyle Hidden -PassThru -RedirectStandardError (Join-Path $runRoot ($size.Name + '-browser.log'))
    # Cache the handle before waiting so Windows PowerShell retains the exit code.
    $browserHandle = $process.Handle
    try {
        if (-not $process.WaitForExit(30000)) {
            Stop-Process -Id $process.Id -ErrorAction SilentlyContinue
            throw 'Browser export exceeded 30 seconds.'
        }
        $process.WaitForExit()
        $process.Refresh()
        if ($process.ExitCode -ne 0) { throw ("Browser export failed with exit code " + $process.ExitCode + ". Logs: $runRoot") }
    } finally { $process.Dispose() }
    Assert-Png $output $size.Width $size.Height
}

Publish-Evidence $names
foreach ($name in $names) { Write-Output (Join-Path $assetRoot $name) }
Write-Output ("Staging records: $runRoot")
