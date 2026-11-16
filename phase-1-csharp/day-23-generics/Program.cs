var assets = new InMemoryRepository<Asset>();
assets.Add(new Asset(1, "Laptop", "Makassar"));
assets.Add(new Asset(2, "Printer", "Gowa"));
assets.Add(new Asset(3, "Switch", "Makassar"));
Console.WriteLine($"Duplicate ID accepted: {assets.Add(new Asset(2, "Router", "Gowa"))}");
Console.WriteLine($"Asset 2: {assets.GetById(2)?.Name ?? "missing"}");

Console.Write("Assets in Makassar: ");
PrintNames(assets.Find(asset => asset.Location == "Makassar"));
Console.WriteLine($"Removed asset 2: {assets.Remove(2)}");
Console.WriteLine($"Removed asset 2 again: {assets.Remove(2)}");
Console.WriteLine($"Asset 2 after removal: {assets.GetById(2)?.Name ?? "missing"}");
Console.Write("Remaining assets: ");
PrintNames(assets.GetAll());

var tickets = new InMemoryRepository<Ticket>();
tickets.Add(new Ticket(1, "Printer jam"));
Console.Write("Tickets: ");
PrintNames(tickets.GetAll());

static void PrintNames<T>(IEnumerable<T> items) where T : IEntity =>
    Console.WriteLine(string.Join(", ", items.Select(item => item.Name)));

interface IEntity
{
    int Id { get; }
    string Name { get; }
}

sealed record Asset(int Id, string Name, string Location) : IEntity;
sealed record Ticket(int Id, string Name) : IEntity;

sealed class InMemoryRepository<T> where T : class, IEntity
{
    private readonly Dictionary<int, T> _items = [];

    public bool Add(T item)
    {
        ArgumentNullException.ThrowIfNull(item);
        ArgumentOutOfRangeException.ThrowIfNegativeOrZero(item.Id);
        return _items.TryAdd(item.Id, item);
    }

    public T? GetById(int id) => _items.GetValueOrDefault(id);

    public IReadOnlyList<T> GetAll() => _items.Values.OrderBy(item => item.Id).ToArray();

    public bool Remove(int id) => _items.Remove(id);

    public IReadOnlyList<T> Find(Func<T, bool> predicate)
    {
        ArgumentNullException.ThrowIfNull(predicate);
        return _items.Values.Where(predicate).OrderBy(item => item.Id).ToArray();
    }
}
