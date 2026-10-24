# 90-Day .NET Roadmap (C# to ASP.NET Core to Capstone)

Goal: prepare for junior .NET development by building an ASP.NET Core Web API with EF Core, SQL Server, authentication, tests, Docker, and deployment. The final phase produces a portfolio project.

- Time: 1-2 hours per session. Day numbers follow learning sessions rather than calendar dates. After a break, continue with the next session.
- Version: .NET 10 (LTS) and C# 14.
- Tools: VS Code with C# Dev Kit, or Visual Studio 2026 Community; Git and GitHub CLI.
- Language: English for documentation, identifiers, commit messages, and planned interface text. Keep locale-specific examples where they are part of the exercise.
- Progress: the README tracks completed implementation and verification. Personal reflection is recorded separately in each journal.

Each day includes:

- **Learn:** the concepts covered in the session.
- **Practice:** an exercise that applies those concepts.
- **Exercise:** the part to implement or investigate that day.

> Daily headings use `### Day NN — Title`, which is read by `scripts/day.ps1`. Keep this format, use ASCII characters in titles, and do not include `|`.

---

## Phase 1: C# Fundamentals (Day 01-30)

Code folder: `phase-1-csharp/day-NN-.../`, with one console project per day.

### Week 1: Foundations

### Day 01 — Setup .NET 10 and Hello World
- **Learn:** .NET, SDK versus runtime, `dotnet new`, `dotnet run`, `dotnet build`, the contents of `.csproj` and `Program.cs`, and top-level statements.
- **Practice:** run `.\day new 1`, replace Hello World with a greeting containing your name and the current date, then make the first commit and push.
- **Exercise:** display three lines: your name, the current date (`DateTime.Now`), and the .NET runtime version (`Environment.Version`).

### Day 02 — Variables and Data Types
- **Learn:** `int`, `long`, `double`, `decimal`, `bool`, `char`, `string`, `var`, `const`, input with `Console.ReadLine()`, and `int.Parse` versus `int.TryParse`.
- **Practice:** build a temperature converter from Celsius to Fahrenheit and Kelvin.
- **Exercise:** add data-size conversions from MB to GB to TB. Use `TryParse` so nonnumeric input does not crash the program.

### Day 03 — Operators and Strings
- **Learn:** arithmetic and comparison operators, string interpolation `$"..."`, number formatting with `ToString("N0")` and `("C", new CultureInfo("id-ID"))`, and string methods (`Trim`, `ToUpper`, `Contains`, `Split`, `Replace`).
- **Practice:** print a simple shopping receipt using Indonesian Rupiah formatting.
- **Exercise:** calculate a 10% discount when the total exceeds Rp100,000, then display the breakdown clearly.

### Day 04 — Conditionals and Switch
- **Learn:** `if / else if / else`, logical operators `&& || !`, `switch` statements, and modern C# switch expressions.
- **Practice:** determine helpdesk ticket priority (P1-P4) from impact and urgency.
- **Exercise:** write a switch expression that maps priority to a resolution-time target (SLA), such as P1 = 4 hours.

### Day 05 — Loops
- **Learn:** `for`, `while`, `do-while`, `foreach`, `break`, `continue`, and `Random.Shared`.
- **Practice:** build a number-guessing game from 1 to 100.
- **Exercise:** allow at most seven guesses, display the remaining attempts, and offer to play again at the end (y/n).

### Day 06 — Arrays and List
- **Learn:** arrays, `List<T>`, `Add`, `Remove`, `Count`, indexes, and iteration.
- **Practice:** keep a list of network devices in memory.
- **Exercise:** build a menu: 1) add, 2) view all, 3) delete by number, 0) exit.

### Day 07 — Checkpoint 1: To-Do Console App
- **Learn:** combine the first week's concepts and read your own code from the beginning.
- **Practice:** build a console To-Do app with add, complete, delete, and display operations.
- **Exercise:** add a filter that shows only incomplete items, then write the Week 1 reflection in the journal.

### Week 2: Methods and OOP

### Day 08 — Methods
- **Learn:** parameters, return values, overloading, optional parameters, expression-bodied methods, and the basics of `out` and `ref`.
- **Practice:** refactor the Day 02 and Day 03 programs into small methods.
- **Exercise:** write `CalculateSubnet(int prefix)` to return the number of usable hosts, for example /24 = 254.

