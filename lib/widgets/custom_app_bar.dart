// widgets/custom_app_bar.dart
import 'package:flutter/material.dart';
import 'package:mobile_smarcerti/pages/list_notifikasi.dart';

// import 'notifikasi_pop_up.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('''  Hi, Nama! 
  Welcome to SmartCerTI'''),
      titleTextStyle: const TextStyle(
        fontFamily: 'Ramabhadra',
        fontSize: 25.0,
        color: Colors.white,
      ),
      backgroundColor: const Color.fromARGB(255, 239, 84, 40),
      toolbarHeight: 170,
      actions: [
        IconButton(
          padding: EdgeInsets.only(bottom: 100),
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
