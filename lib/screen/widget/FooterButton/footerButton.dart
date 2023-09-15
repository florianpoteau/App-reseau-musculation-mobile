import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:renconsport/screen/Messagerie/messagerie.dart';
import 'package:renconsport/screen/SeanceFiltre/creationSeanceFiltre.dart';
import 'package:renconsport/screen/seancePublic/seancePublic.dart';
import 'package:renconsport/screen/widget/FooterButton/circleButton.dart';

class FooterButton extends StatelessWidget {
  final bool showSearchButton;

  FooterButton({this.showSearchButton = true});

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
              iconColor: Colors.black,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SeancePublic()),
                );
              },
            ),
          CircleButton(
            icon: FontAwesomeIcons.plus,
            iconColor: Colors.black,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CreationSeanceFiltre()),
              );
            },
          ),
          CircleButton(
            icon: FontAwesomeIcons.comment,
            iconColor: Colors.black,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Messagerie()),
              );
            },
          ),
        ],
      ),
    );
  }
}
