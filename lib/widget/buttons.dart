import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../screen/seancePublic.dart';
import '../screen/creationSeanceFiltre.dart';

class FooterButtons extends StatelessWidget {
  final bool showSearchButton;

  FooterButtons({this.showSearchButton = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (showSearchButton)
            CircleButton(
              icon: FontAwesomeIcons.search,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SeancePublic()),
                );
              },
            ),
          CircleButton(
            icon: FontAwesomeIcons.plus,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CreationSeanceFiltre()),
              );
            },
          ),
          CircleButton(
            icon: FontAwesomeIcons.comment,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class CircleButton extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final VoidCallback onPressed;

  CircleButton(
      {required this.icon,
      this.iconColor = Colors.black,
      required this.onPressed});

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
  }
}
