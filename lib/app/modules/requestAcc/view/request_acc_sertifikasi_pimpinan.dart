import 'package:flutter/material.dart';
import 'pelatihan/tab_pelatihan.dart';
import 'sertifikasi/tab_sertifikasi.dart';

class BodyListRequest extends StatelessWidget {
  const BodyListRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return  TabBarView(
        children: [TabPelatihan(), TabSertifikasi()]);
  }
}
