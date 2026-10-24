# Roadmap 90 Hari .NET (C# → ASP.NET Core → Proyek Akhir)

Target: dalam 90 hari, setara **Junior .NET Developer** — bisa membuat Web API dengan ASP.NET Core + EF Core + SQL Server, ada login dan test, berjalan di Docker, lalu di-deploy. Ditambah satu proyek portofolio yang bisa ditunjukkan ke recruiter.

- Waktu: 1–2 jam per hari. Nomor hari mengikuti **sesi belajar**, bukan tanggal. Kalau ada hari yang bolong, lanjutkan ke nomor berikutnya.
- Versi: **.NET 10 (LTS)** + C# 14.
- Tools: VS Code + C# Dev Kit (atau Visual Studio 2026 Community), Git, GitHub CLI.
- Bahasa: penjelasan pakai Bahasa Indonesia; kode, nama class, dan commit message pakai English.

Format setiap hari:

- **Belajar:** konsep yang dipelajari hari itu.
- **Praktik:** latihan untuk menerapkan materi hari itu.
- **TODO kamu:** bagian latihan yang menjadi fokus hari itu.

> Judul tiap hari memakai format `### Day NN — Judul` dan dibaca oleh `scripts/day.ps1`. Pertahankan format tersebut; isi judul menggunakan huruf ASCII dan tidak memakai karakter `|`.

---

## Fase 1 — Dasar C# (Day 01–30)

Folder kode: `phase-1-csharp/day-NN-.../`, satu project console untuk setiap hari.

### Minggu 1 — Fondasi

### Day 01 — Setup .NET 10 and Hello World
- **Belajar:** apa itu .NET, SDK vs runtime, perintah `dotnet new`, `dotnet run`, `dotnet build`; isi file `.csproj` dan `Program.cs`; top-level statements.
- **Praktik:** jalankan `.\day new 1`, ubah Hello World menjadi sapaan dengan nama dan tanggal hari ini, lalu commit dan push pertama.
- **TODO kamu:** tampilkan 3 baris: nama kamu, tanggal hari ini (`DateTime.Now`), dan versi .NET (`Environment.Version`).

### Day 02 — Variables and Data Types
- **Belajar:** `int`, `long`, `double`, `decimal`, `bool`, `char`, `string`, `var`, `const`; input dengan `Console.ReadLine()`; `int.Parse` vs `int.TryParse`.
- **Praktik:** program konversi suhu (Celsius ke Fahrenheit dan Kelvin).
- **TODO kamu:** tambahkan konversi satuan data (MB ke GB ke TB). Pakai `TryParse` supaya input huruf tidak bikin program crash.

### Day 03 — Operators and Strings
- **Belajar:** operator aritmatika dan perbandingan, string interpolation `$"..."`, format angka `ToString("N0")` dan `("C", new CultureInfo("id-ID"))`, method string (`Trim`, `ToUpper`, `Contains`, `Split`, `Replace`).
- **Praktik:** struk belanja sederhana dalam format Rupiah.
- **TODO kamu:** hitung diskon 10% kalau total di atas Rp100.000, lalu tampilkan rinciannya dengan rapi.

### Day 04 — Conditionals and Switch
- **Belajar:** `if / else if / else`, operator logika `&& || !`, `switch` statement, switch expression (C# modern).
- **Praktik:** penentu prioritas tiket helpdesk (P1–P4) berdasarkan dampak dan urgensi.
- **TODO kamu:** tulis switch expression yang mengubah prioritas menjadi target waktu penyelesaian (SLA), misalnya P1 = 4 jam.

### Day 05 — Loops
- **Belajar:** `for`, `while`, `do-while`, `foreach`, `break`, `continue`, `Random.Shared`.
- **Praktik:** game tebak angka 1–100.
- **TODO kamu:** batasi maksimal 7 tebakan, tampilkan sisa kesempatan, lalu tawarkan main lagi di akhir (y/n).

### Day 06 — Arrays and List
- **Belajar:** array, `List<T>`, `Add`, `Remove`, `Count`, index, iterasi.
- **Praktik:** daftar perangkat jaringan yang disimpan di memori.
- **TODO kamu:** buat menu: 1) tambah, 2) lihat semua, 3) hapus berdasarkan nomor, 0) keluar.

