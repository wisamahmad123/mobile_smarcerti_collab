import 'package:flutter/material.dart';
import 'package:mobile_smarcerti/widgets/app_bar_custom.dart';
import 'package:mobile_smarcerti/app/modules/change_profile/views/change_profile.dart';
import '../../../../widgets/dosen_bottom_navbar.dart';
import '../../../../widgets/change_password_form.dart';

class ChangeProfilePage extends StatelessWidget {
  const ChangeProfilePage({super.key}); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        title: "Change Profile",
      ),
      body: ChangeProfileScreen(), 
      bottomNavigationBar: const DosenBottomNavbar(
        currentIndex: 1, 
      ),
    );
  }
}
