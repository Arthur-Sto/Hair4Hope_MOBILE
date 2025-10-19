import 'package:flutter/material.dart';

class QuickAccessIcon extends StatelessWidget {
  final IconData icon;
  const QuickAccessIcon({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: const Color(0xFFEC2C8F),
      radius: 30, 
      // O ícone que será exibido no centro.
      child: Icon(
        icon, 
        color: Colors.white,
        size: 30, 
      ),
    );
  }
}