### Day 09 — Debugging and Exceptions
- **Learn:** breakpoints, step over/into, watches in VS Code, `try / catch / finally`, and reading stack traces.
- **Practice:** work with a program containing three deliberate bugs.
- **Exercise:** find and fix all three bugs using the debugger, then record how you found them in the journal.

### Day 10 — Classes and Objects
- **Learn:** classes, objects, fields versus properties, constructors, instance methods, and overriding `ToString()`.
- **Practice:** create a `Device` class with Name, IpAddress, Location, and PurchaseDate.
- **Exercise:** add `GetAgeInYears()` and create three device objects.

### Day 11 — Encapsulation and Records
- **Learn:** access modifiers (`public`, `private`, `protected`, `internal`), validation in property setters, `record`, `init`, and immutability. Optional: the C# 14 `field` keyword.
- **Practice:** create a `Ticket` class whose status can change only through methods.
- **Exercise:** prevent a `Closed` ticket from being reopened. Throw an exception with a clear message.

### Day 12 — Inheritance and Polymorphism
- **Learn:** base classes, `virtual` / `override`, `abstract`, `base`, and `sealed`.
- **Practice:** use `Device` as a base class for `Laptop`, `Router`, and `Printer`.
- **Exercise:** override `GetMaintenanceInfo()` in each subclass using different rules.

### Day 13 — Interfaces
- **Learn:** `interface`, interfaces versus abstract classes, and their role in dependency injection.
- **Practice:** define `INotifier` with `ConsoleNotifier` and `FileNotifier` implementations.
- **Exercise:** add `TelegramNotifierFake`, which only prints a formatted message, then select the notifier through user input.

### Day 14 — Checkpoint 2: IT Asset Inventory Console
- **Learn:** design a small set of related classes.
- **Practice:** build an IT asset inventory app with add, view, and search by name/location.
- **Exercise:** add a filter for assets older than four years, then write the Week 2 reflection.

### Week 3: Collections, LINQ, and Files

### Day 15 — Dictionary, HashSet, Queue, Stack
- **Learn:** when to use each collection and basic performance differences.
- **Practice:** create a helpdesk ticket queue with `Queue<Ticket>`.
- **Exercise:** use `Dictionary<string, int>` to count tickets by category.

### Day 16 — Enums, Structs and Nullable
- **Learn:** `enum`, `struct` versus `class`, nullable reference types, the `?`, `??`, `?.`, and `!` operators, and nullable warnings.
- **Practice:** create `enum TicketStatus` and `enum Priority`, then resolve every nullable warning.
- **Exercise:** write a safe `FindTicket(int id)` method returning `Ticket?`, then handle null at the call site.

### Day 17 — LINQ Part 1
- **Learn:** `Where`, `Select`, `OrderBy`, `First` / `FirstOrDefault`, `Any`, `All`, `Count`, `Take`, and `Skip`.
- **Practice:** query a list of 30 sample assets.
- **Exercise:** write five queries, such as laptops in Makassar purchased before 2022, ordered from oldest to newest.

### Day 18 — LINQ Part 2
- **Learn:** `GroupBy`, `Sum`, `Average`, `Max`, `Join`, `ToDictionary`, and query syntax versus method syntax.
- **Practice:** report tickets by category and status.
- **Exercise:** calculate the average resolution time for each priority.

### Day 19 — File I/O and CSV
- **Learn:** `File.ReadAllLines`, `File.WriteAllText`, `Path.Combine`, `Directory`, simple CSV parsing, and `using` for resources.
- **Practice:** read `assets.csv` and display its contents as a table.
- **Exercise:** handle malformed CSV rows with missing columns without crashing, and report which rows were skipped.

### Day 20 — JSON with System.Text.Json
- **Learn:** `JsonSerializer.Serialize` / `Deserialize`, `JsonSerializerOptions`, and `[JsonPropertyName]`.
- **Practice:** save and load inventory data in `inventory.json`.
- **Exercise:** create `inventory.backup.json` automatically whenever data is saved.

### Day 21 — Checkpoint 3: Inventory with JSON and Reports
- **Learn:** combine file handling, LINQ, and OOP.
- **Practice:** extend the Day 14 app with persistent storage and a reports menu.
- **Exercise:** add an assets-by-location report, then write the Week 3 reflection.

### Week 4: Advanced C# and Testing

