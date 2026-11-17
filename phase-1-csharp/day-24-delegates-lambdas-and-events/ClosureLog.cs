using System.Text.Json;

internal sealed class ClosureLog(string path)
{
    public void Append(TicketSnapshot ticket)
    {
        string? directory = Path.GetDirectoryName(path);
        if (!string.IsNullOrEmpty(directory))
        {
            Directory.CreateDirectory(directory);
        }

        string entry = JsonSerializer.Serialize(new
        {
            ticketId = ticket.Id,
            subject = ticket.Subject,
            closedAt = DateTimeOffset.UtcNow
        });
        File.AppendAllText(path, entry + Environment.NewLine);
    }
}
