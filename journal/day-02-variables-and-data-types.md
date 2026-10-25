# Day 02: Variables and Data Types

- **Started:** 2026-10-25
- **Phase:** 1, C# Fundamentals
- **Source:** [Console project](../phase-1-csharp/day-02-variables-and-data-types)
- **Implementation:** in progress; temperature converter ready, data-size exercise pending
- **Personal reflection:** pending

## Today's goals

Use variables and numeric types, read input with `Console.ReadLine`, and handle invalid numbers with `TryParse`. Convert Celsius to Fahrenheit and Kelvin, then add MB-to-GB-to-TB conversions using decimal units.

## Work completed

- [x] Created the Day 02 console project targeting `net10.0`.
- [x] Added shared `UseAppHost=false` settings for Phase 1 projects through `Directory.Build.props`.
- [x] Implemented Celsius-to-Fahrenheit and Celsius-to-Kelvin conversions.
- [x] Added dot-decimal input parsing and checks for invalid, non-finite, below-absolute-zero, and out-of-range values.
- [x] Built Release with 0 warnings and 0 errors; input `25.5` produced `77.90` Fahrenheit and `298.65` Kelvin.
- [x] Passed [13 CLI checks](../assets/progress/day-02-checks.txt) covering valid conversions, text, comma decimals, non-finite values, empty input, EOF, absolute zero, and numeric overflow.
- [x] Prepared two `TODO(you)` tasks with API hints and input/output examples.
- [ ] Read and validate the MB value using `TryParse`.
- [ ] Calculate and display GB and TB, then remove the pending-exercise message.
- [ ] Write a personal reflection after trying the program.

## What I understood

<!-- Write your own notes after trying the program. -->
-

## Understanding check

1. Why is `double` suitable for a temperature that contains a fractional part?
2. How does `TryParse` differ from `Parse` when the input is text rather than a number?
3. With decimal units, how many GB and TB should 1000 MB produce?

## Issues and solutions

| Issue | Cause | Resolution |
|---|---|---|
| Generated native apphosts are blocked on this machine | Windows Application Control | Centralized `UseAppHost=false` in the Phase 1 folder so current and future console projects run through the .NET runtime |
| Decimal parsing may depend on the computer's locale | Different decimal and grouping separators | Used invariant culture with `NumberStyles.Float`; the input prompt explicitly asks for a decimal point |

## Next session

Complete the two data-size tasks, run the valid and invalid input checks in the exercise README, and request a review. Day 02 remains in progress until that implementation is finished.
