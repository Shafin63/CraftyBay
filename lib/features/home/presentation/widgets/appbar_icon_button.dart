import 'package:flutter/material.dart';
class AppbarIconButton extends StatelessWidget {
  const AppbarIconButton({super.key, required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 20,
        backgroundColor: Colors.grey.withAlpha(40),
        child: Icon(icon, size: 24),
      ),
    );
  }
}
