import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomCardSport extends StatelessWidget {
  const CustomCardSport({super.key, required String content});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 80,
      child: Card(
        color: Color(0xFF0091AD),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: FaIcon(
                  FontAwesomeIcons.running,
                  size: 40,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 80),
                child: Text(
                  "User",
                  style: TextStyle(
                    fontSize: 25,
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
