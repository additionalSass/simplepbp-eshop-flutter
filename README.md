# simplepbp_eshop_flutter

A new Flutter project. Tugas 9

## Menjawab beberapa pertanyaan Tugas 9 berikut pada README.md pada root_folder.

### 1. Mengapa perlu membuat model dalam Flutter untuk pengambilan atau pengiriman data JSON?

Model dalam Flutter diperlukan untuk memetakan data JSON yang diterima dari server ke dalam struktur yang mudah diolah oleh aplikasi untuk menampilkannya di dalam list. Berikut alasannya:

Model dalam Flutter memastikan data memiliki struktur yang sama, dan mempermudah processing dan manipulasi data di Flutter. Dan dengan model, kita dapat memvalidasi apakah data yang diterima atau dikirimkan sesuai dengan tipe data yang diharapkan. Kemudian, model membantu memperjelas dalam source code konversi data antara format JSON dan objek Dart.

Jika tidak dilakukan pembuatan model, akan lebih rawan error dengan map Map<String, dynamic> dan kita harus mengakses data dengan key-string saat mau membaca list. Kemudian, tipe data yang berkaitan tidak bisa dengan mudah divalidasi.

### 2. Fungsi dari Library `http` dalam Tugas Ini
Library `http` digunakan untuk melakukan komunikasi HTTP, yaitu mengirimkan request dan menerima response dari server.

Fungsi dalam Konteks `pbp_django_auth`: Membuat Permintaan HTTP: Library `http` mendasari fungsi-fungsi yang ada di `pbp_django_auth`, seperti `login`, `logout`, dan `postJson`, misalnya ada bagian-bagian seperti `http.Response response` dan `import 'package:http/http.dart' as http;` yang dibutuhkan untuk pbp_django_auth. Library `http` ini memproses response untuk Client yang diterima dari server, mencakup  header, data JSON, status code.


### 3. Fungsi dari `CookieRequest`
`CookieRequest` adalah kelas yang digunakan oleh `pbp_django_auth` untuk menangani autentikasi berbasis cookie.
Fungsinya adalah menyimpan session cookie untuk autentikasi, mengelola login, dan menyertakan cookie saat request ke server aplikasi Django.

Cookie perlu dibagikan ke semua komponen supaya kita bisa memastikan bahwa ada state login yang diakses setiap widget dan semua komponen widget dapat menggunakan instance yang sama dan efisien dalam mempertahankan login.

### 4. Bagaimana Mekanisme Pengiriman Data dari Input hingga Ditampilkan pada Flutter?
1. Input Data di Flutter:
   - Pengguna mengisi form dari item_entry di Flutter (contoh field : name, price).
   - Data ini dikirim secara async melalui `onPressed` untuk tombol save menggunakan fungsi seperti `postJson` untuk `request`.

2. Pengiriman Data ke Django:
   - Flutter akan mengirimkan request HTTP POST dengan data JSON ke endpoint aplikasi web Django.
   - Endpoint Django membaca body request json tersebut dan menyimpan data Item ke database sesuai dengan kode dari fungsi views yang dipanggil sesuai dengan URL . 

3. Respon dari Backend:
   - Django akan mengirimkan response dalam format JSON (contoh: `{"status": "success", "message": "Item created successfully"}`).

4. Menampilkan di Flutter: 
   - Aplikasi Flutter membaca response JSON.
   - Data response di-map ke model Item dalam Dart, lalu ditampilkan menggunakan widget seperti `ListView`.

### 5. Mekanisme Autentikasi dari Login, Register, hingga Logout
1. Login:
   - Input Data: Pengguna memasukkan username dan password di Flutter.
   - Kirim ke Backend: Data dikirim melalui request POST ke endpoint Django `/auth/login/`.
   - Verifikasi di Django:
     - Django memeriksa apakah username dan password valid.
     - Jika valid, Django mengirimkan session cookie sebagai response.
   - Menyimpan Cookie: Flutter menyimpan cookie menggunakan `CookieRequest`.
   - Navigasi: Pengguna melihat halaman utama HomePage jika login berhasil.

2. Register:
   - Input Data: Pengguna mengisi data akun (username, password).
   - Kirim ke Backend: Data dikirim melalui request POST ke endpoint Django `/auth/register/`.
   - Simpan di Database: Django memvalidasi data dan menyimpan pengguna baru di database.
   - Response: Django mengirimkan status keberhasilan, dan Flutter menampilkan pesan kepada pengguna.

3. Logout:
   - Request Logout: Flutter mengirimkan request GET/POST ke endpoint Django `/auth/logout/`.
   - Hapus Session:** Django menghapus session cookie di server.
   - Navigasi: Flutter menghapus state login dan memindahkan pengguna ke halaman login.

