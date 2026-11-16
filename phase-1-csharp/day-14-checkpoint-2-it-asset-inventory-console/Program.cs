using System.Globalization;

var inventory = new AssetInventory();
Console.WriteLine("Commands: add | list | search | older | quit");

while (Console.ReadLine() is string line)
{
    string[] parts = line.Split('|', StringSplitOptions.TrimEntries);
    string command = parts[0].ToLowerInvariant();

    switch (command)
    {
        case "add" when parts.Length == 4 &&
            parts[1].Length > 0 && parts[2].Length > 0 &&
            TryReadDate(parts[3], out DateOnly purchaseDate):
            var asset = new Asset(parts[1], parts[2], purchaseDate);
            inventory.Add(asset);
            Console.WriteLine($"Added {asset.Name}.");
            break;
        case "list" when parts.Length == 1:
            PrintAssets(inventory.Assets);
            break;
        case "search" when parts.Length == 3 && parts[2].Length > 0:
            if (parts[1].Equals("name", StringComparison.OrdinalIgnoreCase))
                PrintAssets(inventory.FindByName(parts[2]));
            else if (parts[1].Equals("location", StringComparison.OrdinalIgnoreCase))
                PrintAssets(inventory.FindByLocation(parts[2]));
            else
                Console.WriteLine("Search by name or location.");
            break;
        case "older" when parts.Length == 2 &&
            TryReadDate(parts[1], out DateOnly asOf) && asOf.Year > 4:
            PrintAssets(inventory.OlderThanFourYears(asOf));
            break;
        case "quit" when parts.Length == 1:
            return;
        default:
            Console.WriteLine("Invalid command or value. Dates use YYYY-MM-DD.");
            break;
    }
}

static bool TryReadDate(string value, out DateOnly date) =>
    DateOnly.TryParseExact(value, "yyyy-MM-dd", CultureInfo.InvariantCulture, DateTimeStyles.None, out date);

static void PrintAssets(IEnumerable<Asset> assets)
{
    bool found = false;
    foreach (Asset asset in assets)
    {
        Console.WriteLine($"{asset.Name} | {asset.Location} | {asset.PurchaseDate.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture)}");
        found = true;
    }

    if (!found)
        Console.WriteLine("No assets.");
}

record Asset(string Name, string Location, DateOnly PurchaseDate);

class AssetInventory
{
    private readonly List<Asset> _assets = [];

    public IReadOnlyList<Asset> Assets => _assets.AsReadOnly();

    public void Add(Asset asset) => _assets.Add(asset);

    public IEnumerable<Asset> FindByName(string search) =>
        _assets.Where(asset => asset.Name.Contains(search, StringComparison.OrdinalIgnoreCase));

    public IEnumerable<Asset> FindByLocation(string search) =>
        _assets.Where(asset => asset.Location.Contains(search, StringComparison.OrdinalIgnoreCase));

    public IEnumerable<Asset> OlderThanFourYears(DateOnly asOf) =>
        _assets.Where(asset => asset.PurchaseDate < asOf.AddYears(-4));
}
