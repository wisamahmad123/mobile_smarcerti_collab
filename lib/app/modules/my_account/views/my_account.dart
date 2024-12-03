import 'package:flutter/material.dart';
import '../../../../widgets/app_bar_custom.dart'; // Custom AppBar
import '../../../../widgets/dosen_bottom_navbar.dart'; // BottomNavigationBar untuk dosen
import 'body_my_account_dosen.dart'; // Body dari profile dosen

class MyAccount extends StatelessWidget {
  const MyAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(title: 'My Account'), // AppBar yang dipisahkan
      body: BodyMyAccountDosen(), // Body yang dipisahkan
      // bottomNavigationBar: const DosenBottomNavbar(currentIndex: 1), // BottomNav yang dipisahkan
    );
  }
}
