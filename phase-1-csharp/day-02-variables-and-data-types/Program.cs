using System.Globalization;

const double KelvinOffset = 273.15;

Console.WriteLine("Enter Celsius (use . for decimals):");
string? input = Console.ReadLine();

if (!double.TryParse(input, NumberStyles.Float, CultureInfo.InvariantCulture, out double celsius)
    || !double.IsFinite(celsius))
{
    Console.WriteLine("Invalid input. Enter a finite number using a decimal point.");
    return;
}

if (celsius < -KelvinOffset)
{
    Console.WriteLine("Celsius cannot be below -273.15.");
    return;
}

double fahrenheit = celsius * 1.8 + 32;
double kelvin = celsius + KelvinOffset;

if (!double.IsFinite(fahrenheit) || !double.IsFinite(kelvin))
{
    Console.WriteLine("That temperature is outside the supported range.");
    return;
}

Console.WriteLine(FormattableString.Invariant($"Fahrenheit: {fahrenheit:F2}"));
Console.WriteLine(FormattableString.Invariant($"Kelvin: {kelvin:F2}"));
Console.WriteLine();

// TODO(you) 1: Read an MB value and reject text, negative values, and non-finite numbers.
// Hint: use Console.ReadLine, double.TryParse, and double.IsFinite, following the pattern above.
// Input/output: "1000" -> accepted; "abc" or "-1" -> a clear message and a clean exit.

// TODO(you) 2: Print GB and TB from the accepted MB value using decimal units.
// Hint: 1 GB = 1000 MB; 1 TB = 1000 GB. Store each converted value in a variable.
// Input/output: "1000" -> GB: 1.000 and TB: 0.001000; "1000000" -> GB: 1000.000 and TB: 1.000000.

Console.WriteLine("Data-size conversion: exercise pending.");
