import 'package:flutter/material.dart';
import 'package:mobile_smarcerti/widgets/pelatihan_all.dart';
import 'package:mobile_smarcerti/widgets/pelatihan_status.dart';

class PelatihanBody extends StatelessWidget {
  const PelatihanBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabBarView(children: [PelatihanAll(), PelatihanStatus()]);
  }
}
