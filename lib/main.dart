// main.dart
import 'package:flutter/material.dart';
import 'package:mobile_smarcerti/app/modules/auth/views/loading_screen.dart';
import 'package:get/get.dart';
import 'package:mobile_smarcerti/app/routes/app_pages.dart';

void main() {
  runApp(const MyApp());
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
