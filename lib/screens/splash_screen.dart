import 'package:flutter/material.dart';
import 'dart:async';
import '../core/app_colors.dart';
import '../core/text_styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Simulate splash delay
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/'); // Navigate to Login/Info
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryRed,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo Placeholder
            // In a real scenario, you'd use: Image.asset('assets/images/celoe_logo.png', width: 150),
            // For now, we simulate the white text logo from the screenshot
            const Text(
              "ceLoe",
              style: TextStyle(
                fontFamily: 'CustomFont', // Placeholder if they have one
                fontSize: 60,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: -2,
              ),
            ),
             Container(
              height: 2, 
              width: 50, 
              color: Colors.white,
              margin: const EdgeInsets.only(bottom: 10),
            ),
            
            const Text(
              "Learning Management System",
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
