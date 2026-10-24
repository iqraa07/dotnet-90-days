# 02: Alur Kerja Harian

Semua hari belajar memakai repo `dotnet-90-days`. Jalankan perintah helper dari root repo dan simpan hasil setiap sesi pada folder kode serta jurnal yang sesuai.

## Mulai sesi

```powershell
git status
git log --oneline -5
.\day status
```

Baca `HANDOFF.md` dan jurnal hari yang sedang dikerjakan. Periksa perubahan yang belum di-commit sebelum menambah pekerjaan baru.

Lanjutkan hari yang masih berjalan. Jika belum ada, pilih hari pertama yang belum dimulai, lalu jalankan helper dengan nomor hari tersebut. Contoh untuk Day 01:

```powershell
.\day new 1
```

Helper membuat jurnal, memperbarui progres README, dan membuat project console untuk Fase 1.

## Kerjakan latihan

1. Baca target, materi, dan praktik hari tersebut di `ROADMAP.md`.
2. Kerjakan latihan serta bagian `TODO(kamu)` yang tersedia.
3. Ikuti perintah pada README latihan untuk build dan menjalankan program.
4. Bandingkan hasil dengan contoh atau kriteria pemeriksaan. Jalankan test jika project memiliki test.
5. Catat pekerjaan, kendala, dan hasil pemeriksaan di jurnal. Tulis bagian **Yang saya pahami** dengan kata-kata sendiri.

Contoh build dan run Day 01 dari root repo:

```powershell
dotnet build .\phase-1-csharp\day-01-setup-net-10-and-hello-world
dotnet run --project .\phase-1-csharp\day-01-setup-net-10-and-hello-world
```

Jika ada error, catat pesan lengkap, langkah yang memicunya, hasil yang diharapkan, dan percobaan perbaikannya. Gunakan [checklist sesi](03-PROMPTS.md) untuk memeriksa pekerjaan secara bertahap.

## Tutup sesi

Hari selesai setelah latihan berfungsi, build dan test yang tersedia lulus, serta jurnal termasuk refleksi pribadi terisi. Periksa perubahan sebelum membuat commit:

```powershell
git diff
.\day done 1
.\day push
```

Ganti `1` dengan nomor hari yang dikerjakan. Perintah `done` memeriksa build dan isi refleksi jurnal, menandai hari selesai, lalu membuat commit `day-NN: <judul>`.

Perbarui `HANDOFF.md` dengan posisi terakhir, hasil verifikasi, dan langkah berikutnya. Simpan perubahan catatan tersebut:

```powershell
git add HANDOFF.md
git commit -m "chore: update handoff"
.\day push
git status
```

Jika latihan belum tuntas, pertahankan status sedang dikerjakan. Catat sisa pekerjaan di `HANDOFF.md` dan simpan progres dengan commit WIP yang jelas, misalnya `day-01: wip add console exercise`.

## Jeda dan evaluasi

Nomor hari mengikuti urutan sesi belajar. Setelah jeda, lanjutkan dari pekerjaan terakhir tanpa mengubah tanggal commit. Jika sengaja melewati topik, gunakan `.\day skip N` dan catat alasannya.

Pada checkpoint di roadmap, tinjau kode, ulangi materi yang masih sulit, dan tulis hasil evaluasi. Saat akhir fase, periksa kelengkapan README, perintah run, jurnal, serta hasil test sebelum membuat rilis.
