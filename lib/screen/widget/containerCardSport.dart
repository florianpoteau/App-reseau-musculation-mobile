import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:renconsport/models/entrainement.dart';
import 'package:renconsport/models/exercice.dart';
import 'package:renconsport/screen/widget/Card/cardSeanceFiltre.dart';
import './Modale/modaleDetailCard.dart';
import '../widget/marqueeDefilementTexte.dart';

class ContainerCardSport extends StatelessWidget {
  final Color cardColor;
  final String? selectedSport;
  final String textContent;
  final String? exerciceGenre;
  final int serie;
  final int repetition;
  final String? note;

  ContainerCardSport(
      {this.cardColor = const Color(0xFF0091AD),
      this.selectedSport,
      required this.textContent,
      required this.exerciceGenre,
      required this.serie,
      required this.repetition,
      required this.note});

  IconData _getIconDataForGenre() {
    // Ajoutez ici une logique de correspondance entre le genre de l'exercice et l'icône FontAwesome
    switch (exerciceGenre) {
      case 'Musculation':
        return FontAwesomeIcons.dumbbell;
      case 'Athlétisme':
        return FontAwesomeIcons.personRunning;
      case 'Natation':
        return FontAwesomeIcons.personSwimming;
      case 'Football':
        return FontAwesomeIcons.futbol;
      case 'Basket-ball':
        return FontAwesomeIcons.baseball;
      case 'Tennis':
        return FontAwesomeIcons.tableTennisPaddleBall;
      case 'Cyclisme':
        return FontAwesomeIcons.personBiking;
      case 'Arts martiaux':
        return FontAwesomeIcons.userNinja;
      case 'Yoga':
        return FontAwesomeIcons.peace;
      case 'Danse':
        return FontAwesomeIcons.music;
      case 'Autres':
        return FontAwesomeIcons.question;
      default:
        return FontAwesomeIcons
            .question; // Icône par défaut en cas de correspondance non trouvée
    }
  }

  List<Widget> _buildCards(BuildContext context) {
    List<Widget> cards = [
      CardSeanceFiltre(
        content: textContent,
        iconData: _getIconDataForGenre(),
        cardColor: cardColor,
        serie: serie,
        repetition: repetition,
        note: note,
      ),
    ];

    if (selectedSport == 'Tout') {
      print("Returning all cards");
      return cards;
    } else if (selectedSport == 'Musculation') {
      print("Filtering for Musculation");
      return cards
          .where((card) =>
              (card as CardSeanceFiltre).iconData == FontAwesomeIcons.dumbbell)
          .toList();
    } else if (selectedSport == 'Athlétisme') {
      return cards
          .where((card) =>
              (card as CardSeanceFiltre).iconData ==
              FontAwesomeIcons.personRunning)
          .toList();
    } else if (selectedSport == 'Natation') {
      return cards
          .where((card) =>
              (card as CardSeanceFiltre).iconData ==
              FontAwesomeIcons.personSwimming)
          .toList();
    } else if (selectedSport == 'Football') {
      return cards
          .where((card) =>
              (card as CardSeanceFiltre).iconData == FontAwesomeIcons.futbol)
          .toList();
    } else if (selectedSport == 'Basket-ball') {
      return cards
          .where((card) =>
              (card as CardSeanceFiltre).iconData == FontAwesomeIcons.baseball)
          .toList();
    } else if (selectedSport == 'Tennis') {
      return cards
          .where((card) =>
              (card as CardSeanceFiltre).iconData ==
              FontAwesomeIcons.tableTennisPaddleBall)
          .toList();
    } else if (selectedSport == 'Cyclisme') {
      return cards
          .where((card) =>
              (card as CardSeanceFiltre).iconData ==
              FontAwesomeIcons.personBiking)
          .toList();
    } else if (selectedSport == 'Arts martiaux') {
      return cards
          .where((card) =>
              (card as CardSeanceFiltre).iconData == FontAwesomeIcons.userNinja)
          .toList();
    } else if (selectedSport == 'Yoga') {
      return cards
          .where((card) =>
              (card as CardSeanceFiltre).iconData == FontAwesomeIcons.peace)
          .toList();
    } else if (selectedSport == 'Danse') {
      return cards
          .where((card) =>
              (card as CardSeanceFiltre).iconData == FontAwesomeIcons.music)
          .toList();
    } else if (selectedSport == 'Autres') {
      return cards
          .where((card) =>
              (card as CardSeanceFiltre).iconData == FontAwesomeIcons.question)
          .toList();
    }
    return cards;
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: _buildCards(context),
        ),
      ),
    );
  }
}
