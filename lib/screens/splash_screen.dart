import 'dart:async';
import 'package:flutter/material.dart';
import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Fade-in animation
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _fadeAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _controller.forward();

    // Navigate to onboarding after 3 seconds (removed const here)
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Color(0xFFFFE4F1)], // soft pink gradient
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Image.asset(
                'images/logo1.jpeg',
                height: 120,
              ),
              const SizedBox(height: 25),

              // App name
              const Text(
                "Tebac Designers",
                style: TextStyle(
                  color: Color(0xFFE91E63),
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.4,
                ),
              ),

              const SizedBox(height: 8),
              const Text(
                "Always Perfect",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  letterSpacing: 1.1,
                ),
              ),

              const SizedBox(height: 45),

              // Loading spinner
              const CircularProgressIndicator(
                color: Color(0xFFE91E63),
                strokeWidth: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
