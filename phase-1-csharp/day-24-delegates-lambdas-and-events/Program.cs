using System.Globalization;

if (args.Length > 1)
{
    Console.Error.WriteLine("Pass at most one closure-log path.");
    return 1;
}

string logPath;
try
{
    logPath = Path.GetFullPath(args.FirstOrDefault()
        ?? Path.Combine(AppContext.BaseDirectory, "data", "ticket-events.jsonl"));
}
catch (Exception exception) when (exception is ArgumentException or NotSupportedException or PathTooLongException)
{
    Console.Error.WriteLine($"Invalid log path: {exception.Message}");
    return 1;
}

var desk = new TicketDesk();
var closureLog = new ClosureLog(logPath);
Func<TicketSnapshot, string> describe = ticket => $"#{ticket.Id} {ticket.Subject}";
Action<string> notify = message => Console.WriteLine($"Notification: {message}");
Predicate<TicketSnapshot> isOpen = ticket => !ticket.IsClosed;

desk.TicketCreated += (_, change) => notify($"Created {describe(change.Ticket)}");
desk.TicketClosed += (_, change) =>
{
    closureLog.Append(change.Ticket);
    Console.WriteLine($"Logged closure: {describe(change.Ticket)}");
};

Console.WriteLine("Commands: new | subject, close | id, open, quit");
while (Console.ReadLine() is string line)
{
    string[] parts = line.Split('|', 2, StringSplitOptions.TrimEntries);
    switch (parts[0].ToLowerInvariant())
    {
        case "new" when parts.Length == 2 && parts[1].Length > 0:
            desk.Create(parts[1]);
            break;

        case "close" when parts.Length == 2
            && int.TryParse(parts[1], NumberStyles.None, CultureInfo.InvariantCulture, out int id) && id > 0:
            try
            {
                desk.Close(id);
            }
            catch (Exception exception) when (exception is KeyNotFoundException or InvalidOperationException)
            {
                Console.WriteLine(exception.Message);
            }
            catch (Exception exception) when (exception is IOException or UnauthorizedAccessException)
            {
                Console.Error.WriteLine($"Ticket #{id} is closed. Log write failed: {exception.Message}");
                return 1;
            }
            break;

        case "open" when parts.Length == 1:
            IReadOnlyList<TicketSnapshot> openTickets = desk.Find(isOpen);
            Console.WriteLine($"Open tickets: {openTickets.Count}");
            foreach (TicketSnapshot ticket in openTickets)
            {
                Console.WriteLine(describe(ticket));
            }
            break;

        case "quit" when parts.Length == 1:
            return 0;

        default:
            Console.WriteLine("Invalid command. Use new | subject, close | id, open, or quit.");
            break;
    }
}

return 0;
