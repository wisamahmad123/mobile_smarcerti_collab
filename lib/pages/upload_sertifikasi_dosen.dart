import 'package:flutter/material.dart';
import 'package:mobile_smarcerti/widgets/pimpinan_bottom_nav_bar.dart';
import '../widgets/body_upload_sertifikasi_dosen.dart';
import '../widgets/app_bar_custom.dart';       
import '../widgets/dosen_bottom_navbar.dart'; 

class UploadSertifikasiDosen extends StatelessWidget {
  const UploadSertifikasiDosen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(title: 'Tambah Sertifikasi'), 
      body: BodyUploadSertifikasiDosen(),               
      bottomNavigationBar: PimpinanBottomNavBar(currentIndex: -1), 
    );
  }
}