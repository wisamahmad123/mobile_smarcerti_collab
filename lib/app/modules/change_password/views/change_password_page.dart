import 'package:flutter/material.dart';
import 'package:mobile_smarcerti/widgets/app_bar_custom.dart';
import '../../../../widgets/dosen_bottom_navbar.dart';
import 'change_password_form.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key}); // Tambahkan const constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        title: "Change Password",
      ),
      body: ChangePassword(), // Menggunakan const jika memungkinkan
      // bottomNavigationBar: const DosenBottomNavbar(
      //   currentIndex: 1, // Tambahkan currentIndex yang statis
      // ), // Menggunakan const jika memungkinkan
    );
  }
}
