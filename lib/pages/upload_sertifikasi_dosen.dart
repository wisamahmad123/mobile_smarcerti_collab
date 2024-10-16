import 'package:flutter/material.dart';
import '../widgets/body_upload_sertifikasi_dosen.dart';
import '../widgets/app_bar_custom.dart';       // Custom AppBar
import '../widgets/dosen_bottom_navbar.dart'; // BottomNavigationBar untuk dosen

class UploadSertifikasiDosen extends StatelessWidget {
  const UploadSertifikasiDosen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarCustom(title: 'Upload Sertifikasi'), // AppBar yang dipisahkan
      body: BodyUploadSertifikasiDosen(),               // Body yang dipisahkan
      bottomNavigationBar: DosenBottomNavbar(currentIndex: -1), // BottomNav yang dipisahkan
    );
  }
}