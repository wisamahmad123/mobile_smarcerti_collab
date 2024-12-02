// main.dart
import 'package:flutter/material.dart';
import 'package:mobile_smarcerti/app/modules/auth/views/loading_screen.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mobile_smarcerti/app/routes/app_pages.dart';

void main() async {
  // Inisialisasi date formatting untuk lokal "id_ID"
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null);

  runApp(const MyApp()); // Ganti dengan widget utama aplikasi Anda
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login SmartCerTI',
      getPages: AppPages.routes,
      home: const LoadingScreen(), // Halaman pertama adalah Loadingscreen
    );
  }
}
