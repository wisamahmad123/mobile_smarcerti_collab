import 'package:flutter/material.dart';
import 'package:mobile_smarcerti/app/modules/sertifikasi/views/page/list_sertifikasi_detail.dart';

class DetailSertifikasiBody extends StatelessWidget {
  final int idSertifikasi;  // Tambahkan idSertifikasi sebagai parameter

  const DetailSertifikasiBody({super.key, required this.idSertifikasi});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListSertifikasiDetail(idSertifikasi: idSertifikasi),  // Pass idSertifikasi ke constructor
    );
  }
}
