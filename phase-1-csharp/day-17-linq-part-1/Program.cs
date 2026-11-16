using System.Globalization;

string[] types = ["Laptop", "Monitor", "Router"];
string[] locations = ["Makassar", "Jakarta", "Surabaya"];
List<Asset> assets = Enumerable.Range(1, 30)
    .Select(id => new Asset(id, types[(id - 1) % 3], locations[(id - 1) / 3 % 3],
        new DateOnly(2017 + (id - 1) % 8, (id - 1) % 12 + 1, 1)))
    .ToList();

var earlyMakassarLaptops = assets
    .Where(asset => asset.Type == "Laptop" && asset.Location == "Makassar" && asset.Purchased.Year < 2022)
    .OrderBy(asset => asset.Purchased)
    .Select(asset => $"{Label(asset)} ({asset.Purchased.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture)})");

var firstJakartaRouter = assets.FirstOrDefault(asset => asset.Location == "Jakarta" && asset.Type == "Router");
var countsByType = types.Select(type => $"{type}={assets.Count(asset => asset.Type == type)}");
var secondPage = assets.OrderBy(asset => asset.Id).Skip(5).Take(5).Select(Label);

Console.WriteLine($"Sample assets: {assets.Count}");
Console.WriteLine($"1. Makassar laptops before 2022: {string.Join(", ", earlyMakassarLaptops)}");
Console.WriteLine($"2. First Jakarta router: {(firstJakartaRouter is null ? "None" : Label(firstJakartaRouter))}");
Console.WriteLine($"3. Counts by type: {string.Join(", ", countsByType)}");
Console.WriteLine($"4. Any pre-2020 router: {assets.Any(asset => asset.Type == "Router" && asset.Purchased.Year < 2020)}");
Console.WriteLine($"   All IDs positive: {assets.All(asset => asset.Id > 0)}");
Console.WriteLine($"5. Second page: {string.Join(", ", secondPage)}");

static string Label(Asset asset) => $"A{asset.Id:D2}";

record Asset(int Id, string Type, string Location, DateOnly Purchased);
