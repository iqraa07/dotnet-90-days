using System.Globalization;

const double KelvinOffset = 273.15;
const double MegabytesPerGigabyte = 1000;
const double GigabytesPerTerabyte = 1000;

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

Console.WriteLine("Enter megabytes (use . for decimals):");
string? megabytesInput = Console.ReadLine();

if (!double.TryParse(megabytesInput, NumberStyles.Float, CultureInfo.InvariantCulture, out double megabytes)
    || !double.IsFinite(megabytes)
    || megabytes < 0)
{
    Console.WriteLine("Invalid data size. Enter a finite, nonnegative number using a decimal point.");
    return;
}

double gigabytes = megabytes / MegabytesPerGigabyte;
double terabytes = gigabytes / GigabytesPerTerabyte;

Console.WriteLine(FormattableString.Invariant($"GB: {gigabytes:F3}"));
Console.WriteLine(FormattableString.Invariant($"TB: {terabytes:F6}"));
