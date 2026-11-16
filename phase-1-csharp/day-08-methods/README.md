# Day 08: Methods

The default mode accepts an IPv4 prefix and displays the number of usable hosts under the traditional network-and-broadcast rule. Two other modes extract calculation patterns from the Day 02 temperature converter and Day 03 receipt.

## Run the example

From the repository root, build and run the example in PowerShell.

```powershell
dotnet build .\phase-1-csharp\day-08-methods -c Release
@('24') | dotnet run --project .\phase-1-csharp\day-08-methods -c Release --no-build
```

## How it works

Run with `-- temperature` or `-- receipt` after the project options to try the method examples. `CalculateSubnet` returns a `long` so `/0` fits. Under this exercise’s counting rule, `/31` and `/32` return zero. The demos show an overload, a default parameter, tuple results, and `out` via `TryParse`.

## Verification

The Release build and 10 CLI checks passed. See the [daily overview](../../days/day-08/README.md) and [check transcript](../../assets/progress/day-08-checks.txt).
