# 90 Days of .NET

[![build](https://github.com/iqraa07/dotnet-90-days/actions/workflows/build.yml/badge.svg)](https://github.com/iqraa07/dotnet-90-days/actions/workflows/build.yml)

A 90-day .NET study plan covering C# fundamentals, Web API development, and a HelpdeskLite ticketing application. Exercises, journals, and phase projects stay in one repository.

[Muhammad Iqra Nur Fajar](https://github.com/iqraa07)

[Day 01-90 catalog](days/README.md) · [Learning map](#learning-map) · [Progress evidence](assets/progress/README.md) · [Day 02](days/day-02/README.md) · [Day 01](days/day-01/README.md) · [Journals](journal) · [Setup](START-HERE.md)

<!-- progress:start -->
**Implementation:** 1 / 90 exercises (1%) · **Current:** Day 02 · **Last update:** 2026-10-25
<!-- progress:end -->

## Learning map

Start with the [daily catalog](days/README.md). Each `days/day-NN/` folder links to its planned material, source, and available evidence. The [roadmap](ROADMAP.md) contains the full exercises; source remains grouped by phase.

```mermaid
flowchart LR
    A["Day 01-30<br/>C# fundamentals"] --> B["Day 31-60<br/>Web API and databases"]
    B --> C["Day 61-90<br/>HelpdeskLite"]
```

| Phase | Days | Focus | Source |
|---|---|---|---|
| 1 | 01-30 | C# fundamentals, OOP, collections, LINQ, async, unit testing | [`phase-1-csharp`](phase-1-csharp) |
| 2 | 31-60 | ASP.NET Core Web API, EF Core, SQL Server, authentication, Docker, CI | [`phase-2-webapi`](phase-2-webapi) |
| 3 | 61-90 | HelpdeskLite: a ticketing application with an API and Blazor | [`phase-3-capstone`](phase-3-capstone) |

## Stack

C# 14 · .NET 10 (LTS) · ASP.NET Core · Entity Framework Core · SQL Server · xUnit · Blazor · Docker · GitHub Actions

## Current exercise: Day 02

Install the .NET 10 SDK, then run these commands from the repository root:

```powershell
dotnet --version
dotnet build .\phase-1-csharp\day-02-variables-and-data-types -c Release
dotnet run --project .\phase-1-csharp\day-02-variables-and-data-types -c Release --no-build
.\day status
```

Day 02 introduces variables, numeric types, and safe input parsing. The temperature converter is ready; the MB-to-GB-to-TB exercise remains for you to implement. See the [Day 02 overview](days/day-02/README.md) and [journal](journal/day-02-variables-and-data-types.md).

Day 01 remains implemented and verified. Its source and run instructions are available in the [Day 01 overview](days/day-01/README.md).

## Progress evidence

The [evidence index](assets/progress/README.md) includes the exported images, terminal output, source capture, and passing CI run.

![Day 01 source and execution output](assets/progress/day-01-terminal.png)

## Daily progress

⬜ planned · 🟡 in progress · ✅ implementation verified · ⏭️ skipped

A checkmark records completed implementation and verification. Personal reflection is tracked separately in each journal and may still be pending. Day numbers follow study sessions rather than calendar dates. Daily commits use `day-NN: ...` and describe actual work.

<details>
<summary>View all 90 days</summary>

| Day | Topic | Phase | Status | Date | Journal |
|---|---|---|---|---|---|
| 01 | Setup .NET 10 and Hello World | 1 | ✅ | 2026-10-25 | [journal](journal/day-01-setup-net-10-and-hello-world.md) |
| 02 | Variables and Data Types | 1 | 🟡 | 2026-10-25 | [journal](journal/day-02-variables-and-data-types.md) |
| 03 | Operators and Strings | 1 | ⬜ | - | - |
| 04 | Conditionals and Switch | 1 | ⬜ | - | - |
| 05 | Loops | 1 | ⬜ | - | - |
| 06 | Arrays and List | 1 | ⬜ | - | - |
| 07 | Checkpoint 1: To-Do Console App | 1 | ⬜ | - | - |
| 08 | Methods | 1 | ⬜ | - | - |
| 09 | Debugging and Exceptions | 1 | ⬜ | - | - |
| 10 | Classes and Objects | 1 | ⬜ | - | - |
| 11 | Encapsulation and Records | 1 | ⬜ | - | - |
| 12 | Inheritance and Polymorphism | 1 | ⬜ | - | - |
| 13 | Interfaces | 1 | ⬜ | - | - |
| 14 | Checkpoint 2: IT Asset Inventory Console | 1 | ⬜ | - | - |
| 15 | Dictionary, HashSet, Queue, Stack | 1 | ⬜ | - | - |
| 16 | Enums, Structs and Nullable | 1 | ⬜ | - | - |
| 17 | LINQ Part 1 | 1 | ⬜ | - | - |
| 18 | LINQ Part 2 | 1 | ⬜ | - | - |
| 19 | File I/O and CSV | 1 | ⬜ | - | - |
| 20 | JSON with System.Text.Json | 1 | ⬜ | - | - |
| 21 | Checkpoint 3: Inventory with JSON and Reports | 1 | ⬜ | - | - |
| 22 | Advanced Exceptions | 1 | ⬜ | - | - |
| 23 | Generics | 1 | ⬜ | - | - |
| 24 | Delegates, Lambdas and Events | 1 | ⬜ | - | - |
| 25 | Async, Await and HttpClient | 1 | ⬜ | - | - |
| 26 | Mini Tool: Network Checker | 1 | ⬜ | - | - |
| 27 | Unit Testing with xUnit | 1 | ⬜ | - | - |
| 28 | Git and GitHub in Depth | 1 | ⬜ | - | - |
| 29 | Phase 1 Project: Helpdesk Console (Part 1) | 1 | ⬜ | - | - |
| 30 | Phase 1 Project: Helpdesk Console (Part 2) and Review | 1 | ⬜ | - | - |
| 31 | HTTP, REST and First Web API | 2 | ⬜ | - | - |
| 32 | Controllers and Routing | 2 | ⬜ | - | - |
| 33 | CRUD In-Memory | 2 | ⬜ | - | - |
| 34 | DTOs and Validation | 2 | ⬜ | - | - |
| 35 | Dependency Injection | 2 | ⬜ | - | - |
| 36 | Configuration, Logging and Options | 2 | ⬜ | - | - |
| 37 | Checkpoint 4: Error Handling and API Testing | 2 | ⬜ | - | - |
| 38 | SQL Basics | 2 | ⬜ | - | - |
| 39 | SQL Joins and Aggregates | 2 | ⬜ | - | - |
| 40 | EF Core Introduction | 2 | ⬜ | - | - |
| 41 | EF Core CRUD | 2 | ⬜ | - | - |
| 42 | Relationships | 2 | ⬜ | - | - |
| 43 | Migrations and Fluent API | 2 | ⬜ | - | - |
| 44 | Checkpoint 5: Search, Filter, Paging, Sorting | 2 | ⬜ | - | - |
| 45 | Layered Architecture | 2 | ⬜ | - | - |
| 46 | Service Layer and Mapping | 2 | ⬜ | - | - |
| 47 | Logging with Serilog and Global Errors | 2 | ⬜ | - | - |
| 48 | Authentication with JWT | 2 | ⬜ | - | - |
| 49 | Authorization with Roles and Policies | 2 | ⬜ | - | - |
| 50 | Unit Testing Services | 2 | ⬜ | - | - |
| 51 | Integration Testing | 2 | ⬜ | - | - |
| 52 | Export CSV Report | 2 | ⬜ | - | - |
| 53 | Caching and Performance | 2 | ⬜ | - | - |
| 54 | Docker | 2 | ⬜ | - | - |
| 55 | CI with GitHub Actions | 2 | ⬜ | - | - |
| 56 | Deploy to the Cloud | 2 | ⬜ | - | - |
| 57 | Health Checks and Rate Limiting | 2 | ⬜ | - | - |
| 58 | API Documentation | 2 | ⬜ | - | - |
| 59 | Code Review and Refactor | 2 | ⬜ | - | - |
| 60 | Phase 2 Review and Release v0.2 | 2 | ⬜ | - | - |
| 61 | Requirements and Design | 3 | ⬜ | - | - |
| 62 | Solution Scaffold | 3 | ⬜ | - | - |
| 63 | Domain Model and Ticket Workflow | 3 | ⬜ | - | - |
| 64 | Database and Migrations | 3 | ⬜ | - | - |
| 65 | Ticket CRUD Endpoints | 3 | ⬜ | - | - |
| 66 | Comments and Activity Log | 3 | ⬜ | - | - |
| 67 | Checkpoint 6: Core Tests | 3 | ⬜ | - | - |
| 68 | Auth and Roles | 3 | ⬜ | - | - |
| 69 | Ticket Assignment | 3 | ⬜ | - | - |
| 70 | SLA and Background Service | 3 | ⬜ | - | - |
| 71 | Search, Filter and Paging | 3 | ⬜ | - | - |
| 72 | Dashboard Statistics | 3 | ⬜ | - | - |
| 73 | Notifications | 3 | ⬜ | - | - |
| 74 | Checkpoint 7: Integration Tests | 3 | ⬜ | - | - |
| 75 | Blazor Introduction | 3 | ⬜ | - | - |
| 76 | Ticket List Page | 3 | ⬜ | - | - |
| 77 | Create and Edit Forms | 3 | ⬜ | - | - |
| 78 | Login and Auth State in Blazor | 3 | ⬜ | - | - |
| 79 | Dashboard Page | 3 | ⬜ | - | - |
| 80 | UI Polish | 3 | ⬜ | - | - |
| 81 | Checkpoint 8: End-to-End Manual Testing | 3 | ⬜ | - | - |
| 82 | Attachments | 3 | ⬜ | - | - |
| 83 | Logging and Health Checks | 3 | ⬜ | - | - |
| 84 | Docker Compose Full Stack | 3 | ⬜ | - | - |
| 85 | CI/CD Pipeline | 3 | ⬜ | - | - |
| 86 | Deploy and Demo Data | 3 | ⬜ | - | - |
| 87 | Security Review | 3 | ⬜ | - | - |
| 88 | Documentation and Screenshots | 3 | ⬜ | - | - |
| 89 | CV, LinkedIn and GitHub Profile | 3 | ⬜ | - | - |
| 90 | Retrospective and Release v1.0 | 3 | ⬜ | - | - |

</details>

## Repository layout

```text
days/              daily catalog and Day 01-90 overviews
phase-1-csharp/    individual C# console exercises
phase-2-webapi/    shared AssetTracker API project
phase-3-capstone/  shared HelpdeskLite project
journal/          work records and personal reflections
assets/progress/  verified output, images, and evidence index
scripts/          daily workflow and image export helpers
templates/        journal, CI, and editor templates
docs/             setup, workflow, session checklists, and command reference
```

Read [START-HERE.md](START-HERE.md) for setup and [ROADMAP.md](ROADMAP.md) for the complete plan.
