EcoQuest: Misi Hijau, Aksi Nyata 🌍
Sebuah aplikasi mobile gamifikasi untuk mengubah kebiasaan kecil menjadi aksi nyata bagi iklim. Selesaikan misi, dapatkan poin, dan jadilah pahlawan bagi bumi!

🌳 Ringkasan Proyek (Project Overview)
EcoQuest adalah aplikasi mobile yang dibangun menggunakan Flutter untuk mengatasi masalah apatisme terhadap isu perubahan iklim. Aplikasi ini mengubah tindakan ramah lingkungan sehari-hari menjadi sebuah "Quest" atau misi yang seru dan menantang. Pengguna diajak untuk menyelesaikan misi seperti mengurangi penggunaan plastik, menghemat energi, dan menggunakan transportasi berkelanjutan.

Setiap misi yang diselesaikan akan memberikan Experience Points (XP) yang dapat meningkatkan level pengguna dan memberinya lencana (badges) sebagai bentuk pengakuan. Dengan papan peringkat (leaderboard), pengguna dapat berkompetisi secara sehat dengan teman-temannya, menciptakan rasa komunitas dan motivasi kolektif untuk membuat perubahan positif bagi planet kita.

🌱 SDG yang Dipilih & Alasan (Chosen SDG & Justification)
Proyek ini secara langsung berfokus pada SDG 13: Penanganan Perubahan Iklim (Climate Action).

Alasan: Perubahan iklim adalah salah satu tantangan terbesar yang dihadapi generasi kita. Namun, skala masalahnya yang masif seringkali membuat individu merasa bahwa tindakan mereka tidak berarti. EcoQuest hadir untuk mematahkan pandangan tersebut dengan:

Memberikan Aksi Konkret: Menyediakan panduan langkah demi langkah tentang apa yang bisa dilakukan individu.

Membangun Kebiasaan: Gamifikasi membantu mengubah aksi yang tadinya terasa berat menjadi kebiasaan yang menyenangkan.

Meningkatkan Kesadaran: Menunjukkan bahwa setiap aksi kecil, jika dilakukan bersama-sama, memiliki dampak yang signifikan.

Aplikasi ini juga secara tidak langsung mendukung:

SDG 11: Kota dan Permukiman Berkelanjutan

SDG 12: Konsumsi dan Produksi yang Bertanggung Jawab

SDG 14 & 15: Ekosistem Lautan dan Daratan

🛠️ Tumpukan Teknologi (Tech Stack)
Framework: Flutter

Bahasa Pemrograman: Dart

Arsitektur: MVVM (Model-View-ViewModel)

State Management: Provider

Backend & Database: Firebase (Backend as a Service)

UI: Material Design 3

🚀 Pengaturan & Instalasi (Setup & Installation)
Untuk menjalankan proyek ini di lingkungan lokal Anda, ikuti langkah-langkah berikut:

Clone Repositori

git clone https://github.com/jazhardcore7/ecoquest.git
cd ecoquest

Siapkan Proyek Firebase

Buat proyek baru di Firebase Console.

Aktifkan layanan Authentication (dengan metode Email/Password) dan Cloud Firestore.

Tambahkan aplikasi Android baru ke proyek Firebase Anda dengan package name: com.jazdev.ecoquest.

Unduh file konfigurasi google-services.json dan letakkan di dalam folder android/app/.

Instal Dependensi

flutter pub get

Jalankan Aplikasi

flutter run

🎮 Cara Penggunaan & Kontribusi
Cara Penggunaan Aplikasi:

Daftar/Login: Buat akun baru atau masuk dengan akun yang sudah ada.

Pilih Misi: Jelajahi "Papan Misi" dan pilih tantangan yang ingin Anda selesaikan.

Selesaikan Misi: Lakukan aksi di dunia nyata dan tekan tombol "Selesaikan" di aplikasi untuk mendapatkan XP.

Naik Level: Kumpulkan XP untuk meningkatkan level dan membuka lencana baru.

Pantau Peringkat: Lihat posisi Anda di antara pejuang iklim lainnya di "Papan Peringkat".

Pedoman Kontribusi:
Kami sangat terbuka untuk kontribusi! Jika Anda ingin membantu mengembangkan EcoQuest, silakan:

Fork repositori ini.

Buat branch baru untuk fitur Anda (git checkout -b fitur/NamaFitur).

Lakukan commit untuk perubahan Anda (git commit -m 'Menambahkan Fitur X').

Push ke branch Anda (git push origin fitur/NamaFitur).

Buka Pull Request.

🔥 Penggunaan Firebase (Firebase Usage)
EcoQuest menggunakan Firebase sebagai backend untuk mempercepat pengembangan:

Firebase Authentication: Menangani semua proses registrasi dan login pengguna secara aman.

Cloud Firestore: Digunakan sebagai database NoSQL untuk menyimpan semua data aplikasi, dengan struktur koleksi sebagai berikut:

users: Menyimpan data profil setiap pengguna (nama, email, total XP, level, dll).

quests: Berisi daftar semua misi yang tersedia di aplikasi (judul, deskripsi, poin XP, kategori).
