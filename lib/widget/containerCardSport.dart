import 'package:flutter/material.dart';
import '../widget/cards.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContainerCardSport extends StatelessWidget {
  final Color cardColor;
  final String? selectedSport;

  ContainerCardSport(
      {this.cardColor = const Color(0xFF0091AD), this.selectedSport});

  List<Widget> _buildCards() {
    List<Widget> cards = [
      CustomCard(
          content: 'Card 1',
          iconData: FontAwesomeIcons.running,
          cardColor: cardColor),
      CustomCard(
          content: 'Card 2',
          iconData: FontAwesomeIcons.dumbbell,
          cardColor: cardColor),
    ];

    if (selectedSport == 'Tout') {
      print("Returning all cards");
      return cards;
    } else if (selectedSport == 'Musculation') {
      print("Filtering for Musculation");
      return cards
          .where((card) =>
              (card as CustomCard).iconData == FontAwesomeIcons.dumbbell)
          .toList();
    } else if (selectedSport == 'Athlétisme') {
      return cards
          .where((card) =>
              (card as CustomCard).iconData == FontAwesomeIcons.running)
          .toList();
    } else if (selectedSport == 'Natation') {
      return cards
          .where((card) =>
              (card as CustomCard).iconData == FontAwesomeIcons.swimmer)
          .toList();
    } else if (selectedSport == 'Football') {
      return cards
          .where((card) =>
              (card as CustomCard).iconData == FontAwesomeIcons.futbol)
          .toList();
    } else if (selectedSport == 'Basket-ball') {
      return cards
          .where((card) =>
              (card as CustomCard).iconData == FontAwesomeIcons.baseballBall)
          .toList();
    } else if (selectedSport == 'Tennis') {
      return cards
          .where((card) =>
              (card as CustomCard).iconData == FontAwesomeIcons.tableTennis)
          .toList();
    } else if (selectedSport == 'Cyclisme') {
      return cards
          .where((card) =>
              (card as CustomCard).iconData == FontAwesomeIcons.biking)
          .toList();
    } else if (selectedSport == 'Arts martiaux') {
      return cards
          .where((card) =>
              (card as CustomCard).iconData == FontAwesomeIcons.userNinja)
          .toList();
    } else if (selectedSport == 'Yoga') {
      return cards
          .where(
              (card) => (card as CustomCard).iconData == FontAwesomeIcons.peace)
          .toList();
    } else if (selectedSport == 'Danse') {
      return cards
          .where(
              (card) => (card as CustomCard).iconData == FontAwesomeIcons.music)
          .toList();
    }
    return cards;
  }

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
              children: _buildCards(),
            ),
          ),
        ),
      ),
    );
  }
}
