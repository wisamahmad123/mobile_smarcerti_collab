import 'package:flutter/material.dart';
import 'package:mobile_smarcerti/widgets/app_bar_custom.dart';
import 'package:mobile_smarcerti/widgets/upload_bukti_pelatihan_body.dart';

class UploadBuktiPelatihanPage extends StatelessWidget {
  const UploadBuktiPelatihanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBarCustom(title: 'Form Bukti Pelatihan'),
      body: UploadBuktiPelatihanBody(),
    );
  }
}
