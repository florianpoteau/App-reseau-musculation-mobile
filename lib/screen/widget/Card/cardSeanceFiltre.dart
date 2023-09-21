import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Modale/modaleDetailCard.dart';

class CardSeanceFiltre extends StatelessWidget {
  final String content;
  final IconData iconData;
  final Color cardColor;
  final VoidCallback? onTap;

  CardSeanceFiltre({
    required this.content,
    required this.iconData,
    required this.cardColor,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 80,
      padding: EdgeInsets.only(left: 6, right: 6),
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
                    color: Colors.black,
                    fontSize: 23,
=======
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap!();
        } else {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return CardDetailsModale(
                cardTitle: content,
                cardDetails: "Détails de $content",
              );
            },
          );
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
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
                      color: Colors.black,
                      fontSize: 28,
                    ),
>>>>>>> b5bb13b457248732b916269131f7b930b187f53c
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
