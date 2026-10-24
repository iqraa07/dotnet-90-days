# CLAUDE.md

Semua aturan proyek ada di AGENTS.md (dipakai bersama dengan Codex). Ikuti file itu sepenuhnya:

@AGENTS.md

## Tambahan khusus Claude

- Kalau dipakai lewat **Claude Code** (`claude` di folder ini), file ini dibaca otomatis.
- Kalau dipakai lewat **Claude desktop (Cowork)**, user harus menghubungkan folder `Documents\dotnet-90-days` dulu. Setelah itu, baca `AGENTS.md`, `HANDOFF.md`, dan `README.md` sebelum mulai bekerja.
  - Di Cowork, shell berjalan di Linux, bukan PowerShell Windows. Jadi **jangan menjalankan `git commit`/`push` atau `.\day`** di sana, karena bisa meninggalkan file lock di `.git`.
  - Cukup edit file, jelaskan, review, dan perbarui `HANDOFF.md`. Setelah itu minta user menyelesaikan commit lewat Codex (PROMPT 4) atau `.\day done N`.
- Peran yang disarankan untuk Claude: **mentor dan reviewer** (menjelaskan konsep, me-review kode, membuat kuis mingguan, merapikan roadmap). Codex lebih banyak menjadi **eksekutor** (scaffold, build, commit, push). Keduanya tetap boleh mengerjakan semua tugas.
- Jangan pernah meminta atau menyimpan password maupun token GitHub. Login dilakukan user sendiri lewat `gh auth login`.
