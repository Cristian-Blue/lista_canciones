import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  String title;
  AppBarCustom({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      // backgroundColor: Colors.purple,
      // titleTextStyle: const TextStyle(color: Colors.amber)
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
