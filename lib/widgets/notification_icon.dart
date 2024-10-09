// widgets/notification_icon.dart
import 'package:flutter/material.dart';

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.notifications),
      iconSize: 35,
      onPressed: () {
        // fitur muncul notif
      },
      color: Colors.white,
    );
  }
}
