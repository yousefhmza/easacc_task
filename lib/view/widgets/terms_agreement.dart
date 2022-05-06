import 'package:flutter/material.dart';

class TermsAgreement extends StatelessWidget {
  const TermsAgreement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
        children: [
          TextSpan(
            text: "By Log in you agree to Easacc's",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          TextSpan(
            text: " privacy policy & terms of service",
            style: TextStyle(
              color: Colors.blueAccent,
            ),
          ),
        ],
      ),
    );
  }
}
