import 'package:flutter/material.dart';
import 'package:renconsport/models/entrainement.dart';
import 'package:renconsport/screen/widget/Card/cardSeanceFiltre.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './Modale/modaleDetailCard.dart';

class ContainerCardSport extends StatelessWidget {
  final Color cardColor;
  final String? selectedSport;
  final String textContent;

  ContainerCardSport({
    this.cardColor = const Color(0xFF0091AD),
    this.selectedSport,
    required this.textContent,
  });

  List<Widget> _buildCards(BuildContext context) {
    List<Widget> cards = [
      CardSeanceFiltre(
          content: textContent,
          iconData: FontAwesomeIcons.personRunning,
          cardColor: cardColor),
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