### Day 22 — Advanced Exceptions
- **Learn:** custom exceptions, `throw` versus `throw ex`, `when` exception filters, guard clauses, and `ArgumentNullException.ThrowIfNull`.
- **Practice:** add clear validation to the `Ticket` and `Device` classes.
- **Exercise:** create `InvalidTicketStateException` and use it in ticket status rules.

### Day 23 — Generics
- **Learn:** generic methods and classes, and constraints such as `where T : ...`.
- **Practice:** build `InMemoryRepository<T>` with Add, GetById, GetAll, and Remove operations.
- **Exercise:** add `Find(Func<T, bool> predicate)`.

### Day 24 — Delegates, Lambdas and Events
- **Learn:** `Func`, `Action`, `Predicate`, lambdas, and `event` / `EventHandler`.
- **Practice:** raise a `TicketCreated` event that triggers a notifier.
- **Exercise:** add `TicketClosed` and write its log entry to a file.

### Day 25 — Async, Await and HttpClient
- **Learn:** `Task`, `async` / `await`, `Task.WhenAll`, `HttpClient`, timeouts, and `CancellationToken`.
- **Practice:** check several websites' HTTP status codes and response times.
- **Exercise:** run the checks in parallel and compare their duration with sequential execution.

### Day 26 — Mini Tool: Network Checker
- **Learn:** `System.Net.NetworkInformation.Ping`, `Stopwatch`, and command-line arguments (`args`).
- **Practice:** build `netcheck` to ping hosts listed in a text file and check URLs.
- **Exercise:** save timestamped results to CSV. This tool can be used for network support tasks.

### Day 27 — Unit Testing with xUnit
- **Learn:** `dotnet new xunit`, `[Fact]`, `[Theory]` with `[InlineData]`, Arrange-Act-Assert, solution files (`.slnx` in .NET 10), and `dotnet test`.
- **Practice:** test `CalculateSubnet` and the `Ticket` status rules.
- **Exercise:** write at least five tests, including error cases.

### Day 28 — Git and GitHub in Depth
- **Learn:** branches, merges, pull requests in your own repository, `git log --oneline --graph`, `git restore`, and GitHub Actions results.
- **Practice:** create `feature/day-28`, open a pull request with `gh pr create`, then merge it.
- **Exercise:** explain commits, branches, and pull requests in your journal using your own words.

### Day 29 — Phase 1 Project: Helpdesk Console (Part 1)
- **Learn:** plan a program before implementation: features, classes, and workflows.
- **Practice:** build `HelpdeskConsole` with tickets, categories, priorities, statuses, and JSON storage.
- **Exercise:** implement and validate status changes.

### Day 30 — Phase 1 Project: Helpdesk Console (Part 2) and Review
- **Learn:** review Phase 1.
- **Practice:** add LINQ reports, unit tests, and the project README.
- **Exercise:** answer 15 quiz questions without looking at the code. Optional: complete the free *Foundational C# with Microsoft* certification through freeCodeCamp.

---

## Phase 2: ASP.NET Core Web API, EF Core, and SQL Server (Day 31-60)

Project: AssetTracker API, a small IT asset inventory system in `phase-2-webapi/`. Use one solution that grows throughout the phase.

### Week 5: Web API Fundamentals

### Day 31 — HTTP, REST and First Web API
- **Learn:** HTTP methods, status codes, JSON, REST, `dotnet new webapi --use-controllers`, `Program.cs`, and OpenAPI.
- **Practice:** create the `AssetTracker` solution and `AssetTracker.Api` project, then try the endpoints through a `.http` file in VS Code.
- **Exercise:** add `GET /api/ping`, returning `{ "status": "ok", "time": ... }`.

### Day 32 — Controllers and Routing
- **Learn:** `[ApiController]`, `[Route]`, `[HttpGet("{id}")]`, `ActionResult<T>`, route parameters, and query strings.
- **Practice:** build `AssetsController` using an in-memory list.
- **Exercise:** add `GET /api/assets?location=Makassar` with query-string filtering.

### Day 33 — CRUD In-Memory
- **Learn:** POST, PUT, DELETE, status codes 201 with `CreatedAtAction`, 204, and 404, and model binding.
- **Practice:** implement full asset CRUD.
- **Exercise:** write the PUT endpoint, including a 404 response when the asset does not exist.