---

### 6. Implementasi Checklist secara Step-by-Step 

1. Mempersiapkan Backend Django untuk Integrasi:
   - Menambahkan django-cors-headers  dan mengubah settings sesuai dengan Tutorial 
   - Membuat app baru di dalam project bernama `authentication` yang berisi views dan urls untuk login, logout, register secara khusus untuk aplikasi Flutter
   - Menambahkan views dan urls untuk menangani operasi CRUD Flutter (contoh: `create_item_entry_flutter`) di dalam app main.
   - Menyediakan endpoint-endpoint sangat sederhana di dalam Django.
   - Memastikan bahwa dusty-penguin-fasilkomui-750583cd.koyeb.app ada sebagai domain name.

2. Membuat Model di Flutter: 
   - Membuat kelas model Dart baru untuk data JSON (contoh: `Item`) berdasarkan model dalam Django.
   - Menambahkan fungsi untuk deserialisasi dan serialisasi.

3. Mengintegrasikan `pbp_django_auth`:
   - Menambahkan dependency `pbp_django_auth` di proyek Flutter.
   - Membuat `CookieRequest` dan melakukan sharing menggunakan `Provider` di dalam file-file yang ada.

4. Menambahkan Halaman Login dan Register, dan Mengubah Halaman Form:
   - Lihat tutorial
   - Secara umum, melibatkan penulisan fungsi `onPressed` untuk mengirim data ke backend menggunakan `CookieRequest` yang merupakan bagian dari `pbp_django_auth`.

5. Menambahkan Halaman Daftar Item:
   - Lihat tutorial
   - Melibatkan model Item dalam Dart, kita melakukan fetchItem. Dan membuat hasilnya menjadi instance dari Item dalam Dart dan menampilkannya di list. 
   
    Implementasi Fungsi `fetchItem` dalam Kode :
```dart
Future<List<Item>> fetchItem(CookieRequest request) async {
  final response = await request.get('https://dusty-penguin-fasilkomui-750583cd.koyeb.app/json/');
  var data = response;

  // Melakukan konversi data JSON menjadi objek Item
  List<Item> listItem = [];
  for (var d in data) {
    if (d != null) {
      listItem.add(Item.fromJson(d));
    }
  }
  return listItem;
}
```

6. Menangani Respon dari Backend:
   - Response JSON yang diterima backend Django bisa divalidasi.
   - Data yang relevan ditampilkan.

7. Deployment dan CORS:
   - Deploy repository Github di Koyeb
   - Menguji aplikasi dengan server Django yang dideploy (di Koyeb) dan memastikan CORS aman.

Dengan langkah-langkah ini, Tugas 9 selesai.

## Menjawab beberapa pertanyaan Tugas 8 berikut pada README.md pada root_folder.

### Apa kegunaan const di Flutter? Jelaskan apa keuntungan ketika menggunakan const pada kode Flutter. Kapan sebaiknya kita menggunakan const, dan kapan sebaiknya tidak digunakan?

Keyword const di Flutter adalah keyword di Dart (bahasa pemrograman yang digunakan oleh Flutter) yang digunakan untuk mendeklarasikan value tetap atau object yang tidak akan berubah setelah compiling. Ketika  widget atau objek ditandai sebagai const di dalam kode, Flutter akan membuat lebih optimal performa dari rendering dengan menghindari pembuatan ulang objek tersebut sebisa mungkin.

Keuntungan menggunakan const antara lain meningkatkan performa aplikasi, mengurangi konsumsi memori karena hanya dibuat sekali, menjamin kepada programmer dan user bahwa value dari object itu tidak akan berubah.

Kapan sebaiknya menggunakan const, yaitu saat kita tahu widget atau object tidak akan berubah setelah creation, misalnya ikon statis, text, atau theme yang tetap.

Kapan sebaiknya tidak menggunakan const, yaitu saat kita tahu widget atau object memerlukan perubahan dinamis setelah compiling karena ada interaksi pengguna atau data yang berubah selama runtime. 

Contoh penggunaan const:

```
appBarTheme: const AppBarTheme(
          backgroundColor: Colors.purple,
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          ),
``` 


### Jelaskan dan bandingkan penggunaan Column dan Row pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini!

