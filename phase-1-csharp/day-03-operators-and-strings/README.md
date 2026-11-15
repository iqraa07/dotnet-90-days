# Day 03: Operators and Strings

This console exercise calculates a shopping receipt from an item name, a quantity, and a unit price. It uses `decimal` for money and formats the receipt with the `id-ID` culture.

## Run

From the repository root, build with the .NET 10 SDK and pipe the three sample inputs to the program in PowerShell.

```powershell
dotnet build .\phase-1-csharp\day-03-operators-and-strings -c Release
@('Notebook', '3', '45000') | dotnet run --project .\phase-1-csharp\day-03-operators-and-strings -c Release --no-build
```

You can also run the project interactively and enter each value at its prompt. Enter a name with at least one non-whitespace character, a positive whole-number quantity, and a nonnegative unit price. Use a dot for fractional input, such as `45000.50`. Enter the price without grouping separators, scientific notation, or the `Rp` symbol.

## Sample output

```text
Item name:
Quantity:
Unit price in rupiah (use . for decimals):

Receipt
Item: Notebook
Quantity: 3
Unit price: Rp45.000,00
Subtotal: Rp135.000,00
Discount: Rp13.500,00
Total: Rp121.500,00
```

## Receipt rules

- `Trim()` removes whitespace around the name and preserves its casing.
- The quantity must fit in an `int`. Enter the price with up to two decimal places. The program also rejects subtotals too large for exact hundredths arithmetic. It reports a validation error to stderr and exits with code `1` before printing a receipt.
- The subtotal is `quantity * unitPrice`. A subtotal of exactly `Rp100.000,00` has a `Rp0,00` discount. A subtotal above that amount earns 10%.
- The program rounds the discount to two decimal places with `MidpointRounding.AwayFromZero` before subtracting it from the subtotal. For example, a subtotal of `Rp105.000,05` produces a discount of `Rp10.500,01` and a total of `Rp94.500,04`.
- String interpolation inserts values into receipt labels. `ToString("C2", rupiah)` prints the amounts with the `Rp` symbol, dot grouping, and comma decimals.

## Try these expressions

The receipt uses `Trim()` and interpolation. These examples cover the other formatting and string operations in the roadmap.

```csharp
using System.Globalization;

var rupiah = new CultureInfo("id-ID", useUserOverride: false);
string item = "  Notebook  ".Trim();

Console.WriteLine(item.ToUpperInvariant()); // NOTEBOOK
Console.WriteLine(item.Contains("book", StringComparison.OrdinalIgnoreCase)); // True
Console.WriteLine("Notebook,Pen".Split(',')[1]); // Pen
Console.WriteLine("Blue Pen".Replace("Blue", "Black")); // Black Pen
Console.WriteLine(135000.ToString("N0", rupiah)); // 135.000
Console.WriteLine(135000m.ToString("C2", rupiah)); // Rp135.000,00
```

## Verification

The Release build passed with 0 warnings and 0 errors. The sample receipt above came from a successful run. [Run transcript](../../assets/progress/day-03-output.txt) · [CLI checks](../../assets/progress/day-03-checks.txt) · [Captured source and input](../../assets/progress/day-03-capture.json)

[Day 03 overview](../../days/day-03/README.md) · [Learning journal](../../journal/day-03-operators-and-strings.md)