### Day 34 — DTOs and Validation
- **Learn:** separating DTOs from entities, `record` DTOs, DataAnnotations (`[Required]`, `[StringLength]`, `[Range]`), and automatic 400 responses.
- **Practice:** create `CreateAssetRequest`, `UpdateAssetRequest`, and `AssetResponse`.
- **Exercise:** validate IP address format with a custom validation attribute.

### Day 35 — Dependency Injection
- **Learn:** DI containers, lifetimes (Singleton, Scoped, Transient), and constructor injection.
- **Practice:** move application logic to `IAssetService` / `AssetService`.
- **Exercise:** explain what happens when a service holding data is registered as Transient. Verify it with an experiment and record the result in the journal.

### Day 36 — Configuration, Logging and Options
- **Learn:** `appsettings.json`, Development/Production environments, `ILogger<T>`, and the Options pattern (`IOptions<T>`).
- **Practice:** load `AssetSettings`, such as `MaxAgeYears`, from configuration.
- **Exercise:** log an informational message whenever an asset is created or deleted.

### Day 37 — Checkpoint 4: Error Handling and API Testing
- **Learn:** `ProblemDetails`, global exception handling with `IExceptionHandler`, and request collections in `.http` files.
- **Practice:** add global error handling and a `.http` request collection for every endpoint.
- **Exercise:** test all endpoints, including three error scenarios, then write the Week 5 reflection.

### Week 6: Database

### Day 38 — SQL Basics
- **Learn:** install SQL Server Express or LocalDB with SSMS, or use the SQL Server extension in VS Code; practice `CREATE TABLE`, `INSERT`, `SELECT`, `WHERE`, and `ORDER BY`.
- **Practice:** create `Assets` and `Locations` tables manually with SQL.
- **Exercise:** write five SELECT queries and save them in `phase-2-webapi/sql/day-38.sql`.

### Day 39 — SQL Joins and Aggregates
- **Learn:** primary keys, foreign keys, `JOIN`, `GROUP BY`, `HAVING`, `COUNT` / `SUM`, indexes, and basic normalization.
- **Practice:** query an asset report grouped by location.
- **Exercise:** query locations with more than five assets older than three years.

### Day 40 — EF Core Introduction
- **Learn:** ORM, `DbContext`, `DbSet`, connection strings, `Microsoft.EntityFrameworkCore.SqlServer`, the `dotnet-ef` tool, and the first migration.
- **Practice:** create `AppDbContext` and an `Asset` entity, then run `dotnet ef migrations add InitialCreate` and `dotnet ef database update`.
- **Exercise:** store the connection string with `dotnet user-secrets`, outside committed files.

### Day 41 — EF Core CRUD
- **Learn:** async queries (`ToListAsync`, `FindAsync`), `AsNoTracking`, `SaveChangesAsync`, and change tracking.
- **Practice:** replace the in-memory list with database storage.
- **Exercise:** update the `AssetService` update and delete methods to use EF Core.

### Day 42 — Relationships
- **Learn:** one-to-many relationships, navigation properties, `Include`, and foreign keys.
- **Practice:** model one-to-many relationships from `Location` to `Asset` and from `Category` to `Asset`.
- **Exercise:** create `GET /api/locations/{id}/assets`.

### Day 43 — Migrations and Fluent API
- **Learn:** Fluent API configuration with `IEntityTypeConfiguration<T>`, seed data, adding columns through migrations, and rollback.
- **Practice:** move entity configuration into separate configuration classes and add seed data.
- **Exercise:** add a unique `SerialNumber` column through a new migration.

### Day 44 — Checkpoint 5: Search, Filter, Paging, Sorting
- **Learn:** `IQueryable`, dynamic queries, paging with `Skip` / `Take`, and paginated responses.
- **Practice:** implement `GET /api/assets?search=&location=&page=&pageSize=&sortBy=`.
- **Exercise:** cap `pageSize` at 50, then write the Week 6 reflection.

### Week 7: Architecture and Security

### Day 45 — Layered Architecture
- **Learn:** separate Api, Application, Domain, and Infrastructure, and manage project references.
- **Practice:** split the solution into multiple projects.
- **Exercise:** draw a simple ASCII or Mermaid diagram in the journal showing dependency direction.

