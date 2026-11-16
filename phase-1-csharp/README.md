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

Days 07–30 remain planned in the [day catalog](../days/README.md).

Run the latest exercise from the repository root.

```powershell
dotnet run --project .\phase-1-csharp\day-06-arrays-and-list
```

See the [Day 06 guide](day-06-arrays-and-list/README.md) for examples.

Phase 1 projects inherit `UseAppHost=false` from [Directory.Build.props](Directory.Build.props) and run through the .NET runtime. See [directory-level build configuration](https://learn.microsoft.com/en-us/visualstudio/msbuild/customize-by-directory?view=visualstudio) for how this shared configuration is applied.

Topics include variables, control flow, methods, classes, inheritance, interfaces, collections, LINQ, file I/O, JSON, generics, async/await, and unit testing with xUnit.

The phase ends with HelpdeskConsole on Days 29-30. See the [roadmap](../ROADMAP.md) for the planned exercises and the [daily progress table](../README.md#daily-progress) for implementation status.
