using System.Text.Json;

string dataDirectory = args.Length > 0 ? args[0] : Path.Combine(AppContext.BaseDirectory, "data");
var store = new InventoryStore(dataDirectory);

try
{
    List<InventoryItem> inventory = store.Load() ?? [new(1, "Laptop", 1), new(2, "Network switch", 2)];
    Console.WriteLine("Enter laptop quantity (blank keeps the stored value):");
    string? input = Console.ReadLine();
    if (!string.IsNullOrWhiteSpace(input))
    {
        if (!int.TryParse(input, out int quantity) || quantity < 0)
        {
            Console.Error.WriteLine("Quantity must be a nonnegative integer.");
            return 1;
        }

        int laptopIndex = inventory.FindIndex(item => item.Id == 1);
        var updatedLaptop = new InventoryItem(1, "Laptop", quantity);
        if (laptopIndex < 0)
        {
            inventory.Add(updatedLaptop);
        }
        else
        {
            inventory[laptopIndex] = updatedLaptop;
        }
    }

    store.Save(inventory);
    List<InventoryItem> verified = store.Load() ?? throw new IOException("Inventory was missing after save.");
    Console.WriteLine("Saved inventory.json and inventory.backup.json.");
    foreach (InventoryItem item in verified)
    {
        Console.WriteLine($"{item.Id} | {item.Name} | Quantity: {item.Quantity}");
    }

    return 0;
}
catch (Exception exception) when (exception is JsonException or IOException or UnauthorizedAccessException)
{
    Console.Error.WriteLine($"Inventory error: {exception.Message}");
    return 1;
}