Column dan Row adalah dua widget layout dasar di Flutter yang digunakan untuk menyusun widget lain secara vertikal (Column) atau horizontal (Row). Keduanya merupakan turunan dari widget Flex dan memiliki properti serupa untuk mengatur layout dari children. Perbedaannya orientasi Column vertikal (atas ke bawah) sedangkan orientasi Row horizontal (kiri ke kanan) sehingga Column biasanya digunakan untuk tampilan seperti form atau list dan Row untuk bar navigasi atau toolbar. 
Contoh implementasi Row: 
``` 
Row(
  children: <Widget>[
    Text('Item 1 di Row'),
    Text('Item 2 di Row'),
  ],
)
``` 
Contoh implementasi Column:
``` 
Column(
  children: <Widget>[
    Text('Item A di Column'),
    Text('Item B di Column'),
  ],
)
``` 

### Sebutkan apa saja elemen input yang kamu gunakan pada halaman form yang kamu buat pada tugas kali ini. Apakah terdapat elemen input Flutter lain yang tidak kamu gunakan pada tugas ini? Jelaskan!Elemen Input yang Digunakan: Pada halaman formulir tambah produk yang dibuat, berikut adalah elemen input yang digunakan:

TextFormField untuk Nama Product (name): Digunakan untuk memasukkan nama Product dengan validasi tidak boleh empty dan batasan panjang karakter maksimum.

TextFormField untuk Harga Product (price): Digunakan untuk memasukkan harga Product dengan validasi tidak boleh empty, harus berupa bilangan dan tidak negatif.

TextFormField untuk Deskripsi Product (description): Digunakan untuk memasukkan deskripsi Prodyct. Bersifat opsional.

TextFormField untuk Jumlah Product (amount): Digunakan untuk memasukkan jumlah produk tersisa dengan validasi tidak boleh empty, harus berupa bilangan dan tidak negatif.

Elemen Input Flutter Lain yang tidak Digunakan: Beberapa elemen input Flutter yang tidak digunakan dalam tugas ini antara lain: Checkbox dan CheckboxListTile yang dapat digunakan untuk memilih opsi boolean, seperti menandai Product sebagai tersedia atau tidak. Radio dan RadioListTile yang dapat digunakan untuk memilih satu opsi dari beberapa pilihan, seperti kategori produk. Switch dan SwitchListTile yang dapat digunakan untuk mengaktifkan atau menonaktifkan fitur tertentu, seperti menampilkan produk di halaman utama. DropdownButton dan DropdownMenuItem yang dapat digunakan untuk memilih opsi dari daftar dropdown, seperti memilih kategori atau merk produk. Slider yang dapat digunakan untuk memilih nilai numerik dalam rentang dibatasi tertentu, seperti menentukan persentase diskon sebuah penjualan Product.

Elemen-elemen tidak digunakan dalam konteks ini karena form Tambah Product ini memang sederhana dan tidak memerlukan informasi khusus, selain teks dan angka biasa. Selain itu, tugas ini juga tidak memerlkukan hal-hal tersebut.


### Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat?

Ada dua hal yang saya lakukan di sini.

Hal pertama, yaitu menggunakan ThemeData dan ColorScheme di dalam main.dart . Flutter menyediakan ThemeData yang dapat dikonfigurasi dengan ColorScheme untuk mengatur warna dasar aplikasi, termasuk warna primer, sekunder, dan lainnya. Menentukan warna primer (primary) dan sekunder (secondary) dan onPrimary (onPrimary) yang akan digunakan di seluruh aplikasi dilakukan untuk memastikan konsistensi warna di aplikasi.

Hal yang kedua adalah menggunakan AppBarTheme di dalam main.dart . AppBarTheme akan diaplikasikan ke semua AppBar yang terkait dengan menu.dart . Dalam konteks ini, AppBarTheme merupakan tema khusus untuk widget AppBar yang memastikan bahwa semua elemen UI AppBar  memiliki tampilan yang konsisten.

### Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?

Dalam tugas 8, saya menggunakan Navigator yang memungkinkan navigasi antar halaman (route) dalam aplikasi. Navigator dapat menambah (push) atau menghapus (pop) halaman dari stack navigasi. 

Sebagai contoh,
``` 
ListTile(
            leading: const Icon(Icons.add_shopping_cart),
            title: const Text('Tambah Product'),
            // Bagian redirection ke ProductFormPage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductFormPage(),
                  ));
            },
          ),
``` 
akan mendorong halaman aplikasi ke ProductFormPage() yang merupakan halaman form product jika ListTile di atas di-tap.

Ketika kita menggunakan pushReplacement, route saat ini di-remove, dan route baru ditambahkan. Hal ini berarti user tidak bisa kembali. 

Selain pushReplacement, ada Navigator.push. Dengan push , kita menambahkan route baru di atas stack Navigation saat ini sehingga user bisa menavigasi ke layar baru tanpa melupakan yang sebelumnya. Hal ini memperbolehkan user kembali ke layar sebelumnya dengan tombol back atau kembali.
