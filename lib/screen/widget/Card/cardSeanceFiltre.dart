import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Modale/modaleDetailCard.dart';

class CardSeanceFiltre extends StatelessWidget {
  final String content;
  final IconData iconData;
  final Color cardColor;
  final VoidCallback? onTap;
  final int? serie;
  final int? repetition;
  final String? note;
  final int? poids;
  final String? exerciceGenre;
  final bool? ispublic;

  CardSeanceFiltre({
    required this.content,
    required this.iconData,
    required this.cardColor,
    this.onTap,
    this.serie,
    this.repetition,
    this.note,
    Key? key,
    this.poids,
    this.exerciceGenre,
    this.ispublic,
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
                  poids: poids,
                  exerciceGenre: exerciceGenre,
                  ispublic: ispublic);
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
                // Enveloppez le Text dans un SingleChildScrollView avec une largeur fixe
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    width:
                        MediaQuery.of(context).size.width * 0.5, // Largeur fixe
                    child: Text(
                      content,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                      ),
                    ),
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