### Day 46 — Service Layer and Mapping
- **Learn:** manual entity/DTO mapping with extension methods and reasons to avoid paid mapping libraries.
- **Practice:** write `ToResponse()` and `ToEntity()` extension methods.
- **Exercise:** implement mappings for `Location` and `Category`.

### Day 47 — Logging with Serilog and Global Errors
- **Learn:** structured logging, Serilog console/file sinks, correlation, and request logging.
- **Practice:** install Serilog and log requests.
- **Exercise:** record full 500-error details in the log file while keeping those details out of API responses.

### Day 48 — Authentication with JWT
- **Learn:** authentication versus authorization, JWT headers/payloads/signatures, `Microsoft.AspNetCore.Authentication.JwtBearer`, and password hashing.
- **Practice:** build registration and login endpoints that issue JWTs.
- **Exercise:** set token expiration to 60 minutes and test an expired token.

### Day 49 — Authorization with Roles and Policies
- **Learn:** `[Authorize]`, roles (Admin, Technician, Viewer), and policy-based authorization.
- **Practice:** protect asset endpoints: Viewer can read, Technician can modify, and Admin can delete.
- **Exercise:** create and apply the `CanDeleteAsset` policy.

### Day 50 — Unit Testing Services
- **Learn:** service-layer tests, fakes versus mocks with NSubstitute, and readable test structure.
- **Practice:** create `AssetTracker.Tests`.
- **Exercise:** write eight `AssetService` tests, including failure cases.

### Day 51 — Integration Testing
- **Learn:** `WebApplicationFactory`, test databases using SQLite in-memory or Testcontainers, and testing endpoints externally.
- **Practice:** test `GET /api/assets` and `POST /api/assets`, including authentication.
- **Exercise:** verify that a Viewer receives 403 when attempting to delete an asset.

### Week 8: Production Readiness

### Day 52 — Export CSV Report
- **Learn:** returning files from an API with `File()`, streams, and `Content-Disposition`.
- **Practice:** implement `GET /api/reports/assets.csv`.
- **Exercise:** add location and date filters to the export endpoint.

### Day 53 — Caching and Performance
- **Learn:** `IMemoryCache`, output caching, N+1 queries, `AsNoTracking`, and projections with `Select`.
- **Practice:** cache the locations list for five minutes.
- **Exercise:** measure response times before and after caching, then record the results.

### Day 54 — Docker
- **Learn:** images, containers, multi-stage Dockerfiles, and `docker compose` for an API and SQL Server.
- **Practice:** write the API Dockerfile and `compose.yaml`.
- **Exercise:** run the full stack with `docker compose up` and verify that migrations run.

### Day 55 — CI with GitHub Actions
- **Learn:** workflow YAML, jobs, steps, `dotnet test` in CI, and status badges.
- **Practice:** create a build/test workflow for AssetTracker.
- **Exercise:** deliberately fail a test, observe the failed CI run, then fix the test.

### Day 56 — Deploy to the Cloud
- **Learn:** deployment, environment variables, production connection strings, and free or low-cost hosting options such as an Azure App Service free tier or Docker-based hosting.
- **Practice:** deploy the API and database.
- **Exercise:** record repeatable deployment steps in `phase-2-webapi/DEPLOY.md`.

### Day 57 — Health Checks and Rate Limiting
- **Learn:** `AddHealthChecks` and `/health`, built-in ASP.NET Core rate limiting, and CORS.
- **Practice:** add a database health check and rate limiting for the login endpoint.
- **Exercise:** test rate limiting by sending repeated requests through a `.http` file or script.

### Day 58 — API Documentation
- **Learn:** OpenAPI, Scalar UI, API README structure, and request/response examples.
- **Practice:** document run instructions, endpoints, and screenshots in `phase-2-webapi/README.md`.
- **Exercise:** write a section titled "What I learned from this project" in your own words.

### Day 59 — Code Review and Refactor
- **Learn:** code smells, naming, overly long methods, and basic SOLID principles.
- **Practice:** review the codebase and list improvements.
- **Exercise:** implement at least three improvements from the review list.

### Day 60 — Phase 2 Review and Release v0.2
- **Learn:** review Phase 2.
- **Practice:** create the `v0.2` tag and a GitHub Release with `gh release create`.
- **Exercise:** answer 20 questions about APIs, EF Core, and authentication, then write the Phase 2 reflection.

---

## Phase 3: Capstone, HelpdeskLite (Day 61-90)

