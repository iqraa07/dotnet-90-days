[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)] [ValidateRange(1, 90)] [int] $Day,
    [Parameter(Mandatory = $true)] [string] $Project,
    [Parameter(Mandatory = $true)] [string] $Title,
    [Parameter(Mandatory = $true)] [string] $WorkDirectory,
    [string] $Summary = 'Name, local time, and the .NET runtime version.'
)

Set-StrictMode -Version 2.0
$ErrorActionPreference = 'Stop'
$repoRoot = Split-Path -Parent $PSScriptRoot
$projectDirectory = (Resolve-Path -LiteralPath (Join-Path $repoRoot $Project)).Path
$workRoot = [IO.Path]::GetFullPath($WorkDirectory)
$assetRoot = Join-Path $repoRoot 'assets\progress'
$dayLabel = '{0:D2}' -f $Day
$utf8 = New-Object System.Text.UTF8Encoding($false)

if (-not (Get-Command dotnet -ErrorAction SilentlyContinue)) {
    $sdkDirectory = Join-Path $env:ProgramFiles 'dotnet'
    if (Test-Path -LiteralPath (Join-Path $sdkDirectory 'dotnet.exe')) {
        $env:Path = $sdkDirectory + ';' + $env:Path
    } else {
        throw 'Install the .NET 10 SDK before exporting.'
    }
}

$browser = @(
    'C:\Program Files\Google\Chrome\Application\chrome.exe',
    'C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe',
    'C:\Program Files\Microsoft\Edge\Application\msedge.exe'
) | Where-Object { Test-Path -LiteralPath $_ } | Select-Object -First 1
if (-not $browser) { throw 'An installed Chrome or Edge browser is required for PNG export.' }

New-Item -ItemType Directory -Path $workRoot, $assetRoot -Force | Out-Null
Push-Location $projectDirectory
try {
    $sdk = [string](& dotnet --version)
    $buildOutput = @(& dotnet build -c Release 2>&1 | ForEach-Object { $_.ToString() })
    $buildExit = $LASTEXITCODE
    if ($buildExit -ne 0) { throw ($buildOutput -join [Environment]::NewLine) }
    $runOutput = @(& dotnet run -c Release --no-build 2>&1 | ForEach-Object { $_.ToString() })
    $runExit = $LASTEXITCODE
    if ($runExit -ne 0) { throw ($runOutput -join [Environment]::NewLine) }
} finally {
    Pop-Location
}

$sourceFile = Join-Path $projectDirectory 'Program.cs'
$source = if (Test-Path -LiteralPath $sourceFile) { [IO.File]::ReadAllText($sourceFile) } else { '' }
$recordedAt = [DateTimeOffset]::Now.ToString('o')
$capture = [ordered]@{
    day = $Day
    recordedAt = $recordedAt
    project = $Project
    sdk = $sdk.Trim()
    source = $source
    buildCommand = 'dotnet build -c Release'
    buildExitCode = $buildExit
    buildOutput = $buildOutput
    runCommand = 'dotnet run -c Release --no-build'
    runExitCode = $runExit
    runOutput = $runOutput
}
$capturePath = Join-Path $assetRoot "day-$dayLabel-capture.json"
[IO.File]::WriteAllText($capturePath, ($capture | ConvertTo-Json -Depth 5), $utf8)
$transcript = @('> dotnet build -c Release') + $buildOutput +
    @('', '> dotnet run -c Release --no-build') + $runOutput
[IO.File]::WriteAllText((Join-Path $assetRoot "day-$dayLabel-output.txt"), ($transcript -join [Environment]::NewLine), $utf8)

$summaryLines = @($buildOutput | Where-Object { $_ -match 'Build succeeded\.|^\s*\d+ Warning\(s\)|^\s*\d+ Error\(s\)' })
if ($summaryLines.Count -eq 0) { $summaryLines = $buildOutput }
function Encode-Html([string]$Value) { return [Net.WebUtility]::HtmlEncode($Value) }
$terminalText = @('> dotnet build -c Release') + $summaryLines +
    @('', '> dotnet run -c Release --no-build') + $runOutput