### Day 07 — Checkpoint 1: To-Do Console App
- **Belajar:** menggabungkan semua materi minggu 1; membaca kode sendiri dari awal.
- **Praktik:** aplikasi To-Do berbasis console (tambah, tandai selesai, hapus, tampilkan).
- **TODO kamu:** tambahkan fitur "tampilkan hanya yang belum selesai", lalu tulis refleksi minggu 1 di jurnal.

### Minggu 2 — Method dan OOP

### Day 08 — Methods
- **Belajar:** parameter, return value, overloading, optional parameter, expression-bodied method, `out` dan `ref` (dasar).
- **Praktik:** refactor program Day 02 dan 03 menjadi method-method kecil.
- **TODO kamu:** buat method `HitungSubnet(int prefix)` yang mengembalikan jumlah host yang bisa dipakai (contoh: /24 = 254).

### Day 09 — Debugging and Exceptions
- **Belajar:** breakpoint, step over/into, watch di VS Code; `try / catch / finally`; membaca stack trace.
- **Praktik:** program latihan berisi 3 bug yang disengaja.
- **TODO kamu:** temukan dan perbaiki ketiga bug memakai debugger, lalu catat cara menemukannya di jurnal.

### Day 10 — Classes and Objects
- **Belajar:** class, object, field vs property, constructor, method di dalam class, `ToString()` override.
- **Praktik:** class `Device` (Name, IpAddress, Location, PurchaseDate).
- **TODO kamu:** tambahkan method `GetAgeInYears()` dan buat 3 object perangkat.

### Day 11 — Encapsulation and Records
- **Belajar:** access modifier (`public`, `private`, `protected`, `internal`), validasi di property setter, `record`, `init`, immutability. Bonus: keyword `field` di C# 14.
- **Praktik:** class `Ticket` yang statusnya hanya bisa berubah lewat method.
- **TODO kamu:** pastikan tiket yang sudah `Closed` tidak bisa dibuka lagi. Lempar exception dengan pesan yang jelas.

### Day 12 — Inheritance and Polymorphism
- **Belajar:** base class, `virtual` / `override`, `abstract`, `base`, `sealed`.
- **Praktik:** `Device` sebagai base class, lalu turunan `Laptop`, `Router`, `Printer`.
- **TODO kamu:** override method `GetMaintenanceInfo()` di setiap turunan dengan aturan yang berbeda.

### Day 13 — Interfaces
- **Belajar:** `interface`, beda interface vs abstract class, dan alasan interface penting untuk dependency injection nanti.
- **Praktik:** `INotifier` dengan dua implementasi: `ConsoleNotifier` dan `FileNotifier`.
- **TODO kamu:** buat implementasi ketiga `TelegramNotifierFake` yang hanya mencetak format pesan, lalu pilih notifier lewat input user.

### Day 14 — Checkpoint 2: IT Asset Inventory Console
- **Belajar:** desain class kecil yang saling terhubung.
- **Praktik:** aplikasi inventaris aset IT (tambah, lihat, cari berdasarkan nama/lokasi).
- **TODO kamu:** tambah fitur "aset berumur lebih dari 4 tahun", lalu tulis refleksi minggu 2.

### Minggu 3 — Collection, LINQ, File

### Day 15 — Dictionary, HashSet, Queue, Stack
- **Belajar:** kapan memakai setiap collection; kompleksitas sederhana (cepat vs lambat).
- **Praktik:** antrian tiket helpdesk memakai `Queue<Ticket>`.
- **TODO kamu:** pakai `Dictionary<string, int>` untuk menghitung jumlah tiket per kategori.

### Day 16 — Enums, Structs and Nullable
- **Belajar:** `enum`, `struct` vs `class`, nullable reference types, operator `?`, `??`, `?.`, `!`; arti warning nullable.
- **Praktik:** `enum TicketStatus` dan `enum Priority`, lalu bersihkan semua warning nullable.
- **TODO kamu:** tulis method aman `FindTicket(int id)` yang mengembalikan `Ticket?`, lalu tangani kasus null di pemanggilnya.

### Day 17 — LINQ Part 1
- **Belajar:** `Where`, `Select`, `OrderBy`, `First` / `FirstOrDefault`, `Any`, `All`, `Count`, `Take`, `Skip`.
- **Praktik:** query daftar 30 aset dummy.
- **TODO kamu:** tulis 5 query sendiri, misalnya "laptop di Makassar yang dibeli sebelum 2022, diurutkan dari yang tertua".