Build a full-stack helpdesk ticketing application with ASP.NET Core API, Blazor, and SQL Server. Use `phase-3-capstone/HelpdeskLite/` for the main portfolio project.

### Week 9: Planning and Core Features

### Day 61 — Requirements and Design
- **Learn:** user stories, ERDs, ticket status workflows, and GitHub Issues and Projects.
- **Practice:** create `phase-3-capstone/DESIGN.md` with features, a Mermaid ERD, and the status workflow; create an issue for each feature.
- **Exercise:** write 10 user stories, for example "As a technician, I want to ...".

### Day 62 — Solution Scaffold
- **Learn:** multi-project solution structure, `Directory.Build.props`, and project references.
- **Practice:** create HelpdeskLite.Api, .Application, .Domain, .Infrastructure, and .Tests.
- **Exercise:** verify that `dotnet build` and `dotnet test` pass, then explain each project's role in the README.

### Day 63 — Domain Model and Ticket Workflow
- **Learn:** rich domain models and business rules within entities.
- **Practice:** model `Ticket` with Open → InProgress → Resolved → Closed, priorities P1-P4, and `Category`.
- **Exercise:** implement the status transition rules and their unit tests.

### Day 64 — Database and Migrations
- **Learn:** EF Core domain configuration and category seed data.
- **Practice:** create `HelpdeskDbContext`, the initial migration, and seed data.
- **Exercise:** add indexes for frequently queried columns, including Status and Priority.

### Day 65 — Ticket CRUD Endpoints
- **Learn:** endpoints that call domain logic and validate requests.
- **Practice:** implement ticket creation, retrieval, listing, and updates.
- **Exercise:** implement `PATCH /api/tickets/{id}/status` using domain rules.

### Day 66 — Comments and Activity Log
- **Learn:** one-to-many relationships, audit fields (`CreatedAt`, `CreatedBy`), and EF Core interceptors.
- **Practice:** add ticket comments and automatic activity logs.
- **Exercise:** populate `CreatedAt` / `UpdatedAt` automatically through a `SaveChanges` interceptor.

### Day 67 — Checkpoint 6: Core Tests
- **Learn:** meaningful test coverage beyond a percentage.
- **Practice:** complete the core unit and integration tests.
- **Exercise:** add five edge-case tests, then write the Week 9 reflection.

### Week 10: Features

### Day 68 — Auth and Roles
- **Learn:** reuse Phase 2 JWT and role concepts for Requester, Technician, and Admin.
- **Practice:** implement registration, login, and demo account seeding.
- **Exercise:** ensure that Requesters can see only their own tickets.

### Day 69 — Ticket Assignment
- **Learn:** resource-based authorization.
- **Practice:** assign tickets to technicians and implement `GET /api/tickets/mine`.
- **Exercise:** allow only Admin to assign tickets, and allow technicians to modify only tickets assigned to them.

### Day 70 — SLA and Background Service
- **Learn:** `BackgroundService`, `PeriodicTimer`, and `TimeProvider` for testable time handling.
- **Practice:** calculate SLA deadlines from priority, then use a periodic service to flag overdue tickets.
- **Exercise:** test SLA logic with `FakeTimeProvider`.

### Day 71 — Search, Filter and Paging
- **Learn:** apply the Day 44 patterns again.
- **Practice:** filter by status, priority, category, technician, and keyword.
- **Exercise:** add sorting by SLA deadline.

### Day 72 — Dashboard Statistics
- **Learn:** LINQ-to-SQL aggregation and DTO projections.
- **Practice:** implement `GET /api/dashboard` with counts by status, priority, and category.
- **Exercise:** calculate average resolution time and the number of tickets that exceeded their SLA.

### Day 73 — Notifications
- **Learn:** `INotificationService`, SMTP with MailKit, or an implementation that writes notifications to logs.
- **Practice:** send a notification when a ticket is created or assigned.
- **Exercise:** create a clear notification message template.

### Day 74 — Checkpoint 7: Integration Tests
- **Learn:** test a complete workflow.
- **Practice:** test the create → assign → resolve → close ticket workflow.
- **Exercise:** fix every failing test, then write the Week 10 reflection.

### Week 11: Blazor Frontend

### Day 75 — Blazor Introduction
- **Learn:** Blazor Web App, components, parameters, routing, and render modes.
- **Practice:** create `HelpdeskLite.Web` and its basic layout.
- **Exercise:** create `PriorityBadge` with different colors for P1-P4.

