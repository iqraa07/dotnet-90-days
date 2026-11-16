using System.Globalization;

Ticket[] tickets =
[
    new(1, "Network", "Urgent", "Resolved", 2),
    new(2, "Network", "Urgent", "Resolved", 4),
    new(3, "Hardware", "Normal", "Resolved", 8),
    new(4, "Hardware", "Normal", "Resolved", 16),
    new(5, "Hardware", "Normal", "Open", null),
    new(6, "Accounts", "Low", "Open", null),
    new(7, "Accounts", "Low", "Resolved", 20),
    new(8, "Network", "Urgent", "Open", null)
];

var categoryCounts = from ticket in tickets
                     group ticket by ticket.Category into category
                     orderby category.Key
                     select new { Category = category.Key, Count = category.Count() };

var statusCounts = tickets.GroupBy(ticket => ticket.Status)
    .ToDictionary(status => status.Key, status => status.Count());
var resolved = tickets.Where(ticket => ticket.ResolutionHours.HasValue).ToArray();

var priorities = new Dictionary<string, Priority>
{
    ["Urgent"] = new("Urgent", 4),
    ["Normal"] = new("Normal", 12),
    ["Low"] = new("Low", 24)
};

var priorityAverages = resolved.GroupBy(ticket => ticket.Priority)
    .Join(priorities.Values, group => group.Key, priority => priority.Name,
        (group, priority) => new
        {
            Name = priority.Name,
            Average = group.Average(ticket => ticket.ResolutionHours.GetValueOrDefault()),
            priority.TargetHours
        })
    .OrderBy(priority => priority.TargetHours);

Console.WriteLine("Tickets by category:");
foreach (var category in categoryCounts)
    Console.WriteLine($"{category.Category}: {category.Count}");

Console.WriteLine("Tickets by status:");
foreach (var (status, count) in statusCounts.OrderBy(pair => pair.Key))
    Console.WriteLine($"{status}: {count}");

Console.WriteLine($"Resolved hours total: {resolved.Sum(ticket => ticket.ResolutionHours.GetValueOrDefault())}");
Console.WriteLine($"Longest resolution: {resolved.Max(ticket => ticket.ResolutionHours.GetValueOrDefault())} hours");

Console.WriteLine("Average resolution by priority:");
foreach (var priority in priorityAverages)
    Console.WriteLine($"{priority.Name}: {priority.Average.ToString("F1", CultureInfo.InvariantCulture)} hours (target {priority.TargetHours} hours)");

record Ticket(int Id, string Category, string Priority, string Status, int? ResolutionHours);
record Priority(string Name, int TargetHours);
