import 'package:flutter/material.dart';
import '../pages/home_page.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nipController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _validateNip(String? value) {
    if (value == null || value.isEmpty) {
      return 'NIP tidak boleh kosong';
    }
    if (value != '2241') {
      return 'NIP tidak sesuai';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password tidak boleh kosong';
    }
    if (value != '1234') {
      return 'Password salah';
    }
    return null;
  }

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
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'NIP',
                hintText: 'Masukkan NIP',
                border: OutlineInputBorder(),
              ),
              validator: _validateNip,
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
              validator: _validatePassword,
            ),

            const SizedBox(height: 20),

            // Tombol Login
            SizedBox(
              width: 320,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Jika validasi sukses, navigasi ke halaman Home
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
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

  @override
  void dispose() {
    // Pastikan untuk menghapus controller ketika tidak digunakan lagi
    _nipController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
