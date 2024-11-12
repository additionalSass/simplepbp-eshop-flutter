import 'package:flutter/material.dart';
import 'package:simplepbp_eshop_flutter/screens/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple PBP E-Commerce App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
          primary: Colors.purple,
          secondary: const Color.fromARGB(255, 255, 7, 238),
          onPrimary: Colors.white,
          onSecondary: const Color.fromARGB(255, 91, 91, 91),
        ),
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
      ),
      home: HomePage(),
    );
  }
}
