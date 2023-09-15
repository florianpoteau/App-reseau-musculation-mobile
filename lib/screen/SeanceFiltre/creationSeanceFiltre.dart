import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:renconsport/screen/widget/Card/cardSeanceFiltre.dart';
import 'package:renconsport/services/theme.dart';

class CreationSeanceFiltre extends StatefulWidget {
  const CreationSeanceFiltre({super.key});

  @override
  State<CreationSeanceFiltre> createState() => _CreationSeanceFiltreState();
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
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.8,
            padding: EdgeInsets.only(top: 10, bottom: 10),
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
      CardSeanceFiltre(
        content: 'Musculation',
        iconData: FontAwesomeIcons.dumbbell,
        cardColor: Color.fromARGB(157, 255, 82, 82),
      ),
      CardSeanceFiltre(
        content: 'Athlétisme',
        iconData: FontAwesomeIcons.running,
        cardColor: CustomTheme.ColorBackButton,
      ),
      CardSeanceFiltre(
        content: 'Natation',
        iconData: FontAwesomeIcons.swimmer,
        cardColor: Colors.blueAccent,
      ),
      CardSeanceFiltre(
        content: 'Football',
        iconData: FontAwesomeIcons.futbol,
        cardColor: Colors.green,
      ),
      CardSeanceFiltre(
        content: 'Basket-ball',
        iconData: FontAwesomeIcons.baseballBall,
        cardColor: Color.fromARGB(143, 189, 48, 214),
      ),
      CardSeanceFiltre(
        content: 'Tennis',
        iconData: FontAwesomeIcons.tableTennis,
        cardColor: Colors.yellow,
      ),
      CardSeanceFiltre(
        content: 'Cyclisme',
        iconData: FontAwesomeIcons.biking,
        cardColor: Color.fromARGB(157, 255, 82, 82),
      ),
      CardSeanceFiltre(
        content: 'Arts martiaux',
        iconData: FontAwesomeIcons.userNinja,
        cardColor: Colors.amber,
      ),
      CardSeanceFiltre(
        content: 'Yoga',
        iconData: FontAwesomeIcons.peace,
        cardColor: CustomTheme.ColorBackButton,
      ),
      CardSeanceFiltre(
        content: 'Danse',
        iconData: FontAwesomeIcons.music,
        cardColor: Colors.grey,
      ),
    ];
    return cards;
  }
}
