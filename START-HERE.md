# Mulai di Sini

Selamat datang di program **90 hari belajar .NET**. Ikuti 4 langkah di bawah ini sekali saja (sekitar 20–30 menit). Setelah itu, rutinitas harian cukup dengan satu prompt.

Semua hari dan fase belajar berada di repo **`dotnet-90-days`** yang sama. Folder kode dan jurnal bertambah di dalamnya; tidak perlu membuat repo baru setiap hari.

## Langkah 1 — Install tools (±10 menit)

Cek dulu versi tools dengan perintah verifikasi di bawah. Buka **PowerShell** dan pasang hanya tools yang belum tersedia. Jika AI yang menjalankan instalasi, ia harus meminta izin kamu terlebih dahulu.

```powershell
winget install --id Git.Git -e
winget install --id Microsoft.DotNet.SDK.10 -e
winget install --id GitHub.cli -e
winget install --id Microsoft.VisualStudioCode -e
```

**Tutup PowerShell, lalu buka lagi**, kemudian cek:

```powershell
git --version; dotnet --version; gh --version; codex --version
```

`dotnet --version` harus diawali `10.0`. Kalau `codex` belum terpasang: `winget install OpenAI.Codex` (atau `npm install -g @openai/codex`).

Kalau perintah masih tidak dikenali setelah instalasi lewat Codex, tutup lalu buka ulang aplikasi Codex sebelum melanjutkan.

Detail lengkap dan troubleshooting ada di [`docs/01-SETUP-WINDOWS.md`](docs/01-SETUP-WINDOWS.md).

## Langkah 2 — Identitas Git dan login GitHub (±5 menit, kamu sendiri)

```powershell
git config --global user.name "Muhammad Iqra Nur Fajar"
git config --global user.email "EMAIL-TERVERIFIKASI-ATAU-NOREPLY-GITHUB"
git config --global init.defaultBranch main
gh auth status
```

Kalau akun GitHub sudah aktif, lewati login. Kalau belum, jalankan `gh auth login` sendiri, lalu pilih: **GitHub.com → HTTPS → Yes (authenticate Git) → Login with a web browser**. Salin kode yang muncul, tempel di browser, lalu klik Authorize.

> Gunakan email yang terverifikasi di akun GitHub **atau alamat noreply dari GitHub** agar commit terhubung ke akunmu. Ambil alamat noreply dari Settings → Emails. Lihat [petunjuk email commit GitHub](https://docs.github.com/en/account-and-profile/how-tos/email-preferences/setting-your-commit-email-address).
> Jangan memberikan password atau token GitHub ke AI. Login dilakukan sendiri lewat `gh`.

## Langkah 3 — Buka Codex di folder ini

```powershell
cd "$HOME\Documents\dotnet-90-days"
codex
```

- Kalau Codex bertanya apakah folder ini dipercaya (*trust*), pilih **Yes**. Tanpa ini, `AGENTS.md` tidak akan dibaca.
- Salin dan kirim **PROMPT 0 — Setup awal** dari [`docs/03-PROMPTS.md`](docs/03-PROMPTS.md).
- Saat Codex meminta izin menjalankan `git`, `gh`, atau `dotnet`, baca perintahnya lalu setujui (*approve*). Ini normal.

## Langkah 4 — Hubungkan Claude (opsional, untuk mentor dan review)

- **Claude desktop (Cowork):** klik **Add folder**, lalu pilih `Documents\dotnet-90-days`.
- **Claude Code:** `cd` ke folder ini, lalu jalankan `claude`.

## Setiap hari

Kirim **PROMPT 1 — Mulai hari berikutnya** ke Codex atau Claude. Alur lengkapnya ada di [`docs/02-WORKFLOW-HARIAN.md`](docs/02-WORKFLOW-HARIAN.md).

Buat commit bermakna untuk pekerjaan belajar hari itu. Perbarui progres README dan jurnal sesuai yang benar-benar dikerjakan, lalu cantumkan perintah menjalankan kode yang sudah dicoba. Bagian "Yang saya pahami" kamu isi sendiri.

Peta isi folder:

| File | Isi |
|---|---|
| `ROADMAP.md` | Rencana Day 01–90 |
| `README.md` | Tabel progres (yang dilihat recruiter) |
| `AGENTS.md` / `CLAUDE.md` | Aturan untuk Codex dan Claude |
| `HANDOFF.md` | Posisi terakhir, untuk serah terima antar tool |
| `journal/` | Jurnal harian kamu |
| `docs/` | Setup, alur harian, prompt, cheatsheet |
| `day.cmd` + `scripts/day.ps1` | Helper: `.\day new 1`, `.\day done 1`, `.\day status`, `.\day push` |
