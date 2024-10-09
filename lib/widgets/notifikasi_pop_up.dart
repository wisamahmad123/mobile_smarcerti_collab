import 'package:flutter/material.dart';

class NotifikasiPopUp extends StatelessWidget {
  final String title;
  final String message;

  const NotifikasiPopUp({
    Key? key,
    required this.title,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: <Widget>[
        TextButton(
          child: const Text('Tutup'),
          onPressed: () {
            Navigator.of(context).pop(); // Menutup dialog
          },
        ),
      ],
    );
  }
}
