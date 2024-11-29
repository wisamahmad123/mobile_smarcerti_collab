// widgets/custom_app_bar.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_smarcerti/app/hooks/use_auth.dart';
import 'package:mobile_smarcerti/app/modules/home/controllers/home_controller.dart';
import 'package:mobile_smarcerti/app/modules/my_account/controllers/my_account_controller.dart';

import 'package:mobile_smarcerti/pages/list_notifikasi.dart';

// import 'notifikasi_pop_up.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({super.key});
  final MyAccountController controller = Get.put((MyAccountController()));

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Obx(() {
        if (controller.myAccounts.isEmpty) {
          return const Text(
            'Loading...',
            style: const TextStyle(
              fontFamily: 'Ramabhadra',
              fontSize: 20.0,
              color: Colors.white,
            ),
          );
        } else {
          var account = controller.myAccounts.first;
          return Row(
            children: [
              Flexible(
                child: Text(
                  'Hi, ${account.namaLengkap}!',
                  style: const TextStyle(
                    fontFamily: 'Ramabhadra',
                    fontSize: 24.0,
                    color: Colors.white,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          );
        }
      }),
      backgroundColor: const Color.fromARGB(255, 239, 84, 40),
      toolbarHeight: 170,
      actions: [
        IconButton(
          padding: const EdgeInsets.only(bottom: 100),
          icon: const Icon(Icons.notifications),
          iconSize: 35,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ListNotifikasi()),
            );
          },
          color: Colors.white,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(170);
}

// class AppBarProfile extends StatelessWidget implements PreferredSizeWidget {
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       backgroundColor: Color(0xFFEF5428), // Warna oranye khusus
//       title: Text(
//         'Change Password',
//         style: TextStyle(
//           fontFamily: 'Poppins', // Menggunakan font Poppins
//           fontSize: 20,
//           color: Colors.white,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       centerTitle: true, // Memastikan judul berada di tengah
//       leading: IconButton(
//         icon: Icon(Icons.arrow_back_ios_new), // Panah di kiri
//         color: Colors.white,
//         onPressed: () {
//           // Aksi ketika tombol kembali ditekan
//         },
//       ),
//     );
//   }

//   @override
//   Size get preferredSize => Size.fromHeight(kToolbarHeight);
// }

class AppBarProfile extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFFEF5428), // Warna oranye khusus
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start, // Menyusun judul di kiri
        children: [
          Text(
            'Change Password',
            style: TextStyle(
              fontFamily: 'Poppins', // Menggunakan font Poppins
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      centerTitle: false, // Mengatur centerTitle menjadi false
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios_new), // Panah di kiri
        color: Colors.white,
        onPressed: () {
          Navigator.pop(context); // Kembali ke halaman sebelumnya
        },
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
