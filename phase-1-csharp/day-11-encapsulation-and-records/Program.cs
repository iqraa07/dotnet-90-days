Ticket ticket = new(101, "  Replace a damaged cable  ");
TicketSnapshot initial = ticket.CreateSnapshot();
Console.WriteLine($"Ticket {initial.Id}: {initial.Subject}");
Console.WriteLine($"Initial status: {initial.Status}");

ticket.Start();
Console.WriteLine($"After Start: {ticket.Status}");
ticket.Close();
Console.WriteLine($"After Close: {ticket.Status}");

try
{
    ticket.Reopen();
}
catch (InvalidOperationException exception)
{
    Console.WriteLine(exception.Message);
}

Console.WriteLine($"Current status: {ticket.Status}");
Console.WriteLine($"Saved snapshot: {initial.Status}");
