import 'package:flutter/material.dart';
import '../widgets/body_pengajuan_sertifikasi_dosen.dart';
import '../widgets/app_bar_custom.dart';       // Custom AppBar
import '../widgets/dosen_bottom_navbar.dart'; // BottomNavigationBar untuk dosen

class PengajuanSertifikasiDosen extends StatelessWidget {
  const PengajuanSertifikasiDosen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarCustom(title: 'Pengajuan Sertifikasi'), // AppBar yang dipisahkan
      body: BodyPengajuanSertifikasiDosen(),               // Body yang dipisahkan
      bottomNavigationBar: DosenBottomNavbar(currentIndex: -1), // BottomNav yang dipisahkan
    );
  }
}