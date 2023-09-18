import 'package:flutter/material.dart';
import 'package:renconsport/screen/widget/customCardSport.dart';

class ContainerCardSport extends StatelessWidget {
  const ContainerCardSport(
      {super.key, required selectedSport, required Color cardColor});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: MediaQuery.of(context).size.width,
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
                CustomCardSport(
                  content: 'Card 1',
                ),
                SizedBox(height: 20),
                CustomCardSport(content: 'Card 2')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
