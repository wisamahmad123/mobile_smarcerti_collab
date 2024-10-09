// widgets/custom_app_bar.dart
import 'package:flutter/material.dart';
import 'notifikasi_pop_up.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('''  Hi, Wisam! 
  Welcome to SmartCerTI'''),
      titleTextStyle: const TextStyle(
        fontFamily: 'Ramabhadra',
        fontSize: 25.0,
        color: Colors.white,
      ),
      backgroundColor: const Color.fromARGB(255, 239, 84, 40),
      toolbarHeight: 170,
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications),
          iconSize: 35,
          onPressed: () {
            // Tampilkan NotificationDialog
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return const NotifikasiPopUp(
                  title: 'Notifikasi',
                  message: 'popup notif',
                );
              },
            );
          },
          color: Colors.white,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(170);
}
//HALOOdvdbddn