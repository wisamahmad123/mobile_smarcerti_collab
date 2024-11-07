import 'package:flutter/material.dart';

class AppBarTabBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Tab> tabs;

  const AppBarTabBar({Key? key, required this.title, required this.tabs}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(125); // Menyesuaikan tinggi AppBar dengan TabBar

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 125,
      centerTitle: true,
      backgroundColor: const Color(0xFFEF5428),
      automaticallyImplyLeading: false,
      title: Text(
              title,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),     
      bottom: TabBar(
        tabs: tabs,
        indicator: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.white, width: 2),
          ),
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding: const EdgeInsets.only(bottom: 3),
        labelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: Colors.white,
        ),
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 16,
          color: Colors.white70,
        ),
      ),
    );
  }
}
