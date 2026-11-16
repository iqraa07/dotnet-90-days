public enum TicketStatus
{
    Open,
    InProgress,
    Closed
}

public sealed record TicketSnapshot(int Id, string Subject, TicketStatus Status);

public sealed class Ticket
{
    private string subject = string.Empty;

    public Ticket(int id, string subject)
    {
        ArgumentOutOfRangeException.ThrowIfNegativeOrZero(id);
        Id = id;
        Subject = subject;
    }

    public int Id { get; }

    public string Subject
    {
        get => subject;
        private set
        {
            ArgumentException.ThrowIfNullOrWhiteSpace(value);
            subject = value.Trim();
        }
    }

    public TicketStatus Status { get; private set; } = TicketStatus.Open;

    public void Rename(string newSubject) => Subject = newSubject;

    public void Start()
    {
        if (Status != TicketStatus.Open)
        {
            throw new InvalidOperationException("Only an open ticket can be started.");
        }

        Status = TicketStatus.InProgress;
    }

    public void Close() => Status = TicketStatus.Closed;

    public void Reopen()
    {
        if (Status == TicketStatus.Closed)
        {
            throw new InvalidOperationException("A closed ticket cannot be reopened.");
        }

        Status = TicketStatus.Open;
    }

    public TicketSnapshot CreateSnapshot() => new(Id, Subject, Status);
}
