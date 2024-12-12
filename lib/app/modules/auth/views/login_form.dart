import 'package:flutter/material.dart';
import 'package:mobile_smarcerti/app/hooks/use_auth.dart';
import 'package:mobile_smarcerti/app/modules/home/views/home_dosen.dart';
import '../../home/views/home_pimpinan.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  bool isPimpinan = false;  
  
  final UseAuth _auth = UseAuth();

  final TextEditingController _nipController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  

  // String? _validateNip(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'NIP tidak boleh kosong';
  //   }
  //   if (value == 'dosen') {
  //     isPimpinan = false;
  //   } else if (value == 'pimpinan') {
  //     isPimpinan = true;
  //   } else {
  //     return 'NIP tidak sesuai';
  //   }
  //   return null;
  // }

  // String? _validatePassword(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'Password tidak boleh kosong';
  //   }
  //   if (value != '1234') {
  //     return 'Password salah';
  //   }
  //   return null;
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            // Field untuk NIP
            TextFormField(
              controller: _nipController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Username',
                hintText: 'Masukkan Username',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Field untuk Password
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                hintText: 'Masukkan Password',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            // Tombol Login
            SizedBox(
              width: 320,
              height: 60,
              child: ElevatedButton(
                onPressed: _handleLogin,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF375E97),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _handleLogin() async {
    setState(() => _isLoading = true);
    try {
      await _auth.login(_nipController.text, _passwordController.text);
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  void dispose() {
    // Pastikan untuk menghapus controller ketika tidak digunakan lagi
    _nipController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
