# HANDOFF — Catatan Serah Terima

> File ini **dibaca pertama** dan **diperbarui terakhir** di setiap sesi, oleh Codex, Claude, atau kamu sendiri.
> Tujuannya supaya tool mana pun yang dibuka berikutnya langsung tahu posisi terakhir tanpa perlu menebak.

**Update terakhir:** 2026-10-24 · **oleh:** Codex
**Mode aktif:** PAIR

## Posisi sekarang
- Hari aktif: **Day 01 — Setup .NET 10 and Hello World**, sedang dikerjakan.
- Status: setup selesai lewat Codex dan sudah di-push ke repo public https://github.com/iqraa07/dotnet-90-days. Kerangka Day 01 siap, build dan run lulus; tiga TODO masih menunggu user. Progres 0/90 selesai.

## Sudah selesai
- Folder `dotnet-90-days` beserta ROADMAP, AGENTS.md, script `day.ps1`, dan workflow CI.
- Git 2.55.0 dan GitHub CLI 2.102.0 tersedia; akun `iqraa07` aktif.
- .NET SDK 10.0.402 dipasang melalui winget setelah izin user. `dotnet --version` berhasil setelah lokasi SDK ditambahkan ke PATH proses kerja.
- Identitas Git global diset sesuai persetujuan: Muhammad Iqra Nur Fajar, `134745278+iqraa07@users.noreply.github.com`.
- Nama lama pada panduan diganti, README dirapikan, dan aturan satu repo untuk seluruh 90 hari disimpan di AGENTS serta panduan.
- Antislop lokal 3.2.20 dibandingkan dengan rilis resmi terbaru 3.2.21 pada 2026-10-24. Belum mengunduh atau memasang pembaruan skill.
- User menyelesaikan otorisasi scope `workflow` sendiri melalui `gh auth refresh`. Push ulang berhasil tanpa membuat repo lain.
- Commit `chore: setup complete` adalah `c9df787`; workflow-nya lulus: https://github.com/iqraa07/dotnet-90-days/actions/runs/40107910902.
- `.\day new 1` membuat project `phase-1-csharp/day-01-setup-net-10-and-hello-world`, jurnal Day 01, dan status sedang dikerjakan pada README.
- README latihan berisi tujuan, perintah run, petunjuk, dan kriteria pemeriksaan. `Program.cs` berisi tiga TODO, dengan bagian inti dibiarkan untuk user.
- `dotnet build` lulus dengan 0 warning dan 0 error. `dotnet run` berhasil menampilkan tiga penanda belum diisi.
- User meminta penjelasan singkat dan profesional, tanpa emoji dekoratif. Preferensi ini disimpan di AGENTS.md.
- User memberi izin push kerangka Day 01. Commit WIP `e27a2b7` sudah di-push; GitHub Actions untuk kode latihan lulus: https://github.com/iqraa07/dotnet-90-days/actions/runs/40108251631.

## Belum selesai / TODO kamu
- User mengganti nilai sementara pada `Program.cs` baris 4, 9, dan 14: nama, tanggal/waktu melalui `DateTime.Now`, dan versi runtime melalui `Environment.Version`.
- User mengisi 3-5 poin pada bagian "Yang saya pahami" di `journal/day-01-setup-net-10-and-hello-world.md`. Bagian ini masih sama persis dengan template dan belum diisi AI.
- Review jawaban user, jalankan build/run, lalu selesaikan Day 01 setelah semua syarat terpenuhi.
- Codex yang masih terbuka belum memuat PATH baru dari instalasi .NET. Tutup dan buka ulang Codex agar `dotnet` tersedia di terminal berikutnya. Selama sesi ini, penambahan `C:\Program Files\dotnet` ke PATH hanya berlaku pada proses kerja.

## Langkah berikutnya
1. User mengerjakan tiga TODO dan refleksi jurnal, lalu meminta review melalui PROMPT 2.
2. Jalankan build dan run; belum ada project test pada Day 01. Review tanpa langsung mengganti jawaban user, lalu ajukan tiga pertanyaan pemahaman.
3. Setelah user siap menyelesaikan hari, ikuti PROMPT 4 untuk `.\day done 1`, push, dan pembaruan handoff. Sampai itu terjadi, pertahankan status sedang dikerjakan.

## Catatan untuk AI berikutnya
- Folder repo sebenarnya: `Documents\dotnet-90-days`; workspace chat awal berada di folder Codex yang berbeda.
- `.\day init` sudah memasang workflow dan rekomendasi ekstensi, mengganti placeholder README, serta membuat commit awal `4c82872`.
- Semua hari dan fase harus tetap di repo `iqraa07/dotnet-90-days`. Jangan menandai Day 01 selesai sebelum TODO dan refleksi user tuntas.
- Windows Application Control memblokir executable apphost hasil build. Project Day 01 memakai opsi resmi `<UseAppHost>false</UseAppHost>` dan perintah `dotnet run` sudah diuji berhasil; jangan mengubah kebijakan keamanan Windows.
- Izin push setup sudah diberikan user. Untuk push pekerjaan harian dalam mode PAIR, ikuti aturan konfirmasi pada AGENTS.md dan izin eksplisit dalam percakapan.
