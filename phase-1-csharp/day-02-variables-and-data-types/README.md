# Day 02: Variables and Data Types

Implementation is in progress. Temperature conversion is implemented and verified; two data-size conversion tasks remain. Personal reflection is pending.

## Run

Use .NET SDK 10.0.x. From the repository root:

```powershell
dotnet build .\phase-1-csharp\day-02-variables-and-data-types
dotnet run --project .\phase-1-csharp\day-02-variables-and-data-types
```

Enter one Celsius value using `.` for decimals. The program prints Fahrenheit and Kelvin with two decimal places.

| Celsius input | Fahrenheit | Kelvin |
|---|---|---|
| `0` | `32.00` | `273.15` |
| `100` | `212.00` | `373.15` |
| `-40` | `-40.00` | `233.15` |
| `25.5` | `77.90` | `298.65` |

The program rejects text, comma decimals such as `25,5`, non-finite values, and temperatures below `-273.15`. It also rejects inputs whose converted results exceed the supported numeric range.

Until the exercise below is implemented, valid temperature input ends with `Data-size conversion: exercise pending.`

The temperature converter passed [13 recorded CLI checks](../../assets/progress/day-02-checks.txt). These checks cover the implemented temperature section; the data-size exercise remains pending.

## Concepts

1. `Console.ReadLine()` reads text and can return `null` when input ends.
2. `Parse` throws for invalid numeric text; `TryParse` reports failure without that exception. `InvariantCulture` keeps `.` as the decimal separator.
3. `double.IsFinite` rejects `NaN` and infinity, including overflow results.
4. `var` infers a local variable's type at compile time. `const` declares a compile-time constant.
5. Arithmetic converts Celsius to Fahrenheit and Kelvin; `F2` formats each result with two decimal places.

| Type or keyword | Use | Example |
|---|---|---|
| `int` | 32-bit whole number | `42` |
| `long` | 64-bit whole number | `3_000_000_000L` |
| `double` | Floating-point measurements | `25.5` |
| `decimal` | Decimal arithmetic | `19.99m` |
| `bool` | True/false value | `true` |
| `char` | Character literal | `'C'` |
| `string` | Text | `"Celsius"` |
| `var` | Infer a local variable's type | `var attempts = 3;` |
| `const` | Compile-time constant | `const int MaxAttempts = 3;` |

A small variable example:

```csharp
int attempts = 3;
Console.WriteLine(attempts);
```

## Your exercise

Complete the two `TODO(you)` blocks in [Program.cs](Program.cs):

1. **Lines 34-36:** read an MB value with `Console.ReadLine`. Use `double.TryParse` and `double.IsFinite` to accept finite, nonnegative numbers and reject invalid input with a clear message.
2. **Lines 38-40:** calculate and print GB and TB using decimal SI units: 1 GB = 1000 MB and 1 TB = 1000 GB. Store the converted values in variables. Replace the pending message currently on line 42.

Expected results after completing the exercise:

| MB input | GB output | TB output |
|---|---|---|
| `1000` | `1.000` | `0.001000` |
| `1000000` | `1000.000` | `1.000000` |

Zero is valid. Text, negative values, and non-finite numbers must produce a clear message and a clean exit. Use the temperature input handling as a pattern; the data-size implementation is left for you.

## Check your work

- Build succeeds without errors or warnings.
- The four temperature examples still produce the expected results.
- Invalid Celsius input is rejected without a crash.
- The data-size examples pass, invalid MB input is rejected, and the pending message is gone.
- Add your own notes under `What I understood` in the [Day 02 journal](../../journal/day-02-variables-and-data-types.md), then request a review.

Day 02 remains in progress until the data-size exercise has been implemented and verified. Personal reflection is tracked separately in the journal.

## References

- [Double.TryParse](https://learn.microsoft.com/en-us/dotnet/api/system.double.tryparse?view=net-10.0)
- [Double.IsFinite](https://learn.microsoft.com/en-us/dotnet/api/system.double.isfinite?view=net-10.0)
