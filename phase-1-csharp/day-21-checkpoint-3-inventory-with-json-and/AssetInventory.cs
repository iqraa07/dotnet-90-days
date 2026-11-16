using System.Text.Json;
using System.Text.Json.Serialization;

internal sealed record Asset(
    [property: JsonRequired] string Name,
    [property: JsonRequired] string Location,
    [property: JsonRequired] DateOnly PurchaseDate);

internal sealed class AssetInventory(IEnumerable<Asset> initialAssets)
{
    private readonly List<Asset> _assets = [.. initialAssets];

    public IReadOnlyList<Asset> Assets => _assets.AsReadOnly();

    public void Add(Asset asset) => _assets.Add(asset);

    public IEnumerable<Asset> FindByName(string search) =>
        _assets.Where(asset => asset.Name.Contains(search, StringComparison.OrdinalIgnoreCase));

    public IEnumerable<Asset> FindByLocation(string search) =>
        _assets.Where(asset => asset.Location.Contains(search, StringComparison.OrdinalIgnoreCase));

    public IEnumerable<Asset> OlderThanFourYears(DateOnly asOf) =>
        _assets.Where(asset => asset.PurchaseDate < asOf.AddYears(-4));
}

internal sealed class AssetJsonStore(string path)
{
    private static readonly JsonSerializerOptions Options = new() { WriteIndented = true };

    public List<Asset> Load(string samplePath)
    {
        string json = File.ReadAllText(File.Exists(path) ? path : samplePath);
        var assets = JsonSerializer.Deserialize<List<Asset>>(json, Options);
        if (assets is null || assets.Any(asset => asset is null || string.IsNullOrWhiteSpace(asset.Name)
            || string.IsNullOrWhiteSpace(asset.Location)))
        {
            throw new JsonException("Expected assets with a name, location, and purchase date.");
        }

        return assets;
    }

    public void Save(IReadOnlyList<Asset> assets)
    {
        string directory = Path.GetDirectoryName(path)!;
        Directory.CreateDirectory(directory);
        string pendingPath = Path.Combine(directory, $".{Guid.NewGuid():N}.json");
        try
        {
            File.WriteAllText(pendingPath, JsonSerializer.Serialize(assets, Options));
            File.Move(pendingPath, path, overwrite: true);
        }
        finally
        {
            File.Delete(pendingPath);
        }
    }
}
