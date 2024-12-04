import 'package:flutter/material.dart';
import 'package:mobile_smarcerti/app/modules/sertifikasi/views/page/list_add_bukti.dart';
import 'package:mobile_smarcerti/app/modules/sertifikasi/views/page/list_sertifikasi_detail.dart';

class AddBuktiBody extends StatelessWidget {
  final int idSertifikasi;  // Tambahkan idSertifikasi sebagai parameter

  const AddBuktiBody({super.key, required this.idSertifikasi});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListAddBukti(idSertifikasi: idSertifikasi),  // Pass idSertifikasi ke constructor
    );
  }
}
