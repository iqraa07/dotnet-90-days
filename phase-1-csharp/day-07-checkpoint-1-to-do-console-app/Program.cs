var tasks = new List<TodoItem>();
int nextId = 1;

while (true)
{
    Console.WriteLine("1 add | 2 complete | 3 delete | 4 all | 5 pending | 0 exit");
    string? choice = Console.ReadLine()?.Trim();
    switch (choice)
    {
        case "1":
            Console.WriteLine("Task title:");
            string? title = Console.ReadLine()?.Trim();
            if (title is null)
            {
                return;
            }
            if (title.Length == 0)
            {
                Console.WriteLine("Enter a task title.");
                break;
            }

            tasks.Add(new TodoItem(nextId, title));
            Console.WriteLine($"Added #{nextId}.");
            nextId++;
            break;
        case "2":
        case "3":
            Console.WriteLine("Task ID:");
            string? input = Console.ReadLine();
            if (input is null)
            {
                return;
            }
            TodoItem? task = int.TryParse(input, out int id) ? tasks.Find(item => item.Id == id) : null;
            if (task is null)
            {
                Console.WriteLine("Unknown task ID.");
                break;
            }
            if (choice == "2")
            {
                task.Complete = true;
                Console.WriteLine($"Completed #{task.Id}.");
            }
            else
            {
                tasks.Remove(task);
                Console.WriteLine($"Removed #{task.Id}.");
            }
            break;
        case "4":
            ShowItems();
            break;
        case "5":
            ShowItems(pendingOnly: true);
            break;
        case "0":
        case null:
            return;
        default:
            Console.WriteLine("Unknown menu choice.");
            break;
    }
}

void ShowItems(bool pendingOnly = false)
{
    Console.WriteLine(pendingOnly ? "Pending tasks" : "All tasks");
    bool found = false;
    foreach (TodoItem task in tasks)
    {
        if (pendingOnly && task.Complete)
        {
            continue;
        }
        string status = task.Complete ? "x" : " ";
        Console.WriteLine($"[{status}] #{task.Id} {task.Title}");
        found = true;
    }
    if (!found)
    {
        Console.WriteLine("No matching tasks.");
    }
}

sealed class TodoItem(int id, string title)
{
    public int Id { get; } = id;
    public string Title { get; } = title;
    public bool Complete { get; set; }
}
