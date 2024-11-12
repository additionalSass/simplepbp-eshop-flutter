import 'package:flutter/material.dart';
import 'package:simplepbp_eshop_flutter/screens/product_form.dart';
import 'package:simplepbp_eshop_flutter/widgets/left_drawer.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  void _showSnackbar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: Duration(seconds: 4),
    );
    var currMessenger = ScaffoldMessenger.of(context);
    currMessenger.removeCurrentSnackBar();
    currMessenger.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      minimumSize: Size(40, 40),
      textStyle: TextStyle(fontSize: 16),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Simple PBP E-Shop Homepage',
        ),
      ),
      drawer: const LeftDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Button 1 untuk Lihat Daftar Produk
            ElevatedButton.icon(
              style: buttonStyle.copyWith(
                backgroundColor:
                    WidgetStateProperty.all<Color>(Colors.lightBlueAccent),
              ),
              icon: Icon(Icons.view_list),
              label: Text('Lihat Daftar Produk'),
              onPressed: () {
                _showSnackbar(
                    context, 'Kamu telah menekan tombol Lihat Daftar Produk');
              },
            ),
            SizedBox(width: 25), // Spacing dari kedua button

            // Button 2 untuk Tambah Product
            ElevatedButton.icon(
              style: buttonStyle.copyWith(
                backgroundColor:
                    WidgetStateProperty.all<Color>(Colors.lightGreenAccent),
              ),
              icon: Icon(Icons.add_shopping_cart),
              label: Text('Tambah Product'),
              // Bagian redirection ke ProductFormPage
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductFormPage(),
                    ));
              },
            ),
            SizedBox(width: 25),

            // Button 3 untuk Logout
            ElevatedButton.icon(
              style: buttonStyle.copyWith(
                backgroundColor:
                    WidgetStateProperty.all<Color>(Colors.redAccent),
              ),
              icon: Icon(Icons.logout),
              label: Text('Logout'),
              onPressed: () {
                _showSnackbar(context, 'Kamu telah menekan tombol Logout');
              },
            ),
          ],
        ),
      ),
    );
  }
}
