import 'package:flutter/material.dart';
import 'package:mobile_smarcerti/widgets/app_bar_custom.dart';
import 'package:mobile_smarcerti/widgets/upload_pelatihan_body.dart';

class UploadPelatihanPage extends StatelessWidget {
  const UploadPelatihanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarCustom(
        title: "Upload Pelatihan",
      ),
      body: UploadPelatihanBody(),
    );
  }
}
