# Day 03: Operators and Strings

- **Started:** 2026-11-16
- **Updated:** 2026-11-16
- **Phase:** 1, C# Fundamentals
- **Source:** [Console project](../phase-1-csharp/day-03-operators-and-strings)
- **Implementation:** complete and verified
- **Personal reflection:** pending

## Today's goals

Use arithmetic and comparison operators to calculate a receipt, then format the item and monetary amounts with string interpolation and Indonesian Rupiah conventions.

## Work completed

- [x] Read and validated an item name, quantity, and unit price.
- [x] Calculated the subtotal, discount, and total using `decimal`. Applied the 10% discount only above `Rp100.000,00` and rounded the discount to hundredths before subtraction.
- [x] Formatted receipt amounts with `C2` and the `id-ID` culture.
- [x] Built Release with 0 warnings and 0 errors. The sample `Notebook`, `3`, `45000` produced a total of `Rp121.500,00`.
- [ ] Add a personal reflection after trying the program.

## What I understood

<!-- Write this reflection in your own words. -->
-

## Study notes

The program uses invariant culture for dot-decimal price input and `id-ID` for Rupiah output. `C2` shows the currency symbol and two decimal places, while `N0` shows a grouped number without currency or fractional digits. The `>` comparison keeps the discount off at the threshold itself.

## Understanding check

1. Why is the discount zero when the subtotal is exactly `Rp100.000,00`?
2. Why does the program parse `45000.50` as input but display it as `Rp45.000,50`?
3. What changes in the total if the program rounds the discount before it subtracts that amount?

## Evidence

The [run transcript](../assets/progress/day-03-output.txt) records the sample input and receipt. The [CLI checks](../assets/progress/day-03-checks.txt) cover valid receipts, the discount boundary, and invalid inputs. The [Day 03 overview](../days/day-03/README.md) includes the sample image and run command.

## Next session

Try a receipt at the threshold and another just above it, then add your notes to the reflection. Day 04 covers conditionals and switch expressions.