$html = @'
<!doctype html>
<html lang="en">
<meta charset="utf-8">
<title>Day __DAY__ | .NET 10</title>
<style>
*{box-sizing:border-box}html,body{margin:0;width:100%;height:100%;overflow:hidden}
body{background:#111318;color:#f3f4f6;font-family:"Segoe UI",Arial,sans-serif}
main{height:100%;padding:64px;display:flex;flex-direction:column}
.eyebrow{font-size:24px;color:#b5bdc9;margin:0 0 12px}
h1{font-size:64px;font-weight:650;letter-spacing:-1.8px;line-height:1.08;margin:0 0 18px}
.intro{font-size:24px;color:#b5bdc9;line-height:1.4;margin:0 0 36px}
.panels{display:grid;grid-template-columns:1fr 1fr;gap:28px;flex:1;min-height:0}
section{background:#181b21;border:1px solid #383d47;border-radius:10px;padding:28px;min-width:0}
.label{font-size:20px;color:#b5bdc9;margin:0 0 28px}
pre{font-family:"Cascadia Mono",Consolas,monospace;font-size:21px;line-height:1.65;white-space:pre-wrap;overflow-wrap:anywhere;margin:0}
.result pre{font-size:22px}.status{font-size:19px;color:#a2dbb3;margin:30px 0 0}
footer{display:flex;justify-content:space-between;gap:24px;font-size:19px;color:#b5bdc9;padding-top:30px}
@media(max-aspect-ratio:4/3){
main{padding:62px}.eyebrow{font-size:25px}h1{font-size:70px}.intro{font-size:26px;margin-bottom:34px}
.panels{grid-template-columns:1fr;grid-template-rows:auto 1fr;gap:24px}
section{padding:30px}.label{margin-bottom:20px}pre,.result pre{font-size:25px;line-height:1.6}
.status{margin-top:18px}footer{font-size:20px;flex-direction:column;gap:8px;padding-top:26px}
}
</style>
<main>
<header><p class="eyebrow">Day __DAY__ / .NET 10</p><h1>__TITLE__</h1>
<p class="intro">__SUMMARY__<br>Muhammad Iqra Nur Fajar</p></header>
<div class="panels">
<section><p class="label">Program.cs</p><pre>__SOURCE__</pre><p class="status">SDK __SDK__ &middot; net10.0</p></section>
<section class="result"><p class="label">Commands and output</p><pre>__TERMINAL__</pre></section>
</div>
<footer><span>github.com/iqraa07/dotnet-90-days</span><span>Captured from a program run</span></footer>
</main>
</html>
'@
$html = $html.Replace('__DAY__', $dayLabel)
$html = $html.Replace('__TITLE__', (Encode-Html $Title))
$html = $html.Replace('__SUMMARY__', (Encode-Html $Summary))
$html = $html.Replace('__SOURCE__', (Encode-Html $source.Trim()))
$html = $html.Replace('__SDK__', (Encode-Html $sdk.Trim()))
$html = $html.Replace('__TERMINAL__', (Encode-Html ($terminalText -join [Environment]::NewLine)))
$htmlPath = Join-Path $workRoot "day-$dayLabel.html"
[IO.File]::WriteAllText($htmlPath, $html, $utf8)
$htmlUri = ([Uri]$htmlPath).AbsoluteUri

foreach ($size in @(
    @{ Name = 'terminal'; Width = 1600; Height = 900 },
    @{ Name = 'social'; Width = 1080; Height = 1350 }
)) {
    $output = Join-Path $assetRoot ("day-$dayLabel-" + $size.Name + '.png')
    $profile = Join-Path $workRoot ('browser-' + $size.Name)
    $arguments = @(
        '--headless=new', '--disable-gpu', '--hide-scrollbars',
        '--no-first-run', '--no-default-browser-check',
        '--disable-background-networking', '--force-device-scale-factor=1',
        ('--window-size={0},{1}' -f $size.Width, $size.Height),
        ('--user-data-dir="{0}"' -f $profile),
        ('--screenshot="{0}"' -f $output), $htmlUri
    )
    $startOptions = @{
        FilePath = $browser
        ArgumentList = $arguments
        WindowStyle = 'Hidden'
        PassThru = $true
        RedirectStandardError = (Join-Path $workRoot ($size.Name + '-browser.log'))
    }
    $process = Start-Process @startOptions
    if (-not $process.WaitForExit(30000)) {
        Stop-Process -Id $process.Id -ErrorAction SilentlyContinue
        throw 'Browser export exceeded 30 seconds.'
    }
    if (-not (Test-Path -LiteralPath $output)) { throw "Screenshot export failed: $output" }
    Write-Output $output
}
Write-Output $capturePath
