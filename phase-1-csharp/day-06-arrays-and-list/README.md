# Day 06: Arrays and List

An in-memory network device list supports add, view, and delete by displayed number. The numbered menu uses a fixed array, while devices belong to a growable `List<string>`.

## Run the example

From the repository root, build and run the example in PowerShell.

```powershell
dotnet build .\phase-1-csharp\day-06-arrays-and-list -c Release
@('1', 'Edge router', '2', '3', '1', '2', '0') | dotnet run --project .\phase-1-csharp\day-06-arrays-and-list -c Release --no-build
```

## How it works

Display numbers start at one. A list index starts at zero, so deletion uses `RemoveAt(number - 1)` after checking the range. Device labels can repeat. Closing input or selecting 0 exits.

## Verification

The Release build and 4 CLI checks passed. See the [daily overview](../../days/day-06/README.md) and [check transcript](../../assets/progress/day-06-checks.txt).
