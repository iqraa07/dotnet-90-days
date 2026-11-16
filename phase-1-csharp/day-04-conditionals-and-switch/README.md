# Day 04: Conditionals and Switch

The program reads an incident's impact and urgency as `low`, `medium`, or `high`. It maps the combination to a priority and uses a switch expression to choose a resolution target.

## Run the example

From the repository root, build and run the example in PowerShell.

```powershell
dotnet build .\phase-1-csharp\day-04-conditionals-and-switch -c Release
@('high', 'high') | dotnet run --project .\phase-1-csharp\day-04-conditionals-and-switch -c Release --no-build
```

## How it works

High impact and high urgency produce P1. High + medium produces P2. Low + low produces P4. The remaining combinations produce P3. The example targets are P1 = 4 hours, P2 = 8 hours, P3 = 24 hours, and P4 = 48 hours.

## Verification

The Release build and 6 CLI checks passed. See the [daily overview](../../days/day-04/README.md) and [check transcript](../../assets/progress/day-04-checks.txt).
