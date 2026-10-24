# Day 01: Setup .NET 10 and Hello World

Latihan console pertama untuk mengenal `Program.cs`, file `.csproj`, dan perintah dasar .NET. Status: sedang dikerjakan dalam mode PAIR.

## Jalankan

Gunakan .NET SDK 10.0.x. Dari root repo `dotnet-90-days`, jalankan:

```powershell
dotnet build .\phase-1-csharp\day-01-setup-net-10-and-hello-world
dotnet run --project .\phase-1-csharp\day-01-setup-net-10-and-hello-world
```

Kode awal menampilkan tiga penanda yang belum diisi. Build dan run tetap berhasil sebelum TODO selesai.

Project memakai [`UseAppHost=false`](https://learn.microsoft.com/en-us/dotnet/core/project-sdk/msbuild-props#useapphost), sehingga `dotnet run` menjalankan DLL melalui runtime .NET. Pengaturan ini dipakai karena Windows Application Control pada komputer belajar memblokir executable apphost yang dihasilkan build.

## Kerjakan

Ubah tiga baris di [Program.cs](Program.cs) yang ditandai `TODO(kamu)`:

1. Tampilkan namamu pada baris pertama menggunakan `Console.WriteLine`.
2. Tampilkan tanggal dan waktu lokal saat program berjalan. Gunakan `DateTime.Now` agar nilainya mengikuti waktu komputer.
3. Tampilkan versi runtime .NET yang aktif. Gunakan `Environment.Version`; versi ini berbeda dari SDK yang ditampilkan oleh `dotnet --version`.

Tidak ada input keyboard pada latihan ini. Contoh hasil setelah TODO selesai:

```text
Muhammad Iqra Nur Fajar
24/10/2026 23:45:00
10.0.x
```

Tanggal di atas hanya contoh. Format tanggal mengikuti komputer; `x` mewakili nomor patch runtime, bukan huruf yang harus dicetak.

## Periksa hasilnya

- `dotnet build` selesai tanpa error atau warning.
- Program mencetak tepat tiga baris dan tidak menampilkan penanda `[... belum diisi]`.
- Baris pertama berisi namamu. Baris kedua berasal dari waktu komputer saat dijalankan. Baris ketiga berisi versi runtime `10.0.x` yang terpasang.
- Isi 3-5 poin dengan kata-katamu sendiri pada bagian **Yang saya pahami** di [jurnal Day 01](../../journal/day-01-setup-net-10-and-hello-world.md).

Setelah selesai, minta review TODO. Day 01 tetap berstatus sedang dikerjakan sampai kode dan jurnal selesai diperiksa.

## Bacaan

- [SDK dan runtime .NET](https://learn.microsoft.com/en-us/dotnet/core/sdk)
- [Top-level statements di C#](https://learn.microsoft.com/en-us/dotnet/csharp/fundamentals/program-structure/top-level-statements)
- [Perintah dotnet run](https://learn.microsoft.com/en-us/dotnet/core/tools/dotnet-run)
