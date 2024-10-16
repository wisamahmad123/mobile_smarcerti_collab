import 'package:flutter/material.dart';
import 'package:mobile_smarcerti/widgets/sertifikasi_all.dart';
import 'package:mobile_smarcerti/widgets/sertifikasi_status.dart';

class SertifikasiBody extends StatelessWidget {
  const SertifikasiBody({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBarView(children: [SertifikasiAll(), SertifikasiStatus()]);
  }
}
