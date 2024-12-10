import 'package:flutter/material.dart';
import 'package:mobile_smarcerti/app/modules/sertifikasi/views/add_bukti_body.dart';
import 'package:mobile_smarcerti/app/modules/sertifikasi/views/detail_sertifikasi_body.dart';
import 'package:mobile_smarcerti/widgets/app_bar_custom.dart';
import 'package:mobile_smarcerti/widgets/dosen_bottom_navbar.dart';


class AddBuktiPage extends StatelessWidget {
  final int idSertifikasi; // Menambahkan idSertifikasi sebagai parameter

  const AddBuktiPage({super.key, required this.idSertifikasi});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(title: 'Upload Bukti Sertifikasi'),
      body: AddBuktiBody(idSertifikasi: idSertifikasi), // Mengirimkan idSertifikasi
      bottomNavigationBar: DosenBottomNavbar(currentIndex: -1),
    );
  }
}