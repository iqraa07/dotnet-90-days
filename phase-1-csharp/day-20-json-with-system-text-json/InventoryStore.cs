using System.Text.Json;
using System.Text.Json.Serialization;

internal sealed record InventoryItem(
    [property: JsonPropertyName("asset_id"), JsonRequired] int Id,
    [property: JsonPropertyName("name"), JsonRequired] string Name,
    [property: JsonPropertyName("quantity"), JsonRequired] int Quantity);

internal sealed class InventoryStore(string directory)
{
    private static readonly JsonSerializerOptions Options = new() { WriteIndented = true };
    private readonly string _path = Path.Combine(directory, "inventory.json");
    private readonly string _backupPath = Path.Combine(directory, "inventory.backup.json");

    public List<InventoryItem>? Load()
    {
        if (!File.Exists(_path))
        {
            return null;
        }

        string json = File.ReadAllText(_path);
        var items = JsonSerializer.Deserialize<List<InventoryItem>>(json, Options);
        if (items is null || items.Any(item => item is null || item.Id <= 0
            || string.IsNullOrWhiteSpace(item.Name) || item.Quantity < 0)
            || items.Select(item => item.Id).Distinct().Count() != items.Count)
        {
            throw new JsonException("Expected inventory items with unique positive IDs, names, and nonnegative quantities.");
        }

        return items;
    }

    public void Save(List<InventoryItem> items)
    {
        Directory.CreateDirectory(directory);
        string pendingPath = Path.Combine(directory, $".{Guid.NewGuid():N}.json");
        try
        {
            File.WriteAllText(pendingPath, JsonSerializer.Serialize(items, Options));
            if (File.Exists(_path))
            {
                File.Replace(pendingPath, _path, _backupPath);
            }
            else
            {
                File.Copy(pendingPath, _backupPath, overwrite: true);
                File.Move(pendingPath, _path);
            }
        }
        finally
        {
            File.Delete(pendingPath);
        }
    }
}
