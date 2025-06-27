
# EcoQuest: Misi Hijau, Aksi Nyata 🌍

Sebuah aplikasi mobile gamifikasi untuk mengubah kebiasaan kecil menjadi aksi nyata bagi iklim.  
**Selesaikan misi, dapatkan poin, dan jadilah pahlawan bagi bumi!**

---

## 🌳 Ringkasan Proyek (Project Overview)

**EcoQuest** adalah aplikasi mobile yang dibangun menggunakan Flutter untuk mengatasi masalah apatisme terhadap isu perubahan iklim.  
Aplikasi ini mengubah tindakan ramah lingkungan sehari-hari menjadi sebuah "Quest" atau misi yang seru dan menantang.

Pengguna diajak untuk menyelesaikan misi seperti:

- Mengurangi penggunaan plastik  
- Menghemat energi  
- Menggunakan transportasi berkelanjutan

Setiap misi yang diselesaikan akan memberikan **Experience Points (XP)** untuk:

- Meningkatkan level pengguna  
- Mendapatkan **lencana (badges)** sebagai bentuk pengakuan  
- Berkompetisi melalui **leaderboard** untuk menciptakan komunitas dan motivasi kolektif

---

## 🌱 SDG yang Dipilih & Alasan (Chosen SDG & Justification)

Proyek ini secara langsung berfokus pada:

### 🎯 SDG 13: Penanganan Perubahan Iklim (Climate Action)

**Alasan:**
Perubahan iklim adalah tantangan besar yang sering membuat individu merasa tidak berdaya. EcoQuest hadir untuk mematahkan pandangan tersebut dengan cara:

- **Memberikan Aksi Konkret**  
  Menyediakan panduan langkah demi langkah bagi individu.

- **Membangun Kebiasaan**  
  Gamifikasi membuat aksi terasa menyenangkan dan berkelanjutan.

- **Meningkatkan Kesadaran**  
  Menunjukkan bahwa aksi kecil berdampak besar jika dilakukan bersama.

#### Dukungan Tidak Langsung terhadap SDG Lain:

- **SDG 11:** Kota dan Permukiman Berkelanjutan  
- **SDG 12:** Konsumsi dan Produksi yang Bertanggung Jawab  
- **SDG 14 & 15:** Ekosistem Lautan dan Daratan

---

## 🛠️ Tumpukan Teknologi (Tech Stack)

| Komponen           | Teknologi                     |
|--------------------|-------------------------------|
| Framework          | Flutter                       |
| Bahasa Pemrograman | Dart                          |
| Arsitektur         | MVVM (Model-View-ViewModel)   |
| State Management   | Provider                      |
| Backend & Database | Firebase (BaaS)               |
| UI                 | Material Design 3             |

---

## 🚀 Pengaturan & Instalasi (Setup & Installation)

### 1. Clone Repositori

```bash
git clone https://github.com/jazhardcore7/ecoquest.git
cd ecoquest
```

### 2. Siapkan Proyek Firebase

- Buat proyek baru di [Firebase Console](https://console.firebase.google.com/)
- Aktifkan:
  - **Authentication** (metode Email/Password)
  - **Cloud Firestore**
- Tambahkan aplikasi Android dengan `package name`:
  ```
  com.jazdev.ecoquest
  ```
- Unduh `google-services.json` dan tempatkan di:
  ```
  android/app/
  ```

### 3. Instal Dependensi

```bash
flutter pub get
```

### 4. Jalankan Aplikasi

```bash
flutter run
```

---

## 🎮 Cara Penggunaan & Kontribusi

### Cara Penggunaan Aplikasi:

1. **Daftar/Login** – Buat akun baru atau masuk dengan akun Anda.  
2. **Pilih Misi** – Telusuri papan misi dan pilih tantangan.  
3. **Selesaikan Misi** – Lakukan aksi dan tekan tombol "Selesaikan".  
4. **Naik Level** – Kumpulkan XP dan buka lencana.  
5. **Pantau Peringkat** – Lihat posisi Anda di leaderboard.

### 🔽Download Link :
```bash
https://github.com/jazhardcore7/ecoquest/releases/tag/v0.0.5
```
---

## 🔥 Penggunaan Firebase (Firebase Usage)

**EcoQuest** menggunakan Firebase sebagai backend untuk mempercepat proses pengembangan.

### Fitur Firebase:

- **Firebase Authentication**  
  Untuk registrasi dan login yang aman.

- **Cloud Firestore**  
  Menyimpan data dengan struktur NoSQL.

#### Struktur Koleksi:

- `users`: Data profil pengguna (nama, email, total XP, level, dll)  
- `quests`: Daftar misi (judul, deskripsi, poin XP, kategori)

---

> Made with 💚 for a better planet.
