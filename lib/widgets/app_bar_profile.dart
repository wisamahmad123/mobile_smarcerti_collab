import 'package:flutter/material.dart';
import 'package:mobile_smarcerti/pages/list_notifikasi.dart';

class AppBarProfile extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const AppBarProfile({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 239, 84, 40),
      automaticallyImplyLeading: false, // Disable back button
      title: Padding(
        padding: const EdgeInsets.only(bottom: 1), // Adjust padding to lower the text
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,          // White text color
            fontSize: 22,                 // Font size (unchanged)
            fontWeight: FontWeight.bold,  // Font weight
            fontFamily: 'Poppins',        // Custom font family (if available)
            letterSpacing: 1.2,           // Optional: Adjust letter spacing
          ),
        ),
      ),
      centerTitle: true, // Center the title
      actions: [
        IconButton(
          padding: EdgeInsets.only(bottom: 100),
          icon: const Icon(Icons.notifications, color: Colors.white),
          iconSize: 30,
           onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ListNotifikasi()),
            );// Handle notification icon press
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60); // Reduced height of the AppBar
}
