import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PrimaryAppbar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;

  const PrimaryAppbar({
    required this.title,
    this.actions,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18.0,
          fontWeight: FontWeight.w500,
        ),
      ),
      actions: actions,
      elevation: 0.0,
      backgroundColor: Colors.blueAccent,
      centerTitle: true,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
