import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CircleButton extends StatelessWidget {
  const CircleButton(
      {super.key,
      required this.icon,
      required this.iconColor,
      required this.onPressed});

  final IconData icon;
  final Color iconColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        shape: CircleBorder(),
        padding: EdgeInsets.all(16),
      ),
      child: FaIcon(
        icon,
        color: iconColor,
        size: 24,
      ),
    );
    ;
  }
}
