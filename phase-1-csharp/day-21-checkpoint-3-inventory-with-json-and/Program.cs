using System.Globalization;
using System.Text.Json;

string samplePath = Path.Combine(AppContext.BaseDirectory, "assets.sample.json");
string storagePath = args.Length > 0
    ? Path.GetFullPath(args[0])
    : Path.Combine(AppContext.BaseDirectory, "data", "inventory.json");
var store = new AssetJsonStore(storagePath);

try
{
    var inventory = new AssetInventory(store.Load(samplePath));
    Console.WriteLine("Commands: add | list | search | older | reports | quit");

    while (Console.ReadLine() is string line)
    {
        string[] parts = line.Split('|', StringSplitOptions.TrimEntries);
        switch (parts[0].ToLowerInvariant())
        {
            case "add" when parts.Length == 4 && parts[1].Length > 0 && parts[2].Length > 0
                && TryReadDate(parts[3], out DateOnly purchaseDate):
                var asset = new Asset(parts[1], parts[2], purchaseDate);
                inventory.Add(asset);
                store.Save(inventory.Assets);
                Console.WriteLine($"Added {asset.Name}; inventory saved.");
                break;
            case "list" when parts.Length == 1:
                PrintAssets(inventory.Assets);
                break;
            case "search" when parts.Length == 3 && parts[2].Length > 0:
                if (parts[1].Equals("name", StringComparison.OrdinalIgnoreCase))
                {
                    PrintAssets(inventory.FindByName(parts[2]));
                }
                else if (parts[1].Equals("location", StringComparison.OrdinalIgnoreCase))
                {
                    PrintAssets(inventory.FindByLocation(parts[2]));
                }
                else
                {
                    Console.WriteLine("Search by name or location.");
                }
                break;
            case "older" when parts.Length == 2 && TryReadDate(parts[1], out DateOnly asOf) && asOf.Year > 4:
                PrintAssets(inventory.OlderThanFourYears(asOf));
                break;
            case "reports" when parts.Length == 1:
                Console.WriteLine("Reports: reports | location, reports | total");
                break;
            case "reports" when parts.Length == 2 && parts[1].Equals("location", StringComparison.OrdinalIgnoreCase):
                PrintLocationReport(inventory.Assets);
                break;
            case "reports" when parts.Length == 2 && parts[1].Equals("total", StringComparison.OrdinalIgnoreCase):
                Console.WriteLine($"Total assets: {inventory.Assets.Count}");
                break;
            case "quit" when parts.Length == 1:
                return 0;
            default:
                Console.WriteLine("Invalid command or value. Dates use YYYY-MM-DD.");
                break;
        }
    }

    return 0;
}
catch (Exception exception) when (exception is IOException or UnauthorizedAccessException or JsonException)
{
    Console.Error.WriteLine($"Inventory error: {exception.Message}");
    return 1;
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
    {
        Console.WriteLine("No assets.");
    }
}

static void PrintLocationReport(IReadOnlyCollection<Asset> assets)
{
    var groups = assets.GroupBy(asset => asset.Location, StringComparer.OrdinalIgnoreCase)
        .OrderBy(group => group.Key, StringComparer.OrdinalIgnoreCase);

    Console.WriteLine("Assets by location");
    foreach (var group in groups)
    {
        Console.WriteLine($"{group.Key}: {group.Count()}");
    }

    if (assets.Count == 0)
    {
        Console.WriteLine("No assets.");
    }
}