### Day 18 — LINQ Part 2
- **Belajar:** `GroupBy`, `Sum`, `Average`, `Max`, `Join`, `ToDictionary`, query syntax vs method syntax.
- **Praktik:** laporan tiket per kategori dan per status.
- **TODO kamu:** hitung rata-rata waktu penyelesaian tiket per prioritas.

### Day 19 — File I/O and CSV
- **Belajar:** `File.ReadAllLines`, `File.WriteAllText`, `Path.Combine`, `Directory`; parsing CSV sederhana; `using` untuk resource.
- **Praktik:** baca file `assets.csv` lalu tampilkan sebagai tabel.
- **TODO kamu:** tangani baris CSV yang rusak (kolom kurang) tanpa membuat program crash, lalu laporkan baris mana yang dilewati.

### Day 20 — JSON with System.Text.Json
- **Belajar:** `JsonSerializer.Serialize` / `Deserialize`, `JsonSerializerOptions`, atribut `[JsonPropertyName]`.
- **Praktik:** simpan dan muat data inventaris ke `inventory.json`.
- **TODO kamu:** tambah fitur backup otomatis (`inventory.backup.json`) setiap kali data disimpan.

### Day 21 — Checkpoint 3: Inventory with JSON and Reports
- **Belajar:** menggabungkan file, LINQ, dan OOP.
- **Praktik:** upgrade aplikasi Day 14 supaya data tersimpan permanen dan punya menu laporan.
- **TODO kamu:** tambah laporan "aset per lokasi", lalu tulis refleksi minggu 3.

### Minggu 4 — C# Lanjutan dan Testing

### Day 22 — Advanced Exceptions
- **Belajar:** custom exception, `throw` vs `throw ex`, exception filter `when`, guard clause, `ArgumentNullException.ThrowIfNull`.
- **Praktik:** tambahkan validasi yang rapi ke class `Ticket` dan `Device`.
- **TODO kamu:** buat `InvalidTicketStateException` dan pakai di aturan status tiket.

### Day 23 — Generics
- **Belajar:** generic method dan class, constraint `where T : ...`.
- **Praktik:** `InMemoryRepository<T>` dengan operasi Add, GetById, GetAll, Remove.
- **TODO kamu:** tambahkan method `Find(Func<T, bool> predicate)`.

### Day 24 — Delegates, Lambdas and Events
- **Belajar:** `Func`, `Action`, `Predicate`, lambda, `event` / `EventHandler`.
- **Praktik:** event `TicketCreated` yang memicu notifier.
- **TODO kamu:** tambahkan event `TicketClosed` lalu catat log-nya ke file.

### Day 25 — Async, Await and HttpClient
- **Belajar:** `Task`, `async` / `await`, `Task.WhenAll`, `HttpClient`, timeout, `CancellationToken`.
- **Praktik:** cek status beberapa website (kode HTTP dan waktu respons).
- **TODO kamu:** jalankan pengecekan secara paralel lalu bandingkan waktunya dengan versi berurutan.

### Day 26 — Mini Tool: Network Checker
- **Belajar:** `System.Net.NetworkInformation.Ping`, `Stopwatch`, argumen command line (`args`).
- **Praktik:** tool `netcheck` yang mem-ping daftar host dari file teks dan memeriksa URL.
- **TODO kamu:** simpan hasilnya ke CSV dengan timestamp. Tool ini cocok dipakai di pekerjaan network support.

### Day 27 — Unit Testing with xUnit
- **Belajar:** `dotnet new xunit`, `[Fact]`, `[Theory]` + `[InlineData]`, pola Arrange-Act-Assert, file solution (`.slnx` di .NET 10), `dotnet test`.
- **Praktik:** test untuk `HitungSubnet` dan aturan status `Ticket`.
- **TODO kamu:** tulis minimal 5 test sendiri, termasuk test untuk kasus error.

### Day 28 — Git and GitHub in Depth
- **Belajar:** branch, merge, pull request ke repo sendiri, `git log --oneline --graph`, `git restore`, membaca hasil CI GitHub Actions.
- **Praktik:** buat branch `feature/day-28`, buka PR lewat `gh pr create`, lalu merge.
- **TODO kamu:** jelaskan di jurnal dengan kata-katamu sendiri: apa itu commit, branch, dan PR.

### Day 29 — Phase 1 Project: Helpdesk Console (Part 1)
- **Belajar:** merancang program sebelum ngoding (daftar fitur, class, alur).
- **Praktik:** project `HelpdeskConsole` berisi Ticket, kategori, prioritas, status, dan penyimpanan JSON.
- **TODO kamu:** tulis logika perubahan status beserta validasinya.

