import 'package:flutter/material.dart';
import '../widget/cards.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widget/containerCardSport.dart';

class CreationSeanceFiltre extends StatefulWidget {
  @override
  _CreationSeanceFiltreState createState() => _CreationSeanceFiltreState();
}

class _CreationSeanceFiltreState extends State<CreationSeanceFiltre> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF293548),
        toolbarHeight: 100.0,
        title: Text(
          'Choix du Sport',
          style: TextStyle(
            fontSize: 28,
          ),
        ),
      ),
      body: Container(
        color: Color(0xFFEE7203),
        child: Align(
          alignment: Alignment.center,
          child: Container(
            width: 380,
            height: 630,
            margin: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: ListView(
              children: _buildCards(),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildCards() {
    List<Widget> cards = [
      CustomCard(content: 'Musculation', iconData: FontAwesomeIcons.dumbbell),
      CustomCard(content: 'Athlétisme', iconData: FontAwesomeIcons.running),
      CustomCard(content: 'Natation', iconData: FontAwesomeIcons.swimmer),
      CustomCard(content: 'Football', iconData: FontAwesomeIcons.futbol),
      CustomCard(
          content: 'Basket-ball', iconData: FontAwesomeIcons.baseballBall),
      CustomCard(content: 'Tennis', iconData: FontAwesomeIcons.tableTennis),
      CustomCard(content: 'Cyclisme', iconData: FontAwesomeIcons.biking),
      CustomCard(
          content: 'Arts martiaux', iconData: FontAwesomeIcons.userNinja),
      CustomCard(content: 'Yoga', iconData: FontAwesomeIcons.peace),
      CustomCard(content: 'Danse', iconData: FontAwesomeIcons.music),
    ];
    return cards;
  }
}
