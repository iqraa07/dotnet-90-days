# Day 02: Variables and Data Types

**Implementation:** In progress. Temperature conversion is verified; two data-size conversion tasks remain.

**Personal reflection:** Pending.

## Focus

`int`, `long`, `double`, `decimal`, `bool`, `char`, `string`, `var`, `const`, input with `Console.ReadLine()`, and `int.Parse` versus `int.TryParse`.

## Run

From the repository root:

```powershell
dotnet run --project .\phase-1-csharp\day-02-variables-and-data-types
```

Enter a Celsius value using `.` for decimals. For example, `0` produces Fahrenheit `32.00` and Kelvin `273.15`. Text, non-finite values, comma decimals, and temperatures below `-273.15` are rejected.

## Work to finish

1. Complete MB input and validation at [Program.cs, line 34](../../phase-1-csharp/day-02-variables-and-data-types/Program.cs#L34).
2. Add decimal MB-to-GB-to-TB conversion at [Program.cs, line 38](../../phase-1-csharp/day-02-variables-and-data-types/Program.cs#L38), then replace the pending message.

[Exercise instructions and expected results](../../phase-1-csharp/day-02-variables-and-data-types/README.md) · [Day 02 journal](../../journal/day-02-variables-and-data-types.md)

## Verification

The temperature section passed [13 CLI checks](../../assets/progress/day-02-checks.txt). Release build completed with 0 warnings and 0 errors. The data-size section is still an exercise to complete.

[Full outline](../../ROADMAP.md#day-02--variables-and-data-types) · [Daily progress](../../README.md#daily-progress) · [Day catalog](../README.md)
