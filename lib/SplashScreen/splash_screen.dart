import 'package:flutter/material.dart';
import 'package:schoolflutter/LoginPage/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  double opacity = 1.0;

  @override
  void initState() {
    super.initState();
    startSplashAnimation();
  }

  Future<void> startSplashAnimation() async {
    // Keep splash visible for 5 seconds
    await Future.delayed(const Duration(seconds: 5));

    if (!mounted) return;

    // Start fade out animation
    setState(() {
      opacity = 0.0;
    });

    // Wait until fade out finishes
    await Future.delayed(const Duration(milliseconds: 800));

    if (!mounted) return;

    // Navigate to login page
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const LoginPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: AnimatedOpacity(
          opacity: opacity,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
          child: Center(
            child: Image.asset(
              'assets/images/dev_aura_logo.png',
              width: size.width * 0.45,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}