### Day 30 — Phase 1 Project: Helpdesk Console (Part 2) and Review
- **Belajar:** review seluruh fase 1.
- **Praktik:** laporan LINQ, unit test, dan README project.
- **TODO kamu:** jawab 15 soal kuis tanpa melihat kode. Opsional: ikuti sertifikasi gratis *Foundational C# with Microsoft* (freeCodeCamp).

---

## Fase 2 — ASP.NET Core Web API + EF Core + SQL Server (Day 31–60)

Proyek fase 2: **AssetTracker API**, mini sistem inventaris aset IT. Folder: `phase-2-webapi/`. Satu solution yang berkembang setiap hari.

### Minggu 5 — Dasar Web API

### Day 31 — HTTP, REST and First Web API
- **Belajar:** HTTP method, status code, JSON, REST; `dotnet new webapi --use-controllers`; isi `Program.cs`; OpenAPI.
- **Praktik:** buat solution `AssetTracker` dan project `AssetTracker.Api`, lalu coba endpoint lewat file `.http` di VS Code.
- **TODO kamu:** tambahkan endpoint `GET /api/ping` yang mengembalikan `{ "status": "ok", "time": ... }`.

### Day 32 — Controllers and Routing
- **Belajar:** `[ApiController]`, `[Route]`, `[HttpGet("{id}")]`, `ActionResult<T>`, route parameter, query string.
- **Praktik:** `AssetsController` dengan data list di memori.
- **TODO kamu:** tambahkan `GET /api/assets?location=Makassar` (filter berdasarkan query string).

### Day 33 — CRUD In-Memory
- **Belajar:** POST, PUT, DELETE; status code 201 + `CreatedAtAction`, 204, 404; model binding.
- **Praktik:** CRUD lengkap untuk aset.
- **TODO kamu:** tulis endpoint PUT, termasuk respons 404 kalau aset tidak ditemukan.

### Day 34 — DTOs and Validation
- **Belajar:** alasan DTO dipisah dari entity, `record` sebagai DTO, DataAnnotations (`[Required]`, `[StringLength]`, `[Range]`), respons 400 otomatis.
- **Praktik:** `CreateAssetRequest`, `UpdateAssetRequest`, `AssetResponse`.
- **TODO kamu:** validasi format IP address dengan custom validation attribute.

### Day 35 — Dependency Injection
- **Belajar:** DI container, lifetime (Singleton, Scoped, Transient), constructor injection.
- **Praktik:** pindahkan logika ke `IAssetService` / `AssetService`.
- **TODO kamu:** jelaskan di jurnal apa yang terjadi kalau service yang menyimpan data didaftarkan sebagai Transient. Buktikan dengan percobaan.

### Day 36 — Configuration, Logging and Options
- **Belajar:** `appsettings.json`, environment (Development/Production), `ILogger<T>`, Options pattern (`IOptions<T>`).
- **Praktik:** pengaturan `AssetSettings` (contoh: `MaxAgeYears`) dibaca dari konfigurasi.
- **TODO kamu:** tambahkan log informasi setiap kali aset dibuat atau dihapus.

### Day 37 — Checkpoint 4: Error Handling and API Testing
- **Belajar:** `ProblemDetails`, global exception handler (`IExceptionHandler`), koleksi request di file `.http`.
- **Praktik:** penanganan error global dan koleksi `.http` untuk semua endpoint.
- **TODO kamu:** uji semua endpoint, termasuk 3 skenario error, lalu tulis refleksi minggu 5.

### Minggu 6 — Database

### Day 38 — SQL Basics
- **Belajar:** install SQL Server Express (atau LocalDB) + SSMS, atau ekstensi SQL Server di VS Code; `CREATE TABLE`, `INSERT`, `SELECT`, `WHERE`, `ORDER BY`.
- **Praktik:** tabel `Assets` dan `Locations` dibuat manual lewat SQL.
- **TODO kamu:** tulis 5 query SELECT sendiri dan simpan di `phase-2-webapi/sql/day-38.sql`.

### Day 39 — SQL Joins and Aggregates
- **Belajar:** primary key, foreign key, `JOIN`, `GROUP BY`, `HAVING`, `COUNT` / `SUM`, index, normalisasi dasar.
- **Praktik:** query laporan aset per lokasi.
- **TODO kamu:** tulis query "lokasi dengan lebih dari 5 aset yang berumur di atas 3 tahun".

