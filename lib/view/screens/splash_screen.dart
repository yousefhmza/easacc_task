import 'dart:async';

import 'package:flutter/material.dart';

import '../../core/assets_manager.dart';
import '../../core/values_manager.dart';
import '../widgets/status_bar.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  final Duration _animationDuration = const Duration(seconds: 1);
  final Duration _screenDuration = const Duration(seconds: 2);
  late final AnimationController _animationController;
  late final Animation<double> _fadeAnimation;
  late final Animation<Offset> _slideAnimation;

  @override
  void initState() {
    _initLogoAnimation();
    Timer(_screenDuration, () => _toLoginScreen());
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _initLogoAnimation() {
    _animationController =
        AnimationController(vsync: this, duration: _animationDuration);
    _fadeAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _slideAnimation = Tween(
      begin: const Offset(0.0, 0.05),
      end: const Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.forward();
  }

  void _toLoginScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    precacheImage(Image.asset(AppImages.authBG).image, context);
    return DarkStatusBar(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SlideTransition(
          position: _slideAnimation,
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Center(
              child: Image.asset(
                AppImages.easaccLogo,
                width: deviceWidth * 0.6,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
