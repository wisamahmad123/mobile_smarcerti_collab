import 'package:flutter/material.dart';
import 'package:mobile_smarcerti/pages/home_page.dart';

class AppBarBackButton extends StatelessWidget implements PreferredSizeWidget {
  const AppBarBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 75,
      leading: Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
          color: Colors.white,
        ),
      ),
      leadingWidth: 35,
      title: Container(
        child: Text(
          "List Notifikasi",
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
