import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_smarcerti/app/hooks/use_auth.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  final UseAuth _auth = UseAuth();

  @override
  void initState() {
    super.initState();
    pref();
  }

  void pref() async {
    Future.delayed(const Duration(seconds: 3), () async {
      if (await _auth.isLoggedIn()) {
        // Jika sudah login, arahkan ke halaman home
        Get.offAllNamed('/home');
      } else {
        // Jika belum login, arahkan ke halaman login
        Get.offAllNamed('/login');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
            const SizedBox(height: 10),
            const Text(
              'SMARTCERTI',
              style: TextStyle(
                fontFamily: 'RacingSansOne',
                fontSize: 54,
                fontWeight: FontWeight.bold,
                color: Color(0xFFEF5428),
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              'Certification Management for JTI',
              style: TextStyle(
                fontFamily: 'RacingSansOne',
                fontSize: 18,
                color: Color(0xFF949494),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
