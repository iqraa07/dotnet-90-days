using System.Globalization;

var desk = new Helpdesk(
[
    new Ticket(new TicketKey(1), "Wi-Fi disconnects", TicketStatus.Open, Priority.High, "Nina"),
    new Ticket(new TicketKey(2), "Replace keyboard", TicketStatus.Resolved, Priority.Low, null),
    new Ticket(new TicketKey(3), "Install VPN", TicketStatus.InProgress, Priority.Medium, "Arif")
]);

Console.WriteLine("Enter a ticket ID, or quit.");
while (Console.ReadLine() is string line)
{
    string input = line.Trim();
    if (input.Equals("quit", StringComparison.OrdinalIgnoreCase))
        return;

    if (!int.TryParse(input, NumberStyles.None, CultureInfo.InvariantCulture, out int id) || id <= 0)
    {
        Console.WriteLine("Enter a positive ticket ID.");
        continue;
    }

    Ticket? ticket = desk.FindTicket(id);
    if (ticket is null)
    {
        Console.WriteLine($"Ticket {id} was not found.");
        continue;
    }

    string assignee = ticket.Assignee?.Trim() ?? "Unassigned";
    Console.WriteLine($"#{ticket.Key.Value} {ticket.Title} | {ticket.Status} | {ticket.Priority} | {assignee}");
}

enum TicketStatus { Open, InProgress, Resolved }
enum Priority { Low, Medium, High }

readonly record struct TicketKey(int Value);

sealed record Ticket(TicketKey Key, string Title, TicketStatus Status, Priority Priority, string? Assignee);

sealed class Helpdesk(IReadOnlyList<Ticket> tickets)
{
    public Ticket? FindTicket(int id) => tickets.FirstOrDefault(ticket => ticket.Key.Value == id);
}
