using System.Globalization;

Console.WriteLine("Enter whole numbers separated by commas:");
try
{
    int[] values = ParseNumbers(Console.ReadLine());
    long sum = SumNumbers(values);
    decimal average = (decimal)sum / values.Length;
    Console.WriteLine($"Count: {values.Length}");
    Console.WriteLine($"Sum: {sum}");
    Console.WriteLine($"Average: {average.ToString("F2", CultureInfo.InvariantCulture)}");
}
catch (FormatException exception)
{
    Console.Error.WriteLine(exception.Message);
    return 1;
}
finally
{
    Console.WriteLine("Run finished.");
}

return 0;

static int[] ParseNumbers(string? input)
{
    if (string.IsNullOrWhiteSpace(input))
    {
        throw new FormatException("Enter at least one whole number.");
    }

    string[] fields = input.Split(',');
    int[] values = new int[fields.Length];
    for (int index = 0; index < fields.Length; index++)
    {
        if (!int.TryParse(fields[index], NumberStyles.Integer, CultureInfo.InvariantCulture, out values[index]))
        {
            throw new FormatException($"Entry {index + 1} must be a 32-bit whole number.");
        }
    }

    return values;
}

static long SumNumbers(int[] values)
{
    long sum = 0;
    for (int index = 0; index < values.Length; index++)
    {
        sum += values[index];
    }

    return sum;
}
