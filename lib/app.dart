import 'package:flutter/material.dart';
import 'package:schoolflutter/SplashScreen/splash_screen.dart';
import 'theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dev Aura',
      theme: AppTheme.lightTheme,
      home: const SplashPage(),
    );
  }
}