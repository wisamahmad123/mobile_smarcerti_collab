import 'package:flutter/material.dart';
import 'package:mobile_smarcerti/app/modules/sertifikasi/views/detail_sertifikasi_body.dart';
import 'package:mobile_smarcerti/widgets/app_bar_custom.dart';
import 'package:mobile_smarcerti/widgets/dosen_bottom_navbar.dart';


class DetailSertifikasiPage extends StatelessWidget {
  final int idSertifikasi; // Menambahkan idSertifikasi sebagai parameter

  const DetailSertifikasiPage({super.key, required this.idSertifikasi});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(title: 'Detail Sertifikasi'),
      body: DetailSertifikasiBody(idSertifikasi: idSertifikasi), // Mengirimkan idSertifikasi
      bottomNavigationBar: DosenBottomNavbar(currentIndex: -1),
    );
  }
}

