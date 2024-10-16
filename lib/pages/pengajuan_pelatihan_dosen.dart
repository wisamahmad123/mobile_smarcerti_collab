import 'package:flutter/material.dart';
import '../widgets/body_pengajuan_pelatihan_dosen.dart';
import '../widgets/app_bar_custom.dart';       // Custom AppBar
import '../widgets/dosen_bottom_navbar.dart'; // BottomNavigationBar untuk dosen

class PengajuanPelatihanDosen extends StatelessWidget {
  const PengajuanPelatihanDosen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarCustom(title: 'Pengajuan Pelatihan'), // AppBar yang dipisahkan
      body: BodyPengajuanPelatihanDosen(),               // Body yang dipisahkan
      bottomNavigationBar: DosenBottomNavbar(currentIndex: -1), // BottomNav yang dipisahkan
    );
  }
}