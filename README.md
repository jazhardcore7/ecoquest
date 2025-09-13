# 📱 Final Project Plans Review – Mobile Development Division

## 📝 Final Project Plan

### 1. Project Title
**EcoQuest: Gamified Climate Action**

---

### 2. Chosen Final Project Deliverable
- [X] Mobile App on GitHub Repository (without publishing)

**Justification:**
Saya memilih opsi ini karena dengan memilih ini diharapkan bisa mengalokasikan effort agar pengembangan aplikasi dan fitur-fiturnya
---

### 3. Problem Statement & SDG Alignment
- **Problem Statement:** Banyak individu, terutama generasi muda, merasa bahwa isu perubahan iklim terlalu besar dan kontribusi personal mereka tidak berarti. Hal ini menyebabkan kelumpuhan aksi (action paralysis) dan kurangnya motivasi untuk mengadopsi gaya hidup berkelanjutan. Aksi ramah lingkungan sering dianggap sebagai kewajiban yang membosankan, bukan aktivitas yang menarik.
- **Chosen SDG:** **SDG 13: Penanganan Perubahan Iklim (Climate Action)**
- **Justification:** EcoQuest secara langsung mengatasi masalah ini dengan mengubah aksi iklim menjadi sebuah "Quest" atau petualangan yang menyenangkan. Dengan menggunakan gamifikasi (poin, level, lencana), aplikasi ini memberikan umpan balik positif dan rasa pencapaian, memotivasi pengguna untuk membangun kebiasaan ramah lingkungan secara konsisten dan berkontribusi langsung pada tujuan SDG 13.

---

### 4. Target Users & Use Cases
- **Target Users:**
  - Pelajar dan mahasiswa (usia 15-25) yang aktif di media sosial dan tertarik pada isu lingkungan.
  - Generasi milenial di perkotaan yang ingin berkontribusi namun tidak tahu harus mulai dari mana.
  - Komunitas atau organisasi lingkungan yang mencari platform untuk mengoordinasikan aksi kecil.
- **Use Cases:**
  - **Onboarding:** Pengguna baru mendaftar atau login ke aplikasi.
  - **Daily Engagement:** Pengguna membuka aplikasi setiap hari untuk melihat dan menyelesaikan "Misi Harian".
  - **Tracking Progress:** Pengguna mengunjungi halaman profil untuk melihat total XP, level, dan koleksi lencana yang telah mereka dapatkan.
  - **Social Competition:** Pengguna memeriksa Papan Peringkat untuk melihat posisi mereka dibandingkan dengan teman atau pengguna lain.
  - **Achievement Unlocked:** Pengguna menerima notifikasi saat mereka berhasil mendapatkan lencana baru.

---

### 5. Features List
- **User Authentication:** Registrasi dan Login (Email/Password & Google Sign-In).
- **Gamified Quest System:** Daftar misi harian/mingguan yang diperbarui dari Firebase.
- **XP & Leveling System:** Pengguna mendapatkan XP untuk setiap misi dan bisa naik level.
- **Achievement & Badge System:** Lencana yang bisa dikoleksi untuk pencapaian tertentu (misal: menyelesaikan 10 misi hemat air).
- **Real-time Leaderboard:** Papan peringkat pengguna berdasarkan total XP.
- **Dynamic User Profile:** Halaman profil yang menampilkan statistik pengguna, level, dan lencana.
- **Push Notifications:** Pengingat untuk misi harian baru menggunakan Firebase Cloud Messaging (FCM).

---

### 6. Technical Details
- **Architecture Pattern:** **MVVM (Model-View-ViewModel)**, untuk memisahkan logika dari UI dan memastikan kode yang bersih dan terukur.
- **Key Packages/Dependencies:**
  - `firebase_auth`, `cloud_firestore`, `firebase_messaging` untuk integrasi backend.
  - `provider` untuk state management.
  - `flutter_launcher_icons` untuk branding aplikasi.
- **Database/Storage:** **Cloud Firestore** digunakan sebagai database NoSQL real-time untuk semua data aplikasi (profil pengguna, misi, lencana, dll).
- **Other Integrations:** **Firebase** sebagai Backend-as-a-Service (BaaS) secara keseluruhan.

---

### 7. Deliverable-Specific Requirements

#### For GitHub Repo (App without publishing):
- **[X] Will include APK builds for x86_64, arm64, arm32/armeabi-v7a:** Ya, akan dibuat menggunakan perintah `flutter build apk --split-per-abi` dan diunggah ke GitHub Releases.
- **[X] 10+ pages with 5+ widgets each:** Ya, aplikasi akan memiliki halaman Splash, Login, Register, Main (dengan 3 tab: Home, Leaderboard, Profile), Settings, Edit Profile, Quest Details, dan Badge Collection.
- **[X] Meets first-stage production quality:** Ya, dengan arsitektur MVVM yang rapi, UI yang konsisten, dan penanganan error yang baik.

---

### 8. Complexity Plan
Proyek ini memiliki tingkat kerumitan teknis yang cukup tinggi karena:
1.  **Integrasi Backend Real-time:** Memanfaatkan Cloud Firestore secara ekstensif untuk data yang dinamis dan real-time, termasuk leaderboard yang diperbarui secara langsung.
2.  **Logika Gamifikasi Kompleks:** Mengimplementasikan sistem yang saling terkait antara Misi, XP, Level, dan Lencana, yang memerlukan logika `Cloud Functions` (opsional) atau logika sisi klien yang cermat untuk memicu pencapaian.
3.  **Push Notifications:** Mengintegrasikan Firebase Cloud Messaging (FCM) untuk mengirim notifikasi yang relevan dan tepat waktu kepada pengguna, yang menambah lapisan interaksi proaktif.
4.  **Manajemen State Lanjutan:** Menggunakan Provider untuk mengelola state aplikasi yang kompleks (status login, data profil, daftar misi, dll.) agar tetap sinkron di seluruh UI.

---

### 9. Testing Strategy (Optional)
- **Unit Tests:** Menguji fungsi-fungsi murni di dalam ViewModel, seperti logika validasi untuk form registrasi atau kalkulasi XP yang dibutuhkan untuk naik level.
- **Integration Tests:** Menguji alur otentikasi secara penuh, mulai dari pengguna memasukkan data di halaman login, menekan tombol, hingga aplikasi berhasil berkomunikasi dengan Firebase dan mengarahkan ke halaman utama.

---

### 10. Timeline & Milestones
- **Minggu 1:** Finalisasi desain UI/UX berdasarkan palet warna. Implementasi model data dan logika untuk sistem Lencana (Badges) di Firestore dan ViewModel.
- **Minggu 2:** Membangun UI untuk menampilkan lencana di Halaman Profil. Membuat halaman-halaman tambahan seperti Settings, Edit Profile, dan Detail Misi.
- **Minggu 3:** Mengintegrasikan Firebase Cloud Messaging (FCM) untuk notifikasi misi harian. Melakukan refinement UI, menambahkan animasi sederhana, dan perbaikan bug.
- **Minggu 4:** Pengujian akhir menyeluruh, membangun APK final untuk semua arsitektur, membuat dokumentasi di GitHub Releases, dan mempersiapkan presentasi akhir.
