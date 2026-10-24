# Day 01 — Setup .NET 10 and Hello World

- **Tanggal mulai:** 2026-10-24
- **Update:** 2026-10-25
- **Fase:** 1, C# Fundamentals
- **Kode:** [Project console](../phase-1-csharp/day-01-setup-net-10-and-hello-world)
- **Status:** kode terverifikasi, refleksi pribadi menunggu

## Target hari ini

Mengenal SDK, runtime, `Program.cs`, file `.csproj`, serta perintah `dotnet new`, `dotnet build`, dan `dotnet run`. Latihan menampilkan tiga baris: nama, waktu komputer, dan versi runtime.

## Yang dikerjakan

- [x] Memasang .NET SDK 10.0.402, mengatur identitas Git, dan menghubungkan repo `iqraa07/dotnet-90-days`.
- [x] Membuat project console `net10.0`, dengan Nullable dan ImplicitUsings aktif.
- [x] Mengganti seluruh nilai sementara dengan nama, `DateTime.Now`, dan `Environment.Version`.
- [x] Menjalankan build Release: 0 warning, 0 error.
- [x] Menjalankan aplikasi: exit code 0, dengan tiga baris output sesuai target.
- [x] Menyiapkan README latihan dan katalog Day 01-90; hari berikutnya tetap berstatus rencana.
- [x] Mengekspor gambar kode dan output aktual dalam ukuran 1600 x 900 serta 1080 x 1350, disertai sumber teks hasil eksekusi.
- [ ] Melengkapi refleksi pribadi setelah mencoba program.

## Yang saya pahami (WAJIB ditulis sendiri, 3–5 poin)

<!-- Tulis catatan pribadi dengan kata-kata sendiri setelah mencoba program. -->
- 

## Catatan materi

`Console.WriteLine` menulis satu baris ke terminal. `DateTime.Now` membaca waktu lokal komputer ketika program berjalan. `Environment.Version` menunjukkan runtime yang menjalankan aplikasi; versi ini berbeda dari SDK yang dipakai untuk membangun project.

## Cek pemahaman

1. Apa yang dilakukan `Console.WriteLine` pada program ini?
2. Mengapa hasil baris tanggal bisa berubah ketika program dijalankan lagi?
3. Mengapa `dotnet --version` dan `Environment.Version` menampilkan nomor berbeda?

## Kendala & solusi

| Masalah | Penyebab | Solusi |
|---|---|---|
| `dotnet` belum dikenali setelah instalasi | Terminal lama belum memuat PATH baru | Memuat lokasi SDK pada proses kerja; buka ulang terminal untuk sesi berikutnya |
| Push file workflow ditolak | Scope `workflow` belum tersedia | Menyelesaikan otorisasi akun, lalu memeriksa scope dan mengulang push |
| Executable apphost diblokir | Windows Application Control menolak `.exe` hasil build | Memakai `UseAppHost=false` dan menjalankan aplikasi melalui runtime .NET |

## Rencana berikutnya

Lengkapi refleksi pribadi, lalu selesaikan Day 01 melalui helper. Setelah itu lanjut Day 02: Variables and Data Types.
