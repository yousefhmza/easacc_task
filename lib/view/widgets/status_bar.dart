import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LightStatusBar extends StatelessWidget {
  final Scaffold child;

  const LightStatusBar({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
      ),
      child: child,
    );
  }
}

class DarkStatusBar extends StatelessWidget {
  final Scaffold child;

  const DarkStatusBar({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: child,
    );
  }
}
