import 'package:flutter/material.dart';
import 'package:mobile_smarcerti/app/modules/sertifikasi/views/page/list_add_sertifikasi.dart';

class AddSertifikasiBody extends StatelessWidget {
  const AddSertifikasiBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body:  ListAddSertifikasi(), // Menampilkan ListSertifikasi sebagai body halaman
    );
  }
}