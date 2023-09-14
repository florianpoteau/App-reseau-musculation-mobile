import 'package:flutter/material.dart';
import '../widget/cards.dart';

class ContainerCardSport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: 380,
        height: 630,
        margin: EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: EdgeInsets.only(top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomCard(content: 'Card 1'),
                SizedBox(height: 20),
                CustomCard(content: 'Card 2'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
