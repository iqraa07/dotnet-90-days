# Day 02: Variables and Data Types

- **Started:** 2026-10-25
- **Updated:** 2026-11-16
- **Phase:** 1, C# Fundamentals
- **Source:** [Console project](../phase-1-csharp/day-02-variables-and-data-types)
- **Implementation:** complete and verified
- **Personal reflection:** pending

## Today's goals

Use variables and numeric types, read text input with `Console.ReadLine`, and handle invalid values with `TryParse`. Convert Celsius to Fahrenheit and Kelvin, then convert MB to GB and TB using decimal units.

## Work completed

- [x] Created the `net10.0` console project with Nullable and ImplicitUsings enabled.
- [x] Centralized `UseAppHost=false` in the Phase 1 folder so console projects run through the installed .NET runtime.
- [x] Implemented validated Celsius-to-Fahrenheit and Celsius-to-Kelvin conversions.
- [x] Implemented MB input, finite/nonnegative validation, and decimal MB-to-GB-to-TB conversions.
- [x] Used named constants, invariant dot-decimal input, and explicit output precision.
- [x] Built Release with 0 warnings and 0 errors.
- [x] Passed all [26 CLI checks](../assets/progress/day-02-checks.txt), including EOF at either prompt and invalid data-size values.
- [x] Exported and checked both images from the recorded sample run.
- [ ] Add a personal reflection after trying the program.

## What I understood

<!-- Write your own notes after trying the program. -->
-

## Study notes

The Celsius input is parsed into a `double` and checked before arithmetic runs. The MB input follows the same pattern and also rejects negative values. Named constants define the conversion ratios. Dividing MB by 1000 gives GB; dividing GB by 1000 gives TB.

`TryParse` reports invalid numeric text without throwing a parsing exception. Additional finite/range checks reject values that parse successfully but cannot produce meaningful results for this exercise.

## Understanding check

1. Why is `double` suitable for a temperature that contains a fractional part?
2. How does `TryParse` differ from `Parse` when the input is text rather than a number?
3. Why does 1000 MB produce 1.000 GB and 0.001000 TB in this program?

## Issues and solutions

| Issue | Cause | Resolution |
|---|---|---|
| Generated apphosts are blocked on this machine | Windows Application Control | Inherited `UseAppHost=false` through Phase 1 build configuration |
| Numeric parsing can depend on the computer's locale | Different decimal and grouping separators | Used invariant culture with `NumberStyles.Float` and a prompt requesting dot decimals |
| A successful parse can still return a non-finite number | Floating-point special values or overflow | Used `double.IsFinite` and range checks before displaying results |

## Evidence

[Day 02 documentation](../days/day-02/README.md) links to the recorded CLI checks, source capture, run transcript, and output images. Personal reflection remains separate from the completed implementation.

## Next session

Try the program, write personal notes when ready, and continue with Day 03: Operators and Strings when requested.
