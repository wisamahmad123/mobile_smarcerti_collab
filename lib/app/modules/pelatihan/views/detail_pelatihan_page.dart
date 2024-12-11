import 'package:flutter/material.dart';
import 'package:mobile_smarcerti/widgets/app_bar_custom.dart';
import 'package:mobile_smarcerti/app/modules/pelatihan/views/list_pelatihan_detail.dart';
import 'package:mobile_smarcerti/widgets/dosen_bottom_navbar.dart';
import 'package:mobile_smarcerti/widgets/pimpinan_bottom_nav_bar.dart';

class DetailPelatihanPage extends StatelessWidget {
  final int idPelatihan; // Menambahkan idPelatihan sebagai parameter

  const DetailPelatihanPage({super.key, required this.idPelatihan});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(title: 'Detail Pelatihan'),
      body: ListPelatihanDetail(idPelatihan: idPelatihan), // Mengirimkan idSertifikasi
      bottomNavigationBar: PimpinanBottomNavBar(currentIndex: -1),
    );
    
  }
}
