internal sealed record TicketSnapshot(int Id, string Subject, bool IsClosed = false);

internal sealed class TicketEventArgs(TicketSnapshot ticket) : EventArgs
{
    public TicketSnapshot Ticket { get; } = ticket;
}

internal sealed class TicketDesk
{
    private readonly Dictionary<int, TicketSnapshot> _tickets = [];

    public event EventHandler<TicketEventArgs>? TicketCreated;
    public event EventHandler<TicketEventArgs>? TicketClosed;

    public TicketSnapshot Create(string subject)
    {
        ArgumentException.ThrowIfNullOrWhiteSpace(subject);
        var ticket = new TicketSnapshot(_tickets.Count + 1, subject.Trim());
        _tickets.Add(ticket.Id, ticket);
        TicketCreated?.Invoke(this, new TicketEventArgs(ticket));
        return ticket;
    }

    public void Close(int id)
    {
        if (!_tickets.TryGetValue(id, out TicketSnapshot? ticket))
        {
            throw new KeyNotFoundException($"Ticket #{id} was not found.");
        }
        if (ticket.IsClosed)
        {
            throw new InvalidOperationException($"Ticket #{id} is already closed.");
        }

        TicketSnapshot closedTicket = ticket with { IsClosed = true };
        _tickets[id] = closedTicket;
        TicketClosed?.Invoke(this, new TicketEventArgs(closedTicket));
    }

    public IReadOnlyList<TicketSnapshot> Find(Predicate<TicketSnapshot> predicate)
    {
        ArgumentNullException.ThrowIfNull(predicate);
        return _tickets.Values.Where(ticket => predicate(ticket)).OrderBy(ticket => ticket.Id).ToArray();
    }
}
