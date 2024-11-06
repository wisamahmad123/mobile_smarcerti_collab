import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const AppBarCustom({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 239, 84, 40),
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 20.0,
            ),
            onPressed: () {
              Navigator.pop(context); // Navigate back to the previous page
            },
          ),
          // Move the title closer to the back button using Transform.translate
          Transform.translate(
            offset: const Offset(
                -5, 0), // Adjust the value to move text closer to the icon
            child: Text(
              title, // Use dynamic title text here
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight); // Default AppBar height
}
