import 'package:flutter/material.dart';
import 'screens/login_info_screen.dart';
import 'screens/main_entry.dart';
import 'screens/splash_screen.dart';
import 'core/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LMS App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primaryRed,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryRed),
        // Use Material 3 true as per modern standard
        useMaterial3: true,
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/': (context) => const LoginInfoScreen(),
        '/home': (context) => const MainEntryScreen(),
      },
    );
  }
}
