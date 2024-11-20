import 'package:flutter/material.dart';
import '../../../../widgets/custom_app_bar.dart';
import '../../../../widgets/pimpinan_bottom_nav_bar.dart';
import 'home_body.dart';

class HomePimpinan extends StatelessWidget {
  const HomePimpinan({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  CustomAppBar(),
      body:  HomeBody(role: 'pimpinan'),
      bottomNavigationBar: PimpinanBottomNavBar(currentIndex: 0),
    );
  }
}
