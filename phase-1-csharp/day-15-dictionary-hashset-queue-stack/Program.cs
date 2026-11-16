using System.Globalization;

var waiting = new Queue<Ticket>();
var usedIds = new HashSet<int>();
var resolved = new Stack<Ticket>();
Console.WriteLine("Commands: add | next | counts | history | quit");

while (Console.ReadLine() is string line)
{
    string[] parts = line.Split('|', StringSplitOptions.TrimEntries);
    switch (parts[0].ToLowerInvariant())
    {
        case "add" when parts.Length == 4 && parts[2].Length > 0 && parts[3].Length > 0 &&
            int.TryParse(parts[1], NumberStyles.None, CultureInfo.InvariantCulture, out int id) && id > 0:
            if (usedIds.Add(id))
            {
                waiting.Enqueue(new Ticket(id, parts[2], parts[3]));
                Console.WriteLine($"Queued {id}: {parts[3]}.");
            }
            else
            {
                Console.WriteLine($"Ticket {id} already exists.");
            }
            break;
        case "next" when parts.Length == 1:
            if (waiting.TryDequeue(out Ticket? ticket))
            {
                resolved.Push(ticket);
                Console.WriteLine($"Resolved {ticket.Id}: {ticket.Title}.");
            }
            else
            {
                Console.WriteLine("The queue is empty.");
            }
            break;
        case "counts" when parts.Length == 1:
            var counts = new Dictionary<string, int>(StringComparer.OrdinalIgnoreCase);
            foreach (Ticket queued in waiting)
                counts[queued.Category] = counts.GetValueOrDefault(queued.Category) + 1;

            Console.WriteLine("Waiting by category:");
            if (counts.Count == 0)
                Console.WriteLine("The queue is empty.");
            foreach (var (category, count) in counts.OrderBy(pair => pair.Key, StringComparer.OrdinalIgnoreCase))
                Console.WriteLine($"{category}: {count}");
            break;
        case "history" when parts.Length == 1:
            Console.WriteLine("Resolved, newest first:");
            if (resolved.Count == 0)
                Console.WriteLine("No resolved tickets.");
            foreach (Ticket completed in resolved)
                Console.WriteLine($"{completed.Id}: {completed.Title}");
            break;
        case "quit" when parts.Length == 1:
            return;
        default:
            Console.WriteLine("Invalid command or value.");
            break;
    }
}

record Ticket(int Id, string Category, string Title);
