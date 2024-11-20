import 'package:flutter/material.dart';
import 'package:mobile_smarcerti/app/modules/list_pelatihan_sertifikasi/views/pelatihan/page/list_pelatihan_dosen.dart';
import 'package:mobile_smarcerti/app/modules/list_pelatihan_sertifikasi/views/sertifikasi/page/list_sertifikasi_dosen.dart';

class ListDaftarPelatihanSertifikasiBody extends StatelessWidget {
  const ListDaftarPelatihanSertifikasiBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  TabBarView(
        children: [ListPelatihanDosen(), ListSertifikasiDosen()]);
  }
}
