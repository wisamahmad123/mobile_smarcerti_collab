import 'package:flutter/material.dart';
import 'package:mobile_smarcerti/widgets/body_up_bukti_sertifikasi_dosen.dart';
import 'package:mobile_smarcerti/widgets/pimpinan_bottom_nav_bar.dart';
import '../widgets/app_bar_custom.dart';       // Custom AppBar
import '../widgets/dosen_bottom_navbar.dart'; // BottomNavigationBar untuk dosen

class UpBuktiSertifikasiDosen extends StatelessWidget {
  const UpBuktiSertifikasiDosen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(title: 'Form Bukti Sertifikasi'), // AppBar yang dipisahkan
      body: BodyUpBuktiSertifikasiDosen(),               // Body yang dipisahkan
      bottomNavigationBar: PimpinanBottomNavBar(currentIndex: -1), // BottomNav yang dipisahkan
    );
  }
}