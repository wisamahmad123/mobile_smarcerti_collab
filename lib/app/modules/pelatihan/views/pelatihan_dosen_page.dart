import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_smarcerti/app/modules/pelatihan/views/list_pelatihan.dart';
import 'package:mobile_smarcerti/app/modules/pelatihan/bindings/pelatihan.dart';
import 'package:mobile_smarcerti/widgets/dosen_bottom_navbar.dart';
import 'package:mobile_smarcerti/widgets/pimpinan_bottom_nav_bar.dart';

class PelatihanDosenPage extends StatelessWidget {
  const PelatihanDosenPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Pelatihan')),
      body: ListPelatihan(),
      bottomNavigationBar: const DosenBottomNavbar(currentIndex: -1),
    );
  }
  
  
}