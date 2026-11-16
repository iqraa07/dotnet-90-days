# Day 05: Loops

Guess a number from 1 to 100. Each valid guess uses one of seven attempts. The program reports whether to guess higher or lower and offers another round at the end.

## Run the example

From the repository root, build and run the example in PowerShell.

```powershell
dotnet build .\phase-1-csharp\day-05-loops -c Release
@('50') | dotnet run --project .\phase-1-csharp\day-05-loops -c Release --no-build
```

## How it works

A `while` loop counts guesses, another loop handles replay, and `continue` skips invalid guesses without consuming an attempt. Each round calls `Random.Shared`. Set the optional environment variable `GUESS_TARGET` to a number from 1 to 100 to repeat a specific example. Without it, each round picks a new random number.

## Verification

The Release build and 5 CLI checks passed. See the [daily overview](../../days/day-05/README.md) and [check transcript](../../assets/progress/day-05-checks.txt).
