import 'package:flutter/material.dart';
import 'package:mobile_smarcerti/widgets/list_pelatihan_dosen.dart';
import 'package:mobile_smarcerti/widgets/list_sertifikasi_dosen.dart';

class ListDaftarPelatihanSertifikasiBody extends StatelessWidget {
  const ListDaftarPelatihanSertifikasiBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabBarView(
        children: [ListPelatihanDosen(), ListSertifikasiDosen()]);
  }
}
