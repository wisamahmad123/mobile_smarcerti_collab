import 'package:flutter/material.dart';
import '../widgets/body_upload_sertifikasi_dosen.dart';
import '../widgets/app_bar_custom.dart';       
import '../widgets/dosen_bottom_navbar.dart'; 

class UploadSertifikasiDosen extends StatelessWidget {
  const UploadSertifikasiDosen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarCustom(title: 'Tambah Sertifikasi'), 
      body: BodyUploadSertifikasiDosen(),               
      bottomNavigationBar: DosenBottomNavbar(currentIndex: -1), 
    );
  }
}