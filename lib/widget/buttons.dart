import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FooterButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleButton(icon: FontAwesomeIcons.search),
          CircleButton(icon: FontAwesomeIcons.plus),
          CircleButton(icon: FontAwesomeIcons.comment),
        ],
      ),
    );
  }
}

class CircleButton extends StatelessWidget {
  final IconData icon;
  final Color iconColor;

  CircleButton({required this.icon, this.iconColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
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
  }
}
