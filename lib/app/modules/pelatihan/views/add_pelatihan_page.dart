// import 'package:flutter/material.dart';
// import 'package:mobile_smarcerti/app/modules/pelatihan/views/pelatihan_body.dart';
// import 'package:mobile_smarcerti/layouts/appbar_tabbar.dart';
// import 'package:mobile_smarcerti/widgets/pimpinan_bottom_nav_bar.dart';

// class ListDaftarPelatihanPage extends StatelessWidget {
//   const ListDaftarPelatihanPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const AppBarTabBar(title: 'Daftar Pelatihan'),
//       body: PelatihanBody(), // Panggil komponen PelatihanBody
//       bottomNavigationBar: const PimpinanBottomNavBar(currentIndex: -1),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:mobile_smarcerti/app/modules/pelatihan/bindings/pelatihan.dart';
import 'package:mobile_smarcerti/widgets/pimpinan_bottom_nav_bar.dart';
import 'package:mobile_smarcerti/app/modules/pelatihan/views/add_pelatihan.dart';


class AddPelatihanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Daftarkan binding secara manual jika belum terdaftar
    PelatihanBinding().dependencies();

    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Pelatihan')),
      body: ListAddPelatihan(),
      bottomNavigationBar: const PimpinanBottomNavBar(currentIndex: -1),
    );
  }
  
  
}