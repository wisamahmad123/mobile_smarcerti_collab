import 'package:flutter/material.dart';
import 'package:mobile_smarcerti/widgets/app_bar_custom.dart';
import 'package:mobile_smarcerti/widgets/dosen_bottom_navbar.dart';
import 'package:mobile_smarcerti/app/modules/sertifikasi/views/sertifikasi_body.dart';

class DaftarSertifikasiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
          title: 'Daftar Sertifikasi'), 
      body: SertifikasiBody(),
      bottomNavigationBar: DosenBottomNavbar(currentIndex: -1),
    );
  }
}