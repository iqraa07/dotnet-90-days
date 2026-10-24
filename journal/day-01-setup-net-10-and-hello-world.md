# Day 01 — Setup .NET 10 and Hello World

- **Tanggal mulai:** 2026-10-24
- **Fase:** 1 (C# Fundamentals)
- **Mode:** PAIR
- **Kode:** [`phase-1-csharp/day-01-setup-net-10-and-hello-world`](../phase-1-csharp/day-01-setup-net-10-and-hello-world)
- **Durasi belajar:** _ jam

## Target hari ini

- Mengenal SDK, runtime, `Program.cs`, file `.csproj`, dan top-level statements.
- Membuat project dengan `.\day new 1`, lalu menggunakan `dotnet build` dan `dotnet run`.
- Melengkapi tiga baris output: nama, tanggal saat dijalankan melalui `DateTime.Now`, dan versi runtime melalui `Environment.Version`.

## Yang dikerjakan

- [x] Memasang .NET SDK 10.0.402 dengan izin user dan mengatur identitas Git.
- [x] Menghubungkan satu repo public `iqraa07/dotnet-90-days`, memasang workflow CI, dan melakukan push setup.
- [x] Membuat project console `net10.0` melalui `.\day new 1`; Nullable dan ImplicitUsings aktif.
- [x] Menyiapkan tiga TODO dengan petunjuk dan nilai sementara, serta README berisi perintah run dan kriteria pemeriksaan.
- [x] Build lulus dengan 0 warning dan 0 error; run berhasil menampilkan tiga nilai sementara. Project memakai `UseAppHost=false` agar dijalankan melalui runtime .NET.
- [ ] User mengerjakan TODO nama, tanggal, dan versi runtime di `Program.cs`.
- [ ] User mengisi bagian "Yang saya pahami", lalu meminta review.

## Yang saya pahami (WAJIB ditulis sendiri, 3–5 poin)

<!-- Tulis dengan kata-katamu sendiri. AI tidak boleh mengisi bagian ini. -->
- 

## Kendala & solusi

| Masalah | Penyebab | Solusi |
|---|---|---|
| `dotnet` belum dikenali setelah instalasi | Proses Codex yang masih terbuka memakai PATH sebelum instalasi | Menambahkan lokasi SDK hanya ke PATH proses kerja; tutup dan buka ulang Codex untuk terminal berikutnya |
| Push pertama ditolak pada file workflow | Scope `workflow` belum tersedia pada sesi `gh` | User menyelesaikan `gh auth refresh` sendiri; pengecekan scope dan push ulang berhasil |
| `dotnet run` memblokir executable apphost | Windows Application Control menolak file `.exe` hasil build | Menggunakan opsi resmi `UseAppHost=false` agar program dijalankan melalui runtime .NET |

## Masih bingung / pertanyaan

- 

## Rencana besok

- Setelah Day 01 tuntas, lanjut Day 02: Variables and Data Types sesuai ROADMAP.
