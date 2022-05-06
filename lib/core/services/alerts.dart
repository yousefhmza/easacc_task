import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Alerts {
  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.redAccent,
        content: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  static void showToast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      backgroundColor: Colors.grey.shade200,
      textColor: Colors.black,
    );
  }
}
