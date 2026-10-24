# Mulai di Sini

Panduan awal program belajar .NET milik Muhammad Iqra Nur Fajar. Seluruh 90 hari, kode, dan jurnal disimpan dalam satu repo: `iqraa07/dotnet-90-days`.

## 1. Periksa lingkungan

Buka PowerShell di folder repo, lalu jalankan:

```powershell
git --version
dotnet --version
gh --version
```

Repo ini memakai .NET SDK `10.0.x`. Pasang hanya perangkat yang belum tersedia, setelah mendapat persetujuan pemilik komputer:

```powershell
winget install --id Git.Git -e
winget install --id Microsoft.DotNet.SDK.10 -e
winget install --id GitHub.cli -e
```

Setelah instalasi, tutup lalu buka kembali terminal dan aplikasi yang menjalankannya agar PATH diperbarui. Panduan lengkap ada di [setup Windows](docs/01-SETUP-WINDOWS.md).

## 2. Periksa identitas dan login

```powershell
git config --global user.name
git config --global user.email
gh auth status
```

Nama pemilik repo adalah Muhammad Iqra Nur Fajar. Email commit menggunakan email terverifikasi di akun GitHub atau alamat noreply dari Settings → Emails. Lihat [petunjuk email commit GitHub](https://docs.github.com/en/account-and-profile/how-tos/email-preferences/setting-your-commit-email-address).

Jika akun sudah aktif, lewati login. Jika belum, jalankan `gh auth login` sendiri dan selesaikan otorisasi melalui browser. Jangan membagikan password atau token.

## 3. Setup repo sekali saja

Periksa kondisi repo sebelum menjalankan setup:

```powershell
git status
git remote -v
```

Untuk folder awal yang belum diinisialisasi dan belum memiliki repo GitHub:

```powershell
.\day init
.\day publish
```

Perintah publish membuat repo public `dotnet-90-days`. Jika repo dan remote `origin` sudah tersedia, gunakan `.\day push` untuk mengirim perubahan berikutnya. Semua fase tetap berada dalam repo yang sama.

## 4. Mulai belajar

```powershell
.\day status
```

Lanjutkan hari yang sedang dikerjakan, atau mulai hari pertama yang belum dimulai. Contoh untuk Day 01:

```powershell
.\day new 1
```

Baca target di [roadmap](ROADMAP.md), jalankan kode sesuai README latihan, lalu isi jurnal dengan kata-kata sendiri. Hari baru ditandai selesai setelah latihan, pemeriksaan, dan refleksi tuntas.

| Dokumen | Kegunaan |
|---|---|
| [Roadmap](ROADMAP.md) | Target dan latihan Day 01 sampai Day 90 |
| [Alur harian](docs/02-WORKFLOW-HARIAN.md) | Urutan belajar, verifikasi, commit, dan push |
| [Checklist sesi](docs/03-PROMPTS.md) | Pemeriksaan setup, review, dan penutupan sesi |
| [Cheatsheet](docs/04-CHEATSHEET.md) | Perintah singkat dan penanganan error |
| [Jurnal](journal/) | Pekerjaan, kendala, dan refleksi setiap hari |

Buat commit bermakna untuk pekerjaan belajar hari itu. Jaga progres README, jurnal, dan petunjuk menjalankan kode sesuai hasil yang sudah diperiksa.
