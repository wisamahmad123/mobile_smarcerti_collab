import 'package:flutter/material.dart';
import 'package:mobile_smarcerti/widgets/pimpinan_bottom_nav_bar.dart';
import '../widgets/body_pengajuan_sertifikasi_pimpinan.dart';
import '../widgets/app_bar_custom.dart'; // Custom AppBar
import '../widgets/pimpinan_bottom_nav_bar.dart'; // BottomNavigationBar untuk pimpinan

class PengajuanSertifikasiDosen extends StatelessWidget {
  const PengajuanSertifikasiDosen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarCustom(
          title: 'Pengajuan Sertifikasi'), // AppBar yang dipisahkan
      body: BodyPengajuanSertifikasiPimpinan(), // Body yang dipisahkan
      bottomNavigationBar:
          PimpinanBottomNavBar(currentIndex: -1), // BottomNav yang dipisahkan
    );
  }
}
