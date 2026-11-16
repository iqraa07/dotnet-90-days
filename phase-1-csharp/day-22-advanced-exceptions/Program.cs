using System.Net;

var ticket = new Ticket("Printer is offline");
Console.WriteLine("Commands: start | close | device | ticket | quit");

while (Console.ReadLine() is string line)
{
    string[] parts = line.Split('|', StringSplitOptions.TrimEntries);

    try
    {
        switch (parts[0].ToLowerInvariant())
        {
            case "start" when parts.Length == 1:
                ticket.TransitionTo(TicketStatus.InProgress);
                Console.WriteLine($"Ticket status: {ticket.Status}");
                break;
            case "close" when parts.Length == 1:
                ticket.TransitionTo(TicketStatus.Closed);
                Console.WriteLine($"Ticket status: {ticket.Status}");
                break;
            case "device" when parts.Length == 3:
                var device = new Device(parts[1], parts[2]);
                Console.WriteLine($"Device: {device.Name} ({device.IpAddress})");
                break;
            case "ticket" when parts.Length == 2:
                ticket = new Ticket(parts[1]);
                Console.WriteLine($"Ticket: {ticket.Subject} ({ticket.Status})");
                break;
            case "quit" when parts.Length == 1:
                return;
            default:
                Console.WriteLine("Use device | name | IP or ticket | subject.");
                break;
        }
    }
    catch (InvalidTicketStateException exception)
        when (exception.Current == TicketStatus.Open && exception.Requested == TicketStatus.Closed)
    {
        Console.WriteLine("Start the ticket before closing it.");
    }
    catch (InvalidTicketStateException exception)
    {
        Console.WriteLine(exception.Message);
    }
    catch (ArgumentException exception)
    {
        Console.WriteLine(exception.Message);
    }
}

enum TicketStatus { Open, InProgress, Closed }

sealed class InvalidTicketStateException(TicketStatus current, TicketStatus requested)
    : InvalidOperationException($"Cannot move a ticket from {current} to {requested}.")
{
    public TicketStatus Current { get; } = current;
    public TicketStatus Requested { get; } = requested;
}

sealed class Ticket
{
    public Ticket(string subject)
    {
        ArgumentNullException.ThrowIfNull(subject);
        if (string.IsNullOrWhiteSpace(subject))
        {
            throw new ArgumentException("Enter a ticket subject.", nameof(subject));
        }

        Subject = subject.Trim();
    }

    public string Subject { get; }
    public TicketStatus Status { get; private set; } = TicketStatus.Open;

    public void TransitionTo(TicketStatus next)
    {
        bool allowed = (Status, next) is
            (TicketStatus.Open, TicketStatus.InProgress) or (TicketStatus.InProgress, TicketStatus.Closed);

        if (!allowed)
        {
            throw new InvalidTicketStateException(Status, next);
        }

        Status = next;
    }
}

sealed class Device
{
    public Device(string name, string ipAddress)
    {
        ArgumentNullException.ThrowIfNull(name);
        ArgumentNullException.ThrowIfNull(ipAddress);
        if (string.IsNullOrWhiteSpace(name))
        {
            throw new ArgumentException("Enter a device name.", nameof(name));
        }

        if (!IPAddress.TryParse(ipAddress, out IPAddress? address))
        {
            throw new ArgumentException("Enter a valid IP address.", nameof(ipAddress));
        }

        Name = name.Trim();
        IpAddress = address;
    }

    public string Name { get; }
    public IPAddress IpAddress { get; }
}