### Day 40 — EF Core Introduction
- **Belajar:** ORM, `DbContext`, `DbSet`, connection string, package `Microsoft.EntityFrameworkCore.SqlServer`, tool `dotnet-ef`, migration pertama.
- **Praktik:** `AppDbContext`, entity `Asset`, `dotnet ef migrations add InitialCreate`, `dotnet ef database update`.
- **TODO kamu:** simpan connection string memakai `dotnet user-secrets`, bukan di file yang ikut di-commit.

### Day 41 — EF Core CRUD
- **Belajar:** query async (`ToListAsync`, `FindAsync`), `AsNoTracking`, `SaveChangesAsync`, change tracking.
- **Praktik:** ganti list di memori dengan database.
- **TODO kamu:** ubah method update dan delete di `AssetService` supaya memakai EF Core.

### Day 42 — Relationships
- **Belajar:** relasi one-to-many, navigation property, `Include`, foreign key.
- **Praktik:** `Location` 1–N `Asset` dan `Category` 1–N `Asset`.
- **TODO kamu:** buat endpoint `GET /api/locations/{id}/assets`.

### Day 43 — Migrations and Fluent API
- **Belajar:** konfigurasi Fluent API (`IEntityTypeConfiguration<T>`), seed data, menambah kolom lewat migration, rollback.
- **Praktik:** pindahkan konfigurasi entity ke class configuration terpisah dan tambahkan seed data.
- **TODO kamu:** tambahkan kolom `SerialNumber` (unik) dengan migration baru.

### Day 44 — Checkpoint 5: Search, Filter, Paging, Sorting
- **Belajar:** `IQueryable`, query dinamis, paging (`Skip` / `Take`), respons terpaginasi.
- **Praktik:** `GET /api/assets?search=&location=&page=&pageSize=&sortBy=`.
- **TODO kamu:** batasi `pageSize` maksimal 50, lalu tulis refleksi minggu 6.

### Minggu 7 — Arsitektur dan Keamanan

### Day 45 — Layered Architecture
- **Belajar:** pemisahan Api, Application, Domain, Infrastructure; referensi antar project.
- **Praktik:** pecah solution menjadi beberapa project.
- **TODO kamu:** gambar diagram sederhana di jurnal (boleh ASCII atau Mermaid) yang menunjukkan arah dependency.

### Day 46 — Service Layer and Mapping
- **Belajar:** mapping manual entity ↔ DTO (extension method), alasan menghindari library mapping berbayar.
- **Praktik:** extension method `ToResponse()` dan `ToEntity()`.
- **TODO kamu:** tulis mapping untuk `Location` dan `Category`.

### Day 47 — Logging with Serilog and Global Errors
- **Belajar:** structured logging, Serilog (console + file), correlation/request logging.
- **Praktik:** pasang Serilog dan log request.
- **TODO kamu:** pastikan error 500 tercatat lengkap di file log, tapi detail error tidak bocor ke respons API.

### Day 48 — Authentication with JWT
- **Belajar:** authentication vs authorization, JWT (header, payload, signature), `Microsoft.AspNetCore.Authentication.JwtBearer`, hashing password.
- **Praktik:** endpoint register dan login yang menghasilkan JWT.
- **TODO kamu:** atur masa berlaku token 60 menit dan uji dengan token yang sudah kedaluwarsa.

### Day 49 — Authorization with Roles and Policies
- **Belajar:** `[Authorize]`, role (Admin, Technician, Viewer), policy-based authorization.
- **Praktik:** lindungi endpoint aset: Viewer hanya bisa baca, Technician bisa mengubah, Admin bisa menghapus.
- **TODO kamu:** buat policy `CanDeleteAsset` dan terapkan.

### Day 50 — Unit Testing Services
- **Belajar:** test untuk service layer, fake vs mock (NSubstitute), pola test yang mudah dibaca.
- **Praktik:** project `AssetTracker.Tests`.
- **TODO kamu:** tulis 8 test untuk `AssetService`, termasuk kasus gagal.

### Day 51 — Integration Testing
- **Belajar:** `WebApplicationFactory`, database untuk test (SQLite in-memory atau Testcontainers), menguji endpoint dari luar.
- **Praktik:** test `GET /api/assets` dan `POST /api/assets` beserta autentikasinya.
- **TODO kamu:** tulis test bahwa user Viewer mendapat 403 saat mencoba menghapus aset.

### Minggu 8 — Siap Produksi

