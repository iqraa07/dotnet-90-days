---
name: dotnet-study
description: Lanjutkan latihan, dokumentasi, dan hasil progres pada repo iqraa07/dotnet-90-days sesuai roadmap 90 hari dan status sesi terakhir.
---

# .NET study workflow

Baca `AGENTS.md` dan `HANDOFF.md` pada root repo. Gunakan status Git, tabel README, serta jurnal sebagai acuan; jangan menganggap rencana sebagai pekerjaan yang sudah selesai.

## Preferensi pemilik

- Muhammad Iqra Nur Fajar, akun `iqraa07`; satu repo `dotnet-90-days` untuk seluruh program.
- Penjelasan Indonesia, ringkas dan profesional. Kode serta commit message dalam English.
- Dokumen publik memuat materi, perintah, dan hasil. Hindari nama layanan pendamping, emoji dekoratif, bahasa promosi, serta klaim kepengarangan atau pemahaman yang tidak terbukti.
- PAIR adalah default. Permintaan untuk mengerjakan suatu hari secara penuh mengizinkan penyelesaian kodenya; jangan memperluasnya menjadi pengerjaan seluruh 90 hari.

## Materi dan struktur

- Pertahankan format heading Day di ROADMAP, marker progres, dan 90 baris helper pada README.
- `days/day-NN/` menjadi katalog materi; hari yang belum dimulai tetap berstatus rencana. Source tetap di folder fase, tanpa salinan per hari untuk project bersama.
- Kode selesai ketika build/run dan test yang relevan lulus. Status hari selesai juga memerlukan refleksi pribadi pemilik; jangan mengisi bagian itu dari kesimpulan sendiri atau memakai `-Force` untuk melewatinya.
- Jika kode dikerjakan penuh, tambahkan tiga pertanyaan pemahaman yang bisa dijawab setelah mencoba program.

## Hasil yang dibagikan

Untuk gambar progres, jalankan project yang dimaksud dan simpan output aktual. Gambar boleh menata ulang output agar terbaca, tetapi angka, waktu, status, dan hasil harus berasal dari eksekusi tersebut. Sertakan sumber teks bila mengekspor visual. Simpan aset di `assets/progress/` dan tautkan dari halaman hari yang sesuai.

Untuk project console sederhana, `scripts/export-progress.ps1` dapat menjalankan build/run dan mengekspor visual. Berikan nomor hari, path project, judul, serta folder kerja. Periksa hasil gambar sebelum membagikannya; tata letak saat ini dibuat untuk source dan output singkat seperti Day 01.

Jangan memublikasikan hasil ke media sosial tanpa permintaan khusus. Commit/push hanya dalam lingkup yang diminta, ke repo yang sama; jangan membuat progres atau riwayat palsu.

## Kendala yang sudah diketahui

- SDK target .NET 10. Day 01 memakai `UseAppHost=false`; ini memungkinkan run melalui runtime .NET tanpa executable apphost tambahan.
- Proses terminal lama mungkin belum menerima PATH instalasi. Periksa tool lebih dulu; lokasi SDK pada mesin ini `C:\Program Files\dotnet`.
- Scope `workflow` dibutuhkan untuk mengunggah file GitHub Actions. Login dan perubahan scope diselesaikan pemilik sendiri.

Perbarui `HANDOFF.md` dengan hasil, kendala, izin yang masih relevan, dan pekerjaan berikutnya. Akhiri dengan commit bermakna dan working tree bersih.
