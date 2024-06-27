import 'package:flutter/material.dart';

class DrawerItems extends StatelessWidget {
  const DrawerItems(
      {super.key,
      required this.icon,
      required this.text,
      required this.navigate});

  final IconData icon;
  final String text;
  final VoidCallback navigate;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      onTap: navigate,
    );
  }
}
