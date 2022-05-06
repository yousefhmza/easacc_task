import 'package:flutter/material.dart';

import '../../core/values_manager.dart';
import '../screens/web_view_screen.dart';


class InputUrlComponent extends StatelessWidget {
  InputUrlComponent({Key? key}) : super(key: key);

  final TextEditingController urlController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          const Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              "Input the url you want to go to.",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(height: deviceHeight * 0.02),
          TextFormField(
            controller: urlController,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  (!value.startsWith("https://") &&
                      !value.startsWith("http://"))) {
                return "Please enter a valid URL address, EX: https://www.youtube.com";
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: "URL",
              filled: true,
              errorMaxLines: 5,
              fillColor: Colors.grey.shade200,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide.none,
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(color: Colors.redAccent),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(color: Colors.redAccent),
              ),
            ),
          ),
          SizedBox(height: deviceHeight * 0.02),
          MaterialButton(
            elevation: 0.0,
            child: const Text("Visit", style: TextStyle(color: Colors.white)),
            color: Colors.blueAccent,
            onPressed: () {
              if (formKey.currentState!.validate()) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => WebViewScreen(url: urlController.text),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
