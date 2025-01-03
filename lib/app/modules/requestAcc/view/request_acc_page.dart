import 'package:flutter/material.dart';
import 'package:mobile_smarcerti/app/modules/requestAcc/view/request_acc_sertifikasi_pimpinan.dart';
import '../../../../widgets/appbar_tabbar.dart'; // Pastikan path file ini sesuai dengan lokasi file AppBarTabBar
import '../../../../widgets/pimpinan_bottom_nav_bar.dart'; // BottomNavigationBar untuk dosen
import 'pelatihan/tab_pelatihan.dart'; // Widget untuk konten tab Pelatihan
import 'sertifikasi/tab_sertifikasi.dart'; // Widget untuk konten tab Sertifikasi

class RequestPimpinan extends StatelessWidget {
  const RequestPimpinan({super.key});

  static const List<Tab> myTabs = [
    Tab(text: "Pelatihan"),
    Tab(text: "Sertifikasi"),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length, // Jumlah tab
      child:  Scaffold(
        appBar: AppBarTabBar(
          title: 'Daftar Pengajuan ',
          tabs: myTabs, // Mengirimkan daftar tab ke AppBarTabBar
        ),
        body: BodyListRequest(),
        bottomNavigationBar: PimpinanBottomNavBar(
            currentIndex: -1), // BottomNav yang dipisahkan
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import '../widgets/body_list_request.dart';

// class ListRequestPimpinan extends StatelessWidget {
//   const ListRequestPimpinan({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text("Daftar Pelatihan & Sertifikasi"),
//           backgroundColor: Colors.orange,
//           bottom: const TabBar(
//             indicatorColor: Colors.white,
//             tabs: [
//               Tab(text: "Pelatihan"),
//               Tab(text: "Sertifikasi"),
//             ],
//           ),
//         ),
//         body: const BodyListRequest(), // Memanggil widget BodyListRequest
//       ),
//     );
//   }
// }
