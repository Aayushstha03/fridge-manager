import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key, required this.title});
  final String title;
  @override
  Size get preferredSize => const Size.fromHeight(60);
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 6,
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
    );
  }
}
