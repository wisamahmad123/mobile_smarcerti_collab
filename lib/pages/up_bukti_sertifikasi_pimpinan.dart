import 'package:flutter/material.dart';
import 'package:mobile_smarcerti/widgets/pimpinan_bottom_nav_bar.dart';
import '../widgets/body_up_sertifikasi_pimpinan.dart';
import '../widgets/app_bar_custom.dart'; // Custom AppBar

class PengajuanSertifikasiDosen extends StatelessWidget {
  const PengajuanSertifikasiDosen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBarCustom(
          title: 'Form Bukti Sertifikasi'), // AppBar yang dipisahkan
      body: BodyUpSertifikasiPimpinan(), // Body yang dipisahkan
      bottomNavigationBar:
          PimpinanBottomNavBar(currentIndex: -1), // BottomNav yang dipisahkan
    );
  }
}



