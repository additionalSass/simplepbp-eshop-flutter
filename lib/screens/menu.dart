import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:simplepbp_eshop_flutter/screens/product_form.dart';
import 'package:simplepbp_eshop_flutter/screens/list_itementry.dart';
import 'package:simplepbp_eshop_flutter/screens/login.dart';
import 'package:simplepbp_eshop_flutter/widgets/left_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  void _showSnackbar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 4),
    );
    var currMessenger = ScaffoldMessenger.of(context);
    currMessenger.removeCurrentSnackBar();
    currMessenger.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      minimumSize: const Size(40, 40),
      textStyle: const TextStyle(fontSize: 16),
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
              icon: const Icon(Icons.view_list),
              label: const Text('Lihat Daftar Produk'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ItemEntryPage(),
                    ));
              },
            ),
            const SizedBox(width: 25), // Spacing dari kedua button

            // Button 2 untuk Tambah Product
            ElevatedButton.icon(
              style: buttonStyle.copyWith(
                backgroundColor:
                    WidgetStateProperty.all<Color>(Colors.lightGreenAccent),
              ),
              icon: const Icon(Icons.add_shopping_cart),
              label: const Text('Tambah Product'),
              // Bagian redirection ke ProductFormPage
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProductFormPage(),
                    ));
              },
            ),
            const SizedBox(width: 25),

            // Button 3 untuk Logout
            ElevatedButton.icon(
              style: buttonStyle.copyWith(
                backgroundColor:
                    WidgetStateProperty.all<Color>(Colors.redAccent),
              ),
              icon: const Icon(Icons.logout),
              label: const Text('Logout'),
              onPressed: () async {
                await request.logout(
                    "https://dusty-penguin-fasilkomui-750583cd.koyeb.app/auth/logout/");

                if (!request.loggedIn) {
                  // Redirect to Login Page
                  if (context.mounted) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                      (route) => false,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('You have been logged out.')),
                    );
                  }
                } else {
                  // Handle Logout Error (optional)
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Failed to log out.')),
                    );
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
