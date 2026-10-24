# 01 — Setup di Windows (lengkap)

Panduan ini cukup diikuti **sekali**. Semua perintah dijalankan di **PowerShell** biasa (tidak perlu Run as Administrator, kecuali winget memintanya).

Day 01 sampai Day 90 dan semua fase tetap berada di repo **`dotnet-90-days`** yang sama. Jalankan helper dari folder repo ini.

---

## A. Install tools

Cek bagian Verifikasi terlebih dahulu dan pasang hanya tools yang belum tersedia. AI harus meminta izin kamu sebelum menjalankan instalasi melalui winget.

```powershell
winget install --id Git.Git -e                    # Git
winget install --id Microsoft.DotNet.SDK.10 -e    # .NET 10 SDK (LTS)
winget install --id GitHub.cli -e                 # GitHub CLI (gh)
winget install --id Microsoft.VisualStudioCode -e # VS Code (lewati kalau sudah ada)
```

Setelah selesai, **tutup semua jendela PowerShell lalu buka lagi** supaya PATH ter-update.

Kalau instalasi dijalankan lewat Codex dan perintah masih tidak dikenali, **tutup lalu buka ulang aplikasi Codex** sebelum mencoba lagi.

Pasang ekstensi C# untuk VS Code:

```powershell
code --install-extension ms-dotnettools.csdevkit
```

### Codex
Folder `.codex` sudah ada di laptop kamu, jadi kemungkinan besar Codex sudah terpasang. Cek dengan:

```powershell
codex --version
```

Kalau belum ada: `winget install OpenAI.Codex` (atau `npm install -g @openai/codex`). Setelah itu jalankan `codex` sekali lalu login dengan akun ChatGPT kamu.

### Verifikasi

```powershell
git --version
dotnet --version     # harus 10.0.xxx
gh --version
codex --version
```

---

## B. Identitas Git (wajib benar supaya kotak hijau muncul)

```powershell
git config --global user.name "Muhammad Iqra Nur Fajar"
git config --global user.email "EMAIL-TERVERIFIKASI-ATAU-NOREPLY-GITHUB"
git config --global init.defaultBranch main
git config --global core.autocrlf true
```

