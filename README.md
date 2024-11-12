# simplepbp_eshop_flutter

A new Flutter project. Tugas 8

## Menjawab beberapa pertanyaan berikut pada README.md pada root_folder.


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
