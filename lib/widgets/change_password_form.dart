import 'package:flutter/material.dart';
import '../widgets/pimpinan_bottom_nav_bar.dart';
import '../pages/change_password.dart';

class ChangePassword extends StatefulWidget {
  // Perbaikan nama class
  @override
  _ChangePasswordBodyState createState() =>
      _ChangePasswordBodyState(); // Perbaikan pemanggilan State
}

class _ChangePasswordBodyState extends State<ChangePassword> {
  // Perbaikan nama class state
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool _isOldPasswordVisible = false;
  bool _isNewPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(
                'assets/profile.jpg'), // Ganti dengan path gambar yang sesuai
          ),
          SizedBox(height: 20),
          // TextField untuk Password Lama
          TextField(
            controller: oldPasswordController,
            decoration: InputDecoration(
              labelText: 'Password Lama',
              border: OutlineInputBorder(),
              suffixIcon: IconButton(
                icon: Icon(
                  _isOldPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _isOldPasswordVisible = !_isOldPasswordVisible;
                  });
                },
              ),
            ),
            obscureText: !_isOldPasswordVisible,
          ),
          SizedBox(height: 20),
          // TextField untuk Password Baru
          TextField(
            controller: newPasswordController,
            decoration: InputDecoration(
              labelText: 'Password Baru',
              border: OutlineInputBorder(),
              suffixIcon: IconButton(
                icon: Icon(
                  _isNewPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _isNewPasswordVisible = !_isNewPasswordVisible;
                  });
                },
              ),
            ),
            obscureText: !_isNewPasswordVisible,
          ),
          SizedBox(height: 20),
          // TextField untuk Ulangi Password Baru
          TextField(
            controller: confirmPasswordController,
            decoration: InputDecoration(
              labelText: 'Ulangi Password Baru',
              border: OutlineInputBorder(),
              suffixIcon: IconButton(
                icon: Icon(
                  _isConfirmPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                  });
                },
              ),
            ),
            obscureText: !_isConfirmPasswordVisible,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Handle save action
            },
            child: Text('Save'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF4676FB), // Warna biru khusus
              foregroundColor: Colors.white, // Warna teks putih
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
            ),
          ),
        ],
      ),
    );
  }
}
