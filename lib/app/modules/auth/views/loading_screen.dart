import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_smarcerti/app/hooks/use_auth.dart';
import 'login_page.dart';  // Import halaman login

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
    if(await _auth.isLoggedIn()){
      
      Get.offAllNamed('/login');
    } else {
      // Get.offAllNamed('/home');
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
