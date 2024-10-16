import 'dart:async';
import 'package:flutter/material.dart';
import 'login_page.dart';  // Import halaman login

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    // Waktu untuk pindah ke halaman login setelah 3 detik
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),  // Pindah ke halaman login
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display logo image
            Container(
              width: 150,  
              height: 150,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/logo.png"),  
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 1),
            const Text(
              'SMARTCERTI',
              style: TextStyle(
                fontFamily: 'RacingSansOne',  
                fontSize: 54,
                fontWeight: FontWeight.bold,
                color: Color(0xFFEF5428),  
              ),
            ),
            Transform.translate(
            offset: const Offset(0, -15),  // Menggeser teks ke atas
            child: const Text(
              'Certification Management for JTI',
              style: TextStyle(
                fontFamily: 'RacingSansOne', 
                fontSize: 18,
                color: Color(0xFF949494),
              ),
            ),
          ),

          ],
        ),
      ),
    );
  }
}
