import 'package:flutter/material.dart';
import 'package:mobile_smarcerti/app/modules/pelatihan/views/list_add_bukti.dart';
import 'package:mobile_smarcerti/widgets/app_bar_custom.dart';
import 'package:mobile_smarcerti/widgets/pimpinan_bottom_nav_bar.dart';


class AddBuktiPage extends StatelessWidget {
  final int idPelatihan; // Menambahkan idSertifikasi sebagai parameter

  const AddBuktiPage({super.key, required this.idPelatihan});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(title: 'Upload Bukti Pelatihan'),
      body: ListAddBukti(idPelatihan: idPelatihan),// Mengirimkan idSertifikasi
      bottomNavigationBar: PimpinanBottomNavBar(currentIndex: -1),
    );
  }
}