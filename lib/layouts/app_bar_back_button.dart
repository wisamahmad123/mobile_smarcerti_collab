import 'package:flutter/material.dart';
// import 'package:mobile_smarcerti/pages/home_page.dart';

class AppBarBackButton extends StatelessWidget implements PreferredSizeWidget {
  const AppBarBackButton({super.key});
  static const String namaTitle = "";

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 75,
      title: Container(
        child: Text(
          namaTitle,
          style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 22.0,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
        // color: Colors.amber,
      ),
      titleSpacing: 0,
      backgroundColor: Color.fromARGB(255, 239, 84, 40),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(75);
}
