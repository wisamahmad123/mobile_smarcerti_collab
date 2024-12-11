import 'package:flutter/material.dart';
import 'package:mobile_smarcerti/widgets/pimpinan_bottom_nav_bar.dart';
import '../widgets/app_bar_profile.dart';       // Custom AppBar
import '../widgets/dosen_bottom_navbar.dart'; // BottomNavigationBar untuk dosen
import '../app/modules/profile/views/body_profile.dart';

class ProfileDosen extends StatelessWidget {
  const ProfileDosen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarProfile(title: 'Profile'), // AppBar yang dipisahkan
      body: BodyProfile(),               // Body yang dipisahkan
      bottomNavigationBar:  PimpinanBottomNavBar(currentIndex: 1), // BottomNav yang dipisahkan
    );
  }
}
