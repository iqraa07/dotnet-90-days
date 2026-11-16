# Day 07: Checkpoint 1: To-Do Console App

This small To-Do app adds, completes, and removes tasks. The same list view can display all tasks or only unfinished ones. IDs stay stable during the session.

## Run the example

From the repository root, build and run the example in PowerShell.

```powershell
dotnet build .\phase-1-csharp\day-07-checkpoint-1-to-do-console-app -c Release
@('1', 'Read project docs', '1', 'Run exercise', '2', '1', '5', '0') | dotnet run --project .\phase-1-csharp\day-07-checkpoint-1-to-do-console-app -c Release --no-build
```

## How it works

The program keeps tasks in a `List<TodoItem>`. The pending view skips items whose `Complete` flag is set. The data lasts for one run. The Week 1 reflection remains open in the journal.

## Verification

The Release build and 5 CLI checks passed. See the [daily overview](../../days/day-07/README.md) and [check transcript](../../assets/progress/day-07-checks.txt).
