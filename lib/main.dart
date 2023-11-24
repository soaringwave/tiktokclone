import 'package:flutter/material.dart';
import 'package:tiktokclone/constants/sizes.dart';
import 'package:tiktokclone/features/authentication/sign_up_screen.dart';
import 'package:tiktokclone/features/onboarding/interests_screen.dart';

void main() {
  runApp(const TiktokApp());
}

class TiktokApp extends StatelessWidget {
  const TiktokApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tiktok Clone',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            elevation: 0,
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
            titleTextStyle: TextStyle(
              fontSize: Sizes.size24,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            )),
        primaryColor: const Color(0xFFE9435A),
        scaffoldBackgroundColor: Colors.white,
        hintColor: Colors.black38,
      ),
      home: const InterestsScreen(),
    );
  }
}
