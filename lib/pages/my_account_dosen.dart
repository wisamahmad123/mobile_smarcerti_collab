import 'package:flutter/material.dart';
import '../widgets/app_bar_custom.dart'; // Custom AppBar
import '../widgets/dosen_bottom_navbar.dart'; // BottomNavigationBar untuk dosen
import '../widgets/body_my_account_dosen.dart'; // Body dari profile dosen

class MyAccountDosen extends StatelessWidget {
  const MyAccountDosen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarCustom(title: 'My Account'), // AppBar yang dipisahkan
      body: BodyMyAccountDosen(),               // Body yang dipisahkan
      bottomNavigationBar: DosenBottomNavbar(currentIndex: 1), // BottomNav yang dipisahkan
    );
  }
}
