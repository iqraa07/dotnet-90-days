# HANDOFF — Catatan Serah Terima

> File ini **dibaca pertama** dan **diperbarui terakhir** di setiap sesi, oleh Codex, Claude, atau kamu sendiri.
> Tujuannya supaya tool mana pun yang dibuka berikutnya langsung tahu posisi terakhir tanpa perlu menebak.

**Update terakhir:** 2026-10-24 · **oleh:** Claude
**Mode aktif:** PAIR

## Posisi sekarang
- Hari aktif: belum mulai (berikutnya: **Day 01 — Setup .NET 10 and Hello World**)
- Status: struktur repo, roadmap, dan panduan sudah dibuat. Repo belum di-`git init` dan belum di-push ke GitHub.

## Sudah selesai
- Folder `dotnet-90-days` beserta ROADMAP, AGENTS.md, script `day.ps1`, dan workflow CI.

## Belum selesai / TODO kamu
- Install tools dan login GitHub (lihat `docs/01-SETUP-WINDOWS.md`).
- Jalankan PROMPT 0 (Setup awal) di Codex.

## Langkah berikutnya
1. Ikuti `START-HERE.md`.
2. Setelah repo ter-push, jalankan PROMPT 1 untuk memulai Day 01.

## Catatan untuk AI berikutnya
- Placeholder `<GITHUB_USERNAME>` di README akan diganti otomatis oleh `.\day init` setelah user login dengan `gh`.
- Workflow CI (`templates/github/build.yml`) dan rekomendasi ekstensi VS Code (`templates/vscode/extensions.json`) disimpan di `templates/`. Keduanya dipasang otomatis ke `.github/workflows/` dan `.vscode/` saat `.\day init` dijalankan.
