# Phase 1: C# Fundamentals (Days 01-30)

Each day uses a small, self-contained console project in `day-NN-topic/`.

| Exercise | Implementation | Personal reflection |
|---|---|---|
| [Day 01: Hello World](day-01-setup-net-10-and-hello-world) | Verified | Pending |
| [Day 02: Variables and Data Types](day-02-variables-and-data-types) | Verified | Pending |
| [Day 03: Operators and Strings](day-03-operators-and-strings) | Verified | Pending |
| [Day 04: Conditionals and Switch](day-04-conditionals-and-switch) | Verified | Pending |
| [Day 05: Loops](day-05-loops) | Verified | Pending |
| [Day 06: Arrays and List](day-06-arrays-and-list) | Verified | Pending |
| [Day 07: Checkpoint 1: To-Do Console App](day-07-checkpoint-1-to-do-console-app) | Verified | Pending |
| [Day 08: Methods](day-08-methods) | Verified | Pending |
| [Day 09: Debugging and Exceptions](day-09-debugging-and-exceptions) | Verified | Pending |
| [Day 10: Classes and Objects](day-10-classes-and-objects) | Verified | Pending |
| [Day 11: Encapsulation and Records](day-11-encapsulation-and-records) | Verified | Pending |
| [Day 12: Inheritance and Polymorphism](day-12-inheritance-and-polymorphism) | Verified | Pending |
| [Day 13: Interfaces](day-13-interfaces) | Verified | Pending |
| [Day 14: Checkpoint 2: IT Asset Inventory Console](day-14-checkpoint-2-it-asset-inventory-console) | Verified | Pending |
| [Day 15: Dictionary, HashSet, Queue, Stack](day-15-dictionary-hashset-queue-stack) | Verified | Pending |
| [Day 16: Enums, Structs and Nullable](day-16-enums-structs-and-nullable) | Verified | Pending |
| [Day 17: LINQ Part 1](day-17-linq-part-1) | Verified | Pending |
| [Day 18: LINQ Part 2](day-18-linq-part-2) | Verified | Pending |
| [Day 19: File I/O and CSV](day-19-file-i-o-and-csv) | Verified | Pending |
| [Day 20: JSON with System.Text.Json](day-20-json-with-system-text-json) | Verified | Pending |
| [Day 21: Checkpoint 3: Inventory with JSON and Reports](day-21-checkpoint-3-inventory-with-json-and) | Verified | Pending |
| [Day 22: Advanced Exceptions](day-22-advanced-exceptions) | Verified | Pending |
| [Day 23: Generics](day-23-generics) | Verified | Pending |
| [Day 24: Delegates, Lambdas and Events](day-24-delegates-lambdas-and-events) | Verified | Pending |

Days 25–30 remain planned in the [day catalog](../days/README.md).

Run the latest exercise from the repository root.

```powershell
dotnet run --project .\phase-1-csharp\day-24-delegates-lambdas-and-events
```

See the [Day 24 guide](day-24-delegates-lambdas-and-events/README.md) for the command list, event flow, and log commands.

Phase 1 projects inherit `UseAppHost=false` from [Directory.Build.props](Directory.Build.props) and run through the .NET runtime. See [directory-level build configuration](https://learn.microsoft.com/en-us/visualstudio/msbuild/customize-by-directory?view=visualstudio) for how this shared configuration is applied.

Topics include variables, control flow, methods, classes, inheritance, interfaces, collections, LINQ, file I/O, JSON, generics, async/await, and unit testing with xUnit.

The phase ends with HelpdeskConsole on Days 29-30. See the [roadmap](../ROADMAP.md) for the planned exercises and the [daily progress table](../README.md#daily-progress) for implementation status.