### Day 52 — Export CSV Report
- **Belajar:** mengembalikan file dari API (`File()`), stream, header `Content-Disposition`.
- **Praktik:** endpoint `GET /api/reports/assets.csv`.
- **TODO kamu:** tambahkan filter lokasi dan tanggal di endpoint export.

### Day 53 — Caching and Performance
- **Belajar:** `IMemoryCache`, output caching, query N+1, `AsNoTracking`, projection dengan `Select`.
- **Praktik:** cache daftar lokasi selama 5 menit.
- **TODO kamu:** ukur waktu respons sebelum dan sesudah memakai cache, lalu catat hasilnya.

### Day 54 — Docker
- **Belajar:** image, container, Dockerfile multi-stage, `docker compose` (API + SQL Server).
- **Praktik:** Dockerfile untuk API dan `compose.yaml`.
- **TODO kamu:** jalankan seluruh stack dengan `docker compose up` dan pastikan migration berjalan.

### Day 55 — CI with GitHub Actions
- **Belajar:** workflow YAML, job, step, `dotnet test` di CI, badge status.
- **Praktik:** workflow build + test khusus untuk AssetTracker.
- **TODO kamu:** buat test gagal dengan sengaja, lihat CI berubah merah, lalu perbaiki.

### Day 56 — Deploy to the Cloud
- **Belajar:** konsep deploy, environment variable, connection string di produksi, layanan gratis atau murah (misalnya Azure App Service free tier, atau hosting berbasis Docker).
- **Praktik:** deploy API dan database.
- **TODO kamu:** catat langkah deploy di `phase-2-webapi/DEPLOY.md` supaya bisa diulang.

### Day 57 — Health Checks and Rate Limiting
- **Belajar:** `AddHealthChecks` + `/health`, rate limiter bawaan ASP.NET Core, CORS.
- **Praktik:** health check untuk database dan rate limit untuk endpoint login.
- **TODO kamu:** uji rate limit dengan mengirim banyak request lewat file `.http` atau script.

### Day 58 — API Documentation
- **Belajar:** OpenAPI, Scalar UI, README API yang baik, contoh request dan response.
- **Praktik:** README `phase-2-webapi/README.md` berisi cara menjalankan, endpoint, dan screenshot.
- **TODO kamu:** tulis bagian "Apa yang saya pelajari dari proyek ini" dengan kata-katamu sendiri.

### Day 59 — Code Review and Refactor
- **Belajar:** code smell, penamaan, method yang terlalu panjang, prinsip SOLID secara ringan.
- **Praktik:** code review menyeluruh dan daftar perbaikan.
- **TODO kamu:** kerjakan minimal 3 perbaikan dari daftar review sendiri.

### Day 60 — Phase 2 Review and Release v0.2
- **Belajar:** review fase 2.
- **Praktik:** buat tag `v0.2` dan GitHub Release lewat `gh release create`.
- **TODO kamu:** jawab 20 soal kuis tentang API, EF Core, dan auth, lalu tulis refleksi fase 2.

---

## Fase 3 — Proyek Akhir: HelpdeskLite (Day 61–90)

Aplikasi ticketing helpdesk full-stack (mirip versi mini MySSC) dengan ASP.NET Core API + Blazor + SQL Server. Folder: `phase-3-capstone/HelpdeskLite/`. Ini proyek utama untuk CV.

### Minggu 9 — Perencanaan dan Inti

### Day 61 — Requirements and Design
- **Belajar:** user story, ERD, alur status tiket, GitHub Issues dan Projects.
- **Praktik:** dokumen `phase-3-capstone/DESIGN.md` (fitur, ERD dalam Mermaid, alur status) dan issue untuk setiap fitur.
- **TODO kamu:** tulis 10 user story sendiri, misalnya "Sebagai teknisi, saya ingin ...".

### Day 62 — Solution Scaffold
- **Belajar:** struktur solution multi-project, `Directory.Build.props`, referensi project.
- **Praktik:** HelpdeskLite.Api, .Application, .Domain, .Infrastructure, .Tests.
- **TODO kamu:** pastikan `dotnet build` dan `dotnet test` berhasil, lalu jelaskan fungsi setiap project di README.

### Day 63 — Domain Model and Ticket Workflow
- **Belajar:** rich domain model, aturan bisnis di dalam entity.
- **Praktik:** entity `Ticket` (Open → InProgress → Resolved → Closed), prioritas P1–P4, `Category`.
- **TODO kamu:** tulis aturan transisi status beserta unit test-nya.

