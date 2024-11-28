import 'package:flutter/material.dart';
import 'package:mobile_smarcerti/app/modules/sertifikasi/views/add_sertifikasi_body.dart';
import 'package:mobile_smarcerti/widgets/app_bar_custom.dart';
import 'package:mobile_smarcerti/widgets/dosen_bottom_navbar.dart';
import 'package:mobile_smarcerti/app/modules/sertifikasi/views/sertifikasi_body.dart';


class AddSertifikasiPage extends StatelessWidget {
  const AddSertifikasiPage({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarCustom(title: 'Tambah Sertifikasi'),
        body: AddSertifikasiBody(),
        bottomNavigationBar: DosenBottomNavbar(currentIndex: -1),
      );
  }
}