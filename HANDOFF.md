# HANDOFF — Catatan Serah Terima

> File ini **dibaca pertama** dan **diperbarui terakhir** di setiap sesi, oleh Codex, Claude, atau kamu sendiri.
> Tujuannya supaya tool mana pun yang dibuka berikutnya langsung tahu posisi terakhir tanpa perlu menebak.

**Update terakhir:** 2026-10-24 · **oleh:** Codex
**Mode aktif:** PAIR

## Posisi sekarang
- Hari aktif: belum mulai (berikutnya: **Day 01 — Setup .NET 10 and Hello World**)
- Status: Git lokal sudah diinisialisasi di branch `main`. Repo public sudah dibuat di https://github.com/iqraa07/dotnet-90-days, tetapi push pertama ditolak karena sesi `gh` belum memiliki scope `workflow`. Setup belum selesai.

## Sudah selesai
- Folder `dotnet-90-days` beserta ROADMAP, AGENTS.md, script `day.ps1`, dan workflow CI.
- Git 2.55.0 dan GitHub CLI 2.102.0 tersedia; akun `iqraa07` aktif.
- .NET SDK 10.0.402 dipasang melalui winget setelah izin user. `dotnet --version` berhasil setelah lokasi SDK ditambahkan ke PATH proses kerja.
- Identitas Git global diset sesuai persetujuan: Muhammad Iqra Nur Fajar, `134745278+iqraa07@users.noreply.github.com`.
- Nama lama pada panduan diganti, README dirapikan, dan aturan satu repo untuk seluruh 90 hari disimpan di AGENTS serta panduan.
- Antislop lokal 3.2.20 dibandingkan dengan rilis resmi terbaru 3.2.21 pada 2026-10-24. Belum mengunduh atau memasang pembaruan skill.

## Belum selesai / TODO kamu
- User perlu menjalankan `gh auth refresh -h github.com -s workflow` sendiri dan menyelesaikan otorisasi browser. Codex sudah meminta tindakan ini; jangan meminta password atau token.
- Push ulang ke `origin` yang sudah tersedia, lalu verifikasi GitHub Actions.
- Codex yang masih terbuka belum memuat PATH baru dari instalasi .NET. Tutup dan buka ulang Codex agar `dotnet` tersedia di terminal berikutnya. Selama sesi ini, penambahan `C:\Program Files\dotnet` ke PATH hanya berlaku pada proses kerja.

## Langkah berikutnya
1. Setelah user menyelesaikan otorisasi, cek scope lewat `gh auth status`, lalu jalankan `.\day publish` lagi. Helper memakai `origin` yang sudah ada; jangan membuat repo lain.
2. Tampilkan URL repo dan status Actions. Perbarui handoff menjadi setup selesai, commit `chore: setup complete`, lalu `.\day push` sesuai instruksi user.
3. Langsung mulai Day 01 dalam mode PAIR mengikuti PROMPT 1, dengan 1-3 TODO untuk user dan bagian pemahaman jurnal tetap kosong.

## Catatan untuk AI berikutnya
- Folder repo sebenarnya: `Documents\dotnet-90-days`; workspace chat awal berada di folder Codex yang berbeda.
- `.\day init` sudah memasang workflow dan rekomendasi ekstensi, mengganti placeholder README, serta membuat commit awal `4c82872`.
- Semua hari dan fase harus tetap di repo `iqraa07/dotnet-90-days`. Jangan menandai Day 01 selesai sebelum TODO dan refleksi user tuntas.
