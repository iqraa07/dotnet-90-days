# 02 — Alur Kerja Harian

## Rutinitas 60–120 menit

| Waktu | Siapa | Apa | Prompt / perintah |
|---|---|---|---|
| 5 menit | AI | Cek posisi, mulai hari, buat jurnal dan project | **PROMPT 1** |
| 10–15 menit | AI → kamu | Penjelasan konsep (maksimal 5 poin + contoh) | (bagian dari PROMPT 1) |
| 30–60 menit | **Kamu** | Kerjakan `TODO(kamu)`, jalankan, dan coba-coba sendiri | `dotnet run` |
| 10 menit | AI | Review kode kamu, lalu 3 pertanyaan cek pemahaman | **PROMPT 2** |
| 5–10 menit | **Kamu** | Tulis "Yang saya pahami" di jurnal | edit `journal/day-NN-*.md` |
| 2 menit | AI | Tandai selesai, commit, push, update HANDOFF | **PROMPT 4** |

Kalau mentok, pakai **PROMPT 3**. AI akan memberi petunjuk bertahap, bukan langsung jawabannya.

## Pembagian peran Codex dan Claude

Keduanya membaca aturan yang sama (`AGENTS.md`), jadi bisa saling menggantikan. Supaya efisien, saran pembagiannya:

| Codex: eksekutor | Claude: mentor dan reviewer |
|---|---|
| `.\day new`, scaffold project, install package | Menjelaskan konsep yang belum paham |
| Menjalankan `dotnet build`, `run`, `test` | Me-review kode dan memberi saran |
| Commit dan push ke GitHub | Kuis mingguan dan rangkuman materi |
| Memperbaiki error build | Mengubah atau menyesuaikan ROADMAP |

**Aturan emas:**

1. **Jangan pakai Codex dan Claude bersamaan di file yang sama.** Selesaikan satu, commit, baru pindah.
2. **Setiap pindah tool, kirim PROMPT 5 (handoff).** Tool baru akan membaca `HANDOFF.md` dan `git log`.
3. **Akhir sesi = working tree bersih** (semua sudah di-commit). Pekerjaan setengah jadi di-commit sebagai `day-NN: wip ...`.

> Catatan untuk Claude desktop (Cowork): Claude bekerja dari lingkungan Linux, jadi tidak bisa menjalankan `.\day` (PowerShell) dan sebaiknya tidak menjalankan `git commit` di sana. Biarkan Claude mengedit, menjelaskan, dan me-review, lalu commit lewat Codex atau `.\day done N`.

## Ganti mode sesuai kondisi

| Kondisi | Tulis di awal prompt |
|---|---|
| Normal (disarankan) | `mode: pair` |
| Lagi semangat, ingin menulis sendiri | `mode: mentor` |
| Sibuk sekali, tapi tetap ingin ada progres | `mode: auto` (AI tetap memberi 3 pertanyaan cek pemahaman di jurnal) |

## Kalau bolong beberapa hari

- **Jangan** membuat commit palsu atau memalsukan tanggal. Recruiter yang jeli bisa melihatnya, dan yang penting adalah ilmunya.
- Nomor hari = sesi belajar. Besok tinggal lanjut ke Day berikutnya.
- Kalau ingin mengejar, pakai **PROMPT 8**. AI akan mengusulkan hari mana yang bisa digabung.
- Kalau sengaja melewati satu topik: `.\day skip N` (ditandai ⏭️).

## Ritme mingguan

- **Hari ke-7 setiap minggu = Checkpoint:** mini project, refleksi, dan kuis (**PROMPT 6**, cocok di Claude).
- **Setiap Checkpoint:** minta code review menyeluruh (**PROMPT 10**).
- **Akhir fase (Day 30, 60, 90):** buat tag rilis (`v0.1`, `v0.2`, `v1.0`) dan perbarui CV.

## Yang dilihat recruiter di GitHub kamu

1. README dengan tabel progres yang konsisten.
2. Commit kecil-kecil dengan pesan yang jelas (`day-14: Checkpoint 2 ...`).
3. Jurnal yang menunjukkan cara kamu berpikir dan memecahkan masalah.
4. **Proyek HelpdeskLite** (pin di profil) dengan README, screenshot, dan demo.