### Day 64 — Database and Migrations
- **Belajar:** konfigurasi EF Core untuk domain, seed data kategori.
- **Praktik:** `HelpdeskDbContext`, migration awal, seed.
- **TODO kamu:** tambahkan index untuk kolom yang sering dicari (Status, Priority).

### Day 65 — Ticket CRUD Endpoints
- **Belajar:** endpoint yang memanggil domain, validasi request.
- **Praktik:** create, get, list, update tiket.
- **TODO kamu:** tulis endpoint `PATCH /api/tickets/{id}/status` yang memakai aturan domain.

### Day 66 — Comments and Activity Log
- **Belajar:** relasi one-to-many, audit field (`CreatedAt`, `CreatedBy`), interceptor EF Core.
- **Praktik:** komentar pada tiket dan log aktivitas otomatis.
- **TODO kamu:** isi `CreatedAt` / `UpdatedAt` otomatis lewat `SaveChanges` interceptor.

### Day 67 — Checkpoint 6: Core Tests
- **Belajar:** coverage yang bermakna (bukan sekadar persentase).
- **Praktik:** lengkapi unit test dan integration test inti.
- **TODO kamu:** tambahkan 5 test untuk kasus tepi (edge case), lalu tulis refleksi minggu 9.

### Minggu 10 — Fitur

### Day 68 — Auth and Roles
- **Belajar:** menerapkan ulang JWT dan role dari fase 2 (Requester, Technician, Admin).
- **Praktik:** register, login, dan seed akun demo.
- **TODO kamu:** pastikan Requester hanya bisa melihat tiketnya sendiri.

### Day 69 — Ticket Assignment
- **Belajar:** resource-based authorization.
- **Praktik:** assign tiket ke teknisi dan endpoint `GET /api/tickets/mine`.
- **TODO kamu:** pastikan hanya Admin yang bisa assign, dan teknisi hanya bisa mengubah tiket yang di-assign ke dia.

### Day 70 — SLA and Background Service
- **Belajar:** `BackgroundService`, `PeriodicTimer`, `TimeProvider` (agar mudah di-test).
- **Praktik:** tenggat SLA dihitung dari prioritas, lalu service berkala menandai tiket yang terlambat.
- **TODO kamu:** tulis test untuk logika SLA memakai `FakeTimeProvider`.

### Day 71 — Search, Filter and Paging
- **Belajar:** menerapkan ulang pola dari Day 44.
- **Praktik:** filter berdasarkan status, prioritas, kategori, teknisi, dan kata kunci.
- **TODO kamu:** tambahkan sorting berdasarkan tenggat SLA.

### Day 72 — Dashboard Statistics
- **Belajar:** agregasi LINQ ke SQL, projection ke DTO.
- **Praktik:** `GET /api/dashboard` berisi jumlah per status, prioritas, dan kategori.
- **TODO kamu:** hitung rata-rata waktu penyelesaian dan jumlah tiket yang melewati SLA.

### Day 73 — Notifications
- **Belajar:** abstraksi `INotificationService`, SMTP (MailKit) atau versi log-only.
- **Praktik:** notifikasi saat tiket dibuat atau di-assign.
- **TODO kamu:** buat template pesan notifikasi yang rapi.

### Day 74 — Checkpoint 7: Integration Tests
- **Belajar:** menguji alur lengkap.
- **Praktik:** integration test alur: buat tiket → assign → resolve → close.
- **TODO kamu:** perbaiki semua test yang gagal, lalu tulis refleksi minggu 10.

### Minggu 11 — Frontend Blazor

### Day 75 — Blazor Introduction
- **Belajar:** Blazor Web App, component, parameter, routing, render mode.
- **Praktik:** project `HelpdeskLite.Web` dan layout dasar.
- **TODO kamu:** buat component `PriorityBadge` dengan warna berbeda untuk P1–P4.

### Day 76 — Ticket List Page
- **Belajar:** memanggil API dari Blazor (`HttpClient` typed client), state loading dan error.
- **Praktik:** halaman daftar tiket.
- **TODO kamu:** tambahkan filter status di halaman tersebut.

### Day 77 — Create and Edit Forms
- **Belajar:** `EditForm`, `DataAnnotationsValidator`, binding.
- **Praktik:** form buat tiket dan edit tiket.
- **TODO kamu:** tampilkan pesan validasi yang ramah pengguna dalam Bahasa Indonesia.

