public abstract class Device(string name, string location)
{
    public string Name { get; } = name;
    public string Location { get; } = location;

    public abstract string GetMaintenanceInfo();
}

public sealed class Laptop(string name, string location, int batteryHealthPercent) : Device(name, location)
{
    public override string GetMaintenanceInfo() => batteryHealthPercent < 80
        ? "Schedule a battery replacement."
        : "Battery health is within range.";
}

public sealed class Router(string name, string location, int daysSinceFirmwareReview) : Device(name, location)
{
    public override string GetMaintenanceInfo() => daysSinceFirmwareReview >= 30
        ? "Review available firmware updates."
        : "Firmware review is up to date.";
}

public sealed class Printer(string name, string location, int tonerPercent) : Device(name, location)
{
    public override string GetMaintenanceInfo() => tonerPercent <= 15
        ? "Replace the toner cartridge."
        : "Toner level is within range.";
}
