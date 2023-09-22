import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Modale/modaleDetailCard.dart';
import '../marqueeDefilementTexte.dart';

class CardSeanceFiltre extends StatelessWidget {
  final String contentString;
  final Widget contentWidget;
  final IconData iconData;
  final Color cardColor;
  final VoidCallback? onTap;
  final int? serie;
  final int? repetition;
  final String? note;

  CardSeanceFiltre({
    required this.contentString,
    required this.contentWidget,
    required this.iconData,
    required this.cardColor,
    this.onTap,
    this.serie,
    this.repetition,
    this.note,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                serie: serie,
                repetition: repetition,
                note: note,
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FaIcon(
                  iconData,
                  size: 45,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    content,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
