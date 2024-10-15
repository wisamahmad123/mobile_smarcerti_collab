// main.dart
import 'package:flutter/material.dart';
import 'package:mobile_smarcerti/pages/LoadingScreen.dart';
import 'pages/login_page.dart'; // Import halaman LoginPage

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Pemimpin',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoadingScreen(), // Halaman pertama adalah Loadingscreen
    );
  }
}
