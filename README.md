# simplepbp_eshop_flutter

A new Flutter project. Tugas 7

## Menjawab beberapa pertanyaan berikut pada README.md pada root_folder.


### 1. Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya.
Stateless widget adalah widget yang immutable, propertinya tidak berubah saat mereka di-set. Widget ini digunakan untuk menampilkan konten statis yang itdak memerlukan update variable ketika runtime aplikasi.
Stateful widget adalah widget yang mutable, penampilannya dapat berubah sebagai respons terhadap event yang di-trigger oleh interaksi user dengan aplikasi dengan menyimpan state mutable yang bisa di-update yang membuat widget mampu dibangun ulang dan merepresentasikan perubahan dinamis. Digunakan untuk komponen interaktif seperti button yang bisa on and off , counter, atau segala elemen yang memerlukan untuk menyimpan update dalam respons terhadap input user.
Perbedaannya adalah yang pertama immutable, digunakan untuk konten statis yang tidak berubah, lebih efisien dalam performa karena tidak ada management of state dan yang terakhir mutable, digunakan untuk konten dinamis yang memerlukan update variable-variable sebagai respons interaksi user, lebih banyak overhead dalam performance.
### Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya.
1. MyApp (StatelessWidget): Berperan sebagai root aplikasi, me-return sebuah widget MaterialApp.
2. MaterialApp: Menentukan title aplikasi, tema, dan home screen (di sini Homepage()).
3. Homepage (StatelessWidget): Layar utama app
4. Scaffold: Memberikan struktur layout mendasar untuk Homepage, mencakup sebuah AppBar dan sebuah body.
5. AppBar: Menampilkan title "Simple PBP E-Commerce Homepage" di bagian atas halaman
6. body: Padding: Menambah padding untuk child,  Row, supaya konten tidak menyentuh ujung 
7. Row: Untuk menyusun tiga widget ElevatedButton.icon yang dipisahkan oleh widget SizedBox.
8. ElevatedButton.icon: ButtonStyle bisa ditiru dari satu final buttonStyle variable yang ada di awal kode build() . Setiap buton memiliki icon dan label dan background color yang berbeda. Setiap kali diklik, akan muncul SnackBar karena _showSnackBar(context, message) dipanggil.
- Button 1:
 Icon: Icons.view_list
 Label: 'Lihat Daftar Produk'
 Color: Colors.lightBlueAccent
-  Button 2:
 Icon: Icons.add_shopping_cart
 Label: 'Tambah Produk'
 Color: Colors.lightGreenAccent
-  Button 3:
 Icon: Icons.logout
 Label: 'Logout'
 Background Color: Colors.redAccent

9. SizedBox: Memaksikan button memiliki jarak
10. SnackBar: Menampilkan pesan singkat di bagian bawah layar ketika tombol ditekan.
11. ScaffoldMessenger: Mengatur penampilan Snackbar. Memastikan bahwa SnackBar dihilangkan dulu sebelum menunjukkan yang baru.

### Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
Fungsinya adalah membangun ulang user interface untuk merefleksikan perubahan-perubahan data atau state yang dienkapsulasi di dalam setState() . State variabel dan collection seperti List, Map bisa memperoleh dampak dengan fungsi tersebut. Misalnya, bool _isVisible = true , int counter = 1 , List<String> _items . Perhatikan bahwa "_" di sini berkaitan dengan privacy dari variable method terhadap librarynya. Hal ini tidak dibutuhkan dalam setState(), tetapi biasanya digunakan untuk privacy . 
### Jelaskan perbedaan antara const dengan final 
Keyword const berarti variabel itu konstan saat compile-time , variabelnya wajib diketahui saat compile. Keyword final dinisialisasi sekali saja tetapi dievaluasi saat runtime, bukan compiletime, sehingga nilai bisa ditentukan saat kode dijalankan sehingga final lebih fleksibel dibandingkan const. Tetapi tentu saja final tidak bisa berubah begitu di-assign nilai tertentu.
### Jelaskan bagaimana cara kamu mengimplementasikan checklist-checklist di atas.
1. Membaca dan memahami Tugas dan hal-hal yang harus dibuat.
2. Menentukan rencana layout menggunakan Row.
3. Membuat project Flutter dengan flutter create
4. Membuat Scaffold dengan AppBar
5. Memikirkan dan menulis kode untuk button dan style
6. Membuat _showSnackbar
7. Membuat interaksi button jika onPressed dengan _showSnackbar
8. Menambahkan padding dan sizedbox dan menulis kode widget
9. Mencoba dengan flutter run 
10. Mengubah warna dan ukuran-ukuran tertentu 
11. Mengecek bahwa sesuai dengan tugas
