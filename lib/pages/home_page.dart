import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/pimpinan_bottom_nav_bar.dart';
import '../widgets/home_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar:  CustomAppBar(),
      body:  HomeBody(),
      bottomNavigationBar: PimpinanBottomNavBar(),
    );
  }
}
