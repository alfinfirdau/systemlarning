import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'screens/login_info_screen.dart';
import 'screens/login_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/main_entry.dart';
import 'screens/splash_screen.dart';
import 'screens/notification_screen.dart';
import 'screens/announcement_screen.dart';
import 'screens/announcement_detail_screen.dart';
import 'screens/quiz_review_screen.dart';
import 'screens/quiz_attempt_screen.dart';
import 'screens/review_answer_screen.dart';
import 'screens/material_slide_screen.dart';
import 'core/app_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegistrationScreen(),
        '/notifications': (context) => const NotificationScreen(),
        '/announcement': (context) => const AnnouncementScreen(),
        '/announcement_detail': (context) => const AnnouncementDetailScreen(),
        '/quiz_review': (context) => const QuizReviewScreen(),
        '/quiz_attempt': (context) => const QuizAttemptScreen(),
        '/review_answer': (context) => const ReviewAnswerScreen(),
        '/material_slide': (context) => const MaterialSlideScreen(),
      },
    );
  }
}
