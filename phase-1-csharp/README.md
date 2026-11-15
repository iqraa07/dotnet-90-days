# Phase 1: C# Fundamentals (Days 01-30)

Each day uses a small, self-contained console project in `day-NN-topic/`.

| Exercise | Implementation | Personal reflection |
|---|---|---|
| [Day 01: Hello World](day-01-setup-net-10-and-hello-world) | Verified | Pending |
| [Day 02: Variables and Data Types](day-02-variables-and-data-types) | Verified | Pending |

Days 03-30 remain planned in the [day catalog](../days/README.md).

Run the current Day 02 exercise from the repository root:

```powershell
dotnet run --project .\phase-1-csharp\day-02-variables-and-data-types
```

The temperature and MB-to-GB-to-TB converters are verified. See the [Day 02 guide and output images](day-02-variables-and-data-types/README.md) for the program flow, examples, and validation rules.

Phase 1 projects inherit `UseAppHost=false` from [Directory.Build.props](Directory.Build.props) and run through the .NET runtime. See [directory-level build configuration](https://learn.microsoft.com/en-us/visualstudio/msbuild/customize-by-directory?view=visualstudio) for how this shared configuration is applied.

Topics include variables, control flow, methods, classes, inheritance, interfaces, collections, LINQ, file I/O, JSON, generics, async/await, and unit testing with xUnit.

The phase ends with HelpdeskConsole on Days 29-30. See the [roadmap](../ROADMAP.md) for the planned exercises and the [daily progress table](../README.md#daily-progress) for implementation status.
