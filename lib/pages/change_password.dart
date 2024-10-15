import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/change_password_form.dart';
import '../widgets/pimpinan_bottom_nav_bar.dart';

class ChangePasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(), // Menggunakan widget AppBar terpisah
      body: AppBarProfile(), // Menggunakan widget Body terpisah
      bottomNavigationBar:
          PimpinanBottomNavBar(), // Menggunakan widget BottomNavigationBar terpisah
    );
  }
}