Gunakan **email yang terverifikasi di akun GitHub atau alamat noreply dari GitHub** agar commit terhubung ke akunmu. Lihat [petunjuk email commit GitHub](https://docs.github.com/en/account-and-profile/how-tos/email-preferences/setting-your-commit-email-address).

Kalau ingin email asli tidak terlihat publik, ambil alamat *noreply* dari Settings → Emails → "Keep my email addresses private". Salah satu formatnya `ID+username@users.noreply.github.com`; salin alamat tepat milik akunmu. Rincian format ada di [referensi alamat email GitHub](https://docs.github.com/en/account-and-profile/reference/email-addresses-reference).

---

## C. Login GitHub (kamu sendiri, sekali saja)

Belum punya akun? Daftar dulu di https://github.com/signup.

Cek status login terlebih dahulu:

```powershell
gh auth status
```

Kalau akun GitHub sudah aktif, lewati login dan lanjut ke bagian D. Kalau belum login, jalankan sendiri:

```powershell
gh auth login
```

Jawab pertanyaannya seperti ini:

| Pertanyaan | Pilih |
|---|---|
| Where do you use GitHub? | **GitHub.com** |
| Preferred protocol for Git operations? | **HTTPS** |
| Authenticate Git with your GitHub credentials? | **Yes** |
| How would you like to authenticate? | **Login with a web browser** |

Salin kode 8 karakter yang muncul, tekan Enter, lalu browser akan terbuka. Tempel kodenya dan klik **Authorize**.

Cek hasilnya:

```powershell
gh auth status     # harus muncul: Logged in to github.com account <username>
```

Kalau belum login, AI harus berhenti dan meminta kamu menjalankan `gh auth login` sendiri.

> 🔒 **Keamanan:** setelah login lewat `gh`, Git, Codex, dan Claude bisa melakukan push memakai kredensial yang tersimpan di Windows Credential Manager. **Jangan pernah** menempelkan password atau token GitHub ke chat AI.

### Push workflow ditolak

Kalau push `.github/workflows/build.yml` ditolak dengan pesan `without workflow scope`, izin GitHub CLI perlu ditambah. Jalankan perintah ini sendiri, lalu selesaikan otorisasi di browser:

```powershell
gh auth refresh -h github.com -s workflow
```

Setelah selesai, kembali ke folder repo dan jalankan:

```powershell
gh auth status
.\day push
```

Jika `.\day publish` sudah membuat repo, lanjutkan memakai repo dan remote `origin` yang sama. Pertahankan file workflow; tidak perlu membuat repo baru. AI menunggu kamu menyelesaikan otorisasi sendiri. Rujukan: [menambah izin GitHub CLI](https://cli.github.com/manual/gh_auth_refresh).

---

## D. Izinkan script PowerShell (sekali)

```powershell
Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
```

Langkah ini opsional, karena `day.cmd` sudah otomatis menjalankan script dengan `-ExecutionPolicy Bypass`. Tapi dengan pengaturan ini, `.\scripts\day.ps1` juga bisa dipanggil langsung.

---

## E. Setup Codex untuk repo ini

```powershell
cd "$HOME\Documents\dotnet-90-days"
codex
```

1. **Trust folder → Yes.** Codex hanya membaca `AGENTS.md` dari folder yang dipercaya.
2. Kirim **PROMPT 0** dari [`03-PROMPTS.md`](03-PROMPTS.md).
3. **Soal izin (approval):** dalam mode default, Codex bekerja di sandbox. Folder `.git` dilindungi (read-only) dan internet dimatikan. Jadi, saat Codex ingin menjalankan `git commit`, `git push`, `gh`, atau `dotnet` yang perlu mengunduh package NuGet, ia akan **meminta izin**. Baca perintahnya, lalu setujui. Ini memang sengaja, supaya kamu tetap memegang kendali atas akun GitHub kamu.

### Opsional: kurangi permintaan izin untuk NuGet
Kalau terlalu sering diminta izin saat `dotnet build` atau `dotnet add package`, kamu bisa mengizinkan akses internet di sandbox. **Edit** file `%USERPROFILE%\.codex\config.toml` yang sudah ada (jangan ditimpa seluruhnya), lalu tambahkan:

```toml
[sandbox_workspace_write]
network_access = true
```

Commit dan push tetap akan meminta izin karena `.git` selalu dilindungi.

> Codex juga tersedia sebagai ekstensi VS Code dan aplikasi desktop. Semuanya membaca `AGENTS.md` yang sama, jadi pakai yang paling nyaman.

---

## F. Setup Claude untuk repo ini

| Cara | Langkah | Cocok untuk |
|---|---|---|
| **Claude desktop (Cowork)** | Klik **Add folder**, pilih `Documents\dotnet-90-days`, lalu kirim PROMPT 5 | Penjelasan konsep, review kode, kuis, merapikan roadmap |
| **Claude Code** | `cd` ke folder ini, lalu `claude` | Sama seperti Codex: bisa menjalankan `.\day`, `dotnet`, dan `git` |

`CLAUDE.md` otomatis mengimpor `AGENTS.md`, jadi aturan untuk Claude dan Codex sama.

---

## G. Selesai, cek akhir

```powershell
.\day status
gh repo view --web     # buka repo kamu di browser
```

Kalau tabel progres sudah tampil di GitHub, setup selesai. Mulai Day 01 dengan **PROMPT 1**.

Selanjutnya, simpan commit bermakna setiap hari belajar di repo ini. Isi progres README dan jurnal berdasarkan pekerjaan serta hasil verifikasi yang nyata. Sertakan perintah menjalankan kode yang sudah dicoba; bagian "Yang saya pahami" tetap kamu tulis sendiri.