### Day 76 — Ticket List Page
- **Learn:** calling an API from Blazor with a typed `HttpClient`, and handling loading and error states.
- **Practice:** build the ticket list page.
- **Exercise:** add a status filter to the page.

### Day 77 — Create and Edit Forms
- **Learn:** `EditForm`, `DataAnnotationsValidator`, and binding.
- **Practice:** build ticket creation and editing forms.
- **Exercise:** display clear, user-friendly validation messages in English.

### Day 78 — Login and Auth State in Blazor
- **Learn:** `AuthenticationStateProvider`, token storage, and `AuthorizeView`.
- **Practice:** build the login page and role-specific menus.
- **Exercise:** hide buttons that the current role is not allowed to use.

### Day 79 — Dashboard Page
- **Learn:** display statistics in the UI.
- **Practice:** build a dashboard with metric cards and tables.
- **Exercise:** add a simple chart; a CSS bar chart is sufficient.

### Day 80 — UI Polish
- **Learn:** visual consistency, responsive mobile layouts, and basic accessibility.
- **Practice:** refine layout, navigation, empty states, and error pages.
- **Exercise:** test a mobile viewport with DevTools and fix three issues.

### Day 81 — Checkpoint 8: End-to-End Manual Testing
- **Learn:** manual test checklists and bug reports.
- **Practice:** run every scenario as Requester, Technician, and Admin.
- **Exercise:** record bugs as GitHub Issues, fix at least two, then write the Week 11 reflection.

### Week 12: Release

### Day 82 — Attachments
- **Learn:** file uploads, size/type validation, and local storage.
- **Practice:** attach screenshots to tickets.
- **Exercise:** reject files larger than 5 MB and disallowed file types.

### Day 83 — Logging and Health Checks
- **Learn:** reuse Phase 2 Serilog and health check patterns.
- **Practice:** add structured logging and `/health`.
- **Exercise:** include the ticket ID in each log entry where relevant.

### Day 84 — Docker Compose Full Stack
- **Learn:** multi-service Compose for API, web, and database services, networking, and volumes.
- **Practice:** write `compose.yaml` for the full application.
- **Exercise:** document how to start the application with one command.

### Day 85 — CI/CD Pipeline
- **Learn:** automated build/test pipelines and optional deployment.
- **Practice:** create a HelpdeskLite workflow.
- **Exercise:** add the CI badge to the HelpdeskLite README.

### Day 86 — Deploy and Demo Data
- **Learn:** full-stack deployment, demo data, and demo accounts.
- **Practice:** deploy the application and seed realistic sample data.
- **Exercise:** test the live application from a phone.

### Day 87 — Security Review
- **Learn:** OWASP Top 10 basics, including SQL injection and EF Core, XSS, repository secrets, CORS, and HTTPS.
- **Practice:** review the project using a security checklist.
- **Exercise:** check Git history for secrets with `git log -p`, including searches for "password".

### Day 88 — Documentation and Screenshots
- **Learn:** write a portfolio project README.
- **Practice:** document screenshots, architecture diagrams, features, the tech stack, and run instructions.
- **Exercise:** record a 1-2 minute demo GIF or video.

### Day 89 — CV, LinkedIn and GitHub Profile
- **Learn:** present projects on a CV and GitHub profile.
- **Practice:** create a GitHub profile README (`username/username`), pin the repository, and draft CV points for HelpdeskLite and AssetTracker.
- **Exercise:** write three project achievement statements using "Built X using Y, resulting in Z".

### Day 90 — Retrospective and Release v1.0
- **Learn:** reflect on the 90 sessions and plan further study.
- **Practice:** create the `v1.0` tag and a GitHub Release, then update the main README.
- **Exercise:** write `RETROSPECTIVE.md` covering what worked, what was difficult, and goals for the next 90 days.

---

## Roadmap Change History

Record each roadmap change here.

| Date | Author | Change |
|---|---|---|
| 2026-10-24 | - | Initial 90-day roadmap |
| 2026-10-25 | - | Refined wording and instructions without changing the 90-day topic sequence |
| 2026-10-25 | - | Translated documentation and planned interface text to English, including CalculateSubnet and Day 77 validation messages; preserved all daily headings and locale-specific currency examples |
