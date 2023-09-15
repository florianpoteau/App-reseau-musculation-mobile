import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomCard extends StatelessWidget {
  final String content;
  final IconData iconData;
  final Color cardColor;

  CustomCard({
    required this.content,
    this.iconData = FontAwesomeIcons.question,
    this.cardColor = const Color(0xFF0091AD),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 80,
      child: Card(
        color: cardColor,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FaIcon(
                iconData,
                size: 45,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 80),
                child: Text(
                  content,
                  style: TextStyle(
                    fontSize: 28,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
