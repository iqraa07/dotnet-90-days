switch (args.FirstOrDefault()?.ToLowerInvariant() ?? "subnet")
{
    case "subnet":
        Console.WriteLine("IPv4 prefix (0-32):");
        if (!int.TryParse(Console.ReadLine(), out int prefix) || prefix is < 0 or > 32)
        {
            Console.Error.WriteLine("Enter a prefix from 0 to 32.");
            return 1;
        }
        Console.WriteLine($"Usable hosts: {CalculateSubnet(prefix)}");
        break;
    case "temperature":
        (double fahrenheit, double kelvin) = Temperature.ConvertTemperature(25.5);
        Console.WriteLine(FormattableString.Invariant($"Fahrenheit: {fahrenheit:F2}"));
        Console.WriteLine(FormattableString.Invariant($"Kelvin: {kelvin:F2}"));
        break;
    case "receipt":
        (decimal subtotal, decimal total) = CalculateReceipt(3, 45_000m);
        Console.WriteLine(FormattableString.Invariant($"Subtotal: {subtotal:F2}"));
        Console.WriteLine(FormattableString.Invariant($"Total: {total:F2}"));
        break;
    default:
        Console.Error.WriteLine("Use subnet, temperature, or receipt.");
        return 1;
}

return 0;

static long CalculateSubnet(int prefix) => Math.Max(0L, (1L << (32 - prefix)) - 2);

static (decimal Subtotal, decimal Total) CalculateReceipt(
    int quantity, decimal unitPrice, decimal discountRate = 0.10m)
{
    decimal subtotal = quantity * unitPrice;
    decimal discount = subtotal > 100_000m ? decimal.Round(subtotal * discountRate, 2, MidpointRounding.AwayFromZero) : 0m;
    return (subtotal, subtotal - discount);
}

static class Temperature
{
    public static (double Fahrenheit, double Kelvin) ConvertTemperature(double celsius) =>
        ConvertTemperature(celsius, inputIsFahrenheit: false);

    public static (double Fahrenheit, double Kelvin) ConvertTemperature(double value, bool inputIsFahrenheit)
    {
        double celsius = inputIsFahrenheit ? (value - 32) * 5 / 9 : value;
        return (celsius * 9 / 5 + 32, celsius + 273.15);
    }
}
