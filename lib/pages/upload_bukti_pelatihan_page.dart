import 'package:flutter/material.dart';
import 'package:mobile_smarcerti/layouts/app_bar_back_button.dart';
import 'package:mobile_smarcerti/widgets/upload_bukti_pelatihan_body.dart';

class UploadBuktiPelatihanPage extends StatelessWidget {
  const UploadBuktiPelatihanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBackButton(),
      body: UploadBuktiPelatihanBody(),
    );
  }
}
