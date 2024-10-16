import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/dosen_bottom_navbar.dart';
import '../widgets/change_password_form.dart';

class ChangeProfileScreen extends StatelessWidget {
  const ChangeProfileScreen({super.key}); // Tambahkan const constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarProfile(), // Menggunakan const jika memungkinkan
      body: const ChangePassword(), // Menggunakan const jika memungkinkan
      bottomNavigationBar: const DosenBottomNavbar(
        currentIndex: 1, // Tambahkan currentIndex yang statis
      ), // Menggunakan const jika memungkinkan
    );
  }
}
