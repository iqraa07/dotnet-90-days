# HANDOFF — Catatan Serah Terima

> File ini **dibaca pertama** dan **diperbarui terakhir** di setiap sesi, oleh Codex, Claude, atau kamu sendiri.
> Tujuannya supaya tool mana pun yang dibuka berikutnya langsung tahu posisi terakhir tanpa perlu menebak.

**Update terakhir:** 2026-10-24 · **oleh:** Codex
**Mode aktif:** PAIR

## Posisi sekarang
- Hari aktif: belum mulai (berikutnya: **Day 01 — Setup .NET 10 and Hello World**)
- Status: setup selesai lewat Codex. Branch `main` sudah di-push ke repo public https://github.com/iqraa07/dotnet-90-days. Berikutnya Day 01 dalam mode PAIR.

## Sudah selesai
- Folder `dotnet-90-days` beserta ROADMAP, AGENTS.md, script `day.ps1`, dan workflow CI.
- Git 2.55.0 dan GitHub CLI 2.102.0 tersedia; akun `iqraa07` aktif.
- .NET SDK 10.0.402 dipasang melalui winget setelah izin user. `dotnet --version` berhasil setelah lokasi SDK ditambahkan ke PATH proses kerja.
- Identitas Git global diset sesuai persetujuan: Muhammad Iqra Nur Fajar, `134745278+iqraa07@users.noreply.github.com`.
- Nama lama pada panduan diganti, README dirapikan, dan aturan satu repo untuk seluruh 90 hari disimpan di AGENTS serta panduan.
- Antislop lokal 3.2.20 dibandingkan dengan rilis resmi terbaru 3.2.21 pada 2026-10-24. Belum mengunduh atau memasang pembaruan skill.
- User menyelesaikan otorisasi scope `workflow` sendiri melalui `gh auth refresh`. Push ulang berhasil tanpa membuat repo lain.
- Workflow pertama sudah terdaftar: https://github.com/iqraa07/dotnet-90-days/actions/runs/40107881690 (status terakhir saat catatan ini ditulis: queued).

## Belum selesai / TODO kamu
- Mulai Day 01: siapkan project console, README latihan, jurnal, dan 1-3 `TODO(kamu)` untuk user.
- Codex yang masih terbuka belum memuat PATH baru dari instalasi .NET. Tutup dan buka ulang Codex agar `dotnet` tersedia di terminal berikutnya. Selama sesi ini, penambahan `C:\Program Files\dotnet` ke PATH hanya berlaku pada proses kerja.

## Langkah berikutnya
1. Ikuti PROMPT 1: cek `git status`, `git log --oneline -5`, handoff, dan `.\day status`; laporkan dalam 3 baris.
2. Jalankan `.\day new 1`, baca target Day 01 di ROADMAP, lalu siapkan latihan PAIR yang tetap bisa di-build.
3. Isi hanya bagian jurnal yang boleh diisi AI. Jelaskan lokasi TODO, perintah run, dan cara memeriksa hasilnya; refleksi user tetap kosong.

## Catatan untuk AI berikutnya
- Folder repo sebenarnya: `Documents\dotnet-90-days`; workspace chat awal berada di folder Codex yang berbeda.
- `.\day init` sudah memasang workflow dan rekomendasi ekstensi, mengganti placeholder README, serta membuat commit awal `4c82872`.
- Semua hari dan fase harus tetap di repo `iqraa07/dotnet-90-days`. Jangan menandai Day 01 selesai sebelum TODO dan refleksi user tuntas.