### Day 78 — Login and Auth State in Blazor
- **Belajar:** `AuthenticationStateProvider`, menyimpan token, `AuthorizeView`.
- **Praktik:** halaman login dan menu yang berbeda sesuai role.
- **TODO kamu:** sembunyikan tombol yang tidak boleh diakses role tertentu.

### Day 79 — Dashboard Page
- **Belajar:** menampilkan data statistik di UI.
- **Praktik:** halaman dashboard berisi kartu angka dan tabel.
- **TODO kamu:** tambahkan grafik sederhana (bar chart memakai CSS saja sudah cukup).

### Day 80 — UI Polish
- **Belajar:** konsistensi tampilan, responsif di layar HP, aksesibilitas dasar.
- **Praktik:** rapikan layout, navigasi, dan halaman kosong atau error.
- **TODO kamu:** uji tampilan di layar HP (DevTools) dan perbaiki 3 masalah.

### Day 81 — Checkpoint 8: End-to-End Manual Testing
- **Belajar:** checklist pengujian manual, menulis bug report.
- **Praktik:** jalankan seluruh skenario sebagai Requester, Technician, dan Admin.
- **TODO kamu:** catat bug sebagai GitHub Issue lalu perbaiki minimal 2, kemudian tulis refleksi minggu 11.

### Minggu 12 — Rilis

### Day 82 — Attachments
- **Belajar:** upload file, validasi ukuran dan tipe file, penyimpanan lokal.
- **Praktik:** lampiran screenshot pada tiket.
- **TODO kamu:** tolak file di atas 5 MB dan tipe file yang tidak diizinkan.

### Day 83 — Logging and Health Checks
- **Belajar:** menerapkan ulang Serilog dan health check dari fase 2.
- **Praktik:** log terstruktur dan `/health`.
- **TODO kamu:** pastikan setiap log menyertakan ID tiket kalau relevan.

### Day 84 — Docker Compose Full Stack
- **Belajar:** compose multi-service (api, web, db), network, volume.
- **Praktik:** `compose.yaml` untuk seluruh aplikasi.
- **TODO kamu:** dokumentasikan cara menjalankan aplikasi dengan satu perintah.

### Day 85 — CI/CD Pipeline
- **Belajar:** pipeline build, test, dan (opsional) deploy otomatis.
- **Praktik:** workflow khusus HelpdeskLite.
- **TODO kamu:** tambahkan badge CI di README HelpdeskLite.

### Day 86 — Deploy and Demo Data
- **Belajar:** deploy aplikasi full-stack, data demo, akun demo.
- **Praktik:** deploy dan seed data contoh yang realistis.
- **TODO kamu:** uji aplikasi yang sudah online dari HP.

### Day 87 — Security Review
- **Belajar:** OWASP Top 10 dasar: SQL injection (aman dengan EF Core), XSS, secret di repo, CORS, HTTPS.
- **Praktik:** checklist keamanan dan audit project.
- **TODO kamu:** pastikan tidak ada secret di riwayat git (`git log -p` + cari kata "password").

### Day 88 — Documentation and Screenshots
- **Belajar:** README portofolio yang menjual.
- **Praktik:** README berisi screenshot, diagram arsitektur, fitur, tech stack, dan cara menjalankan.
- **TODO kamu:** rekam GIF atau video demo 1–2 menit.

### Day 89 — CV, LinkedIn and GitHub Profile
- **Belajar:** cara menampilkan proyek di CV dan profil GitHub.
- **Praktik:** README profil GitHub (`username/username`), pin repo, dan poin CV untuk HelpdeskLite dan AssetTracker.
- **TODO kamu:** tulis 3 poin pencapaian proyek dengan format "melakukan X memakai Y, hasilnya Z".

### Day 90 — Retrospective and Release v1.0
- **Belajar:** refleksi 90 hari dan rencana belajar berikutnya.
- **Praktik:** tag `v1.0`, GitHub Release, dan update README utama.
- **TODO kamu:** tulis `RETROSPECTIVE.md`: apa yang berhasil, apa yang sulit, dan target 90 hari berikutnya.

---

## Riwayat Perubahan Roadmap

Setiap perubahan roadmap dicatat di sini.

| Tanggal | Diubah oleh | Perubahan |
|---|---|---|
| 2026-10-24 | - | Versi awal roadmap 90 hari |
| 2026-10-25 | - | Merapikan bahasa dan panduan tanpa mengubah urutan materi 90 hari |
