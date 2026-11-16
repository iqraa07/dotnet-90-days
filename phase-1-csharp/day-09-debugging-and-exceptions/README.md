# Day 09: Debugging and Exceptions

Calculate the count, sum, and average of comma-separated integers. Invalid input produces a short diagnostic, and the `finally` block reports the end of each run.

## Run

Use PowerShell from the repository root.

```powershell
'4,7,9' | dotnet run --project .\phase-1-csharp\day-09-debugging-and-exceptions -c Release
```

`4,7,9` produces a count of `3`, a sum of `20`, and an average of `6.67`.

## Implementation

[Program.cs](Program.cs) parses signed 32-bit integers and accumulates them in a `long`. Casting the sum to `decimal` before dividing retains the fraction. A `FormatException` becomes an input error with exit code `1`. The `finally` block runs for successful and invalid input.

## Three debugging observations

| Bug in isolated copy | Observation | Fix in the exercise |
| --- | --- | --- |
| Inclusive loop bounds | Trace showed `index=3, length=3`, then the stack pointed to `SumNumbers` with `IndexOutOfRangeException` | Use `index < values.Length` |
| Integer division | Trace showed `sum=20, count=3` alongside an average of `6.00` | Cast the sum before division |
| Missing empty-input guard | An empty array reached the average expression and threw `DivideByZeroException` | Reject empty input before calculating |

The three bugs were reproduced with isolated Debug builds, diagnostic prints, and stack traces. To inspect the variables in VS Code with a .NET debugger, put a breakpoint before `SumNumbers(values)`, use Step Into to enter the method, and watch `index`, `values.Length`, and `sum`. Use Step Over at the division to inspect `average`.

## Verification

The Release build passed with zero warnings and zero errors. See the [sample run](../../assets/progress/day-09-output.txt) and [independent checks](../../assets/progress/day-09-checks.txt).

[Daily overview](../../days/day-09/README.md) · [Journal](../../journal/day-09-debugging-and-exceptions.md)
