import 'package:flutter/material.dart';
import 'package:mobile_smarcerti/pages/List_daftar_pelatihan_sertifikasi_page.dart';
import 'package:mobile_smarcerti/pages/sertifikasi_page.dart';

class AppBarTabBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;

  const AppBarTabBar({Key? key, required this.title})
: super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(125);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: const Color.fromARGB(255, 239, 84, 40),
      automaticallyImplyLeading: false, 
      title: Row(
        children: [
          IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 20.0,
            ),
            onPressed: () {
              Navigator.pop(context); // Navigate back to the previous page
            },
          ),
          // Move the title closer to the back button using Transform.translate
          Transform.translate(
            offset: const Offset(-15, 0), // Adjust the value to move text closer to the icon
            child: Text(
              title, // Use dynamic title text here
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
        ),
  
        bottom: TabBar(
          tabs: ListDaftarPelatihanSertifikasiPage.myTab,
          indicator: const BoxDecoration(
              // borderRadius: BorderRadius.vertical(),
              border:
                  Border(bottom: BorderSide(color: Colors.white, width: 2))),
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorPadding: const EdgeInsets.only(bottom: 3),
          labelStyle: const TextStyle(
            fontSize: 22, color: Colors.white),
          unselectedLabelStyle: const TextStyle(
            fontSize: 22, color: Colors.white),
        ));
  }
}
