import 'package:flutter/material.dart';

import '../../core/values_manager.dart';

class AuthButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color btnColor;
  final String loginMethodLogo;
  final String text;

  const AuthButton({
    required this.onPressed,
    required this.btnColor,
    required this.loginMethodLogo,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          decoration: BoxDecoration(
            color: btnColor,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            children: [
              Image.asset(
                loginMethodLogo,
                width: deviceWidth * 0.07,
                height: deviceWidth * 0.07,
                fit: BoxFit.cover,
              ),
              SizedBox(width: deviceWidth * 0.03),
              Expanded(
                child: Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
