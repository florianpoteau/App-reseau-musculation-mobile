import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardSeanceFiltre extends StatelessWidget {
  const CardSeanceFiltre(
      {super.key,
      required this.content,
      required this.iconData,
      required this.cardColor});
  final String content;
  final IconData iconData;
  final Color cardColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.1,
      height: 80,
      padding: EdgeInsets.only(left: 10, right: 10),
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
