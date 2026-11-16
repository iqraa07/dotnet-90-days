Device[] devices =
[
    new Laptop("Lab Laptop", "Room A", 72),
    new Router("Lab Router", "Rack 1", 45),
    new Printer("Front Desk Printer", "Front Desk", 12)
];

foreach (Device device in devices)
{
    Console.WriteLine($"{device.Name} ({device.Location}): {device.GetMaintenanceInfo()}");
}
