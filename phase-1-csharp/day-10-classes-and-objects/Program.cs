using System.Globalization;

DateOnly asOf = DateOnly.FromDateTime(DateTime.Today);
if (args.Length > 1 ||
    (args.Length == 1 && !DateOnly.TryParseExact(args[0], "yyyy-MM-dd", CultureInfo.InvariantCulture,
        DateTimeStyles.None, out asOf)))
{
    Console.Error.WriteLine("Provide one date in yyyy-MM-dd format.");
    return 1;
}

Device[] inventory =
[
    new("Lab Laptop", "192.0.2.10", "Room A", new DateOnly(2023, 11, 17)),
    new("Lab Router", "192.0.2.1", "Rack 1", new DateOnly(2020, 2, 29)),
    new("Front Desk Printer", "192.0.2.20", "Front Desk", new DateOnly(2022, 11, 16))
];

Console.WriteLine($"Inventory as of {asOf.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture)}");
foreach (Device device in inventory)
{
    if (asOf < device.PurchaseDate)
    {
        Console.WriteLine($"{device} | purchase after report date");
        continue;
    }

    Console.WriteLine($"{device} | {device.GetAgeInYears(asOf)} full year(s)");
}

return 0;
