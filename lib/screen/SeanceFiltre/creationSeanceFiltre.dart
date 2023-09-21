import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:renconsport/screen/widget/Card/cardSeanceFiltre.dart';
import 'package:renconsport/services/theme.dart';
import '../SeanceCreate/seanceCreate.dart';

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
      _buildTappableCard(
        'Musculation',
        FontAwesomeIcons.dumbbell,
        Color.fromARGB(157, 255, 82, 82),
      ),
      _buildTappableCard(
        'Athlétisme',
        FontAwesomeIcons.personRunning,
        Colors.cyanAccent,
      ),
      _buildTappableCard(
        'Natation',
        FontAwesomeIcons.personSwimming,
        Colors.blueAccent,
      ),
      _buildTappableCard(
        'Football',
        FontAwesomeIcons.futbol,
        Colors.green,
      ),
      _buildTappableCard(
        'Basket-ball',
        FontAwesomeIcons.baseball,
        Color.fromARGB(143, 189, 48, 214),
      ),
      _buildTappableCard(
        'Tennis',
        FontAwesomeIcons.tableTennisPaddleBall,
        Colors.yellow,
      ),
      _buildTappableCard(
        'Cyclisme',
        FontAwesomeIcons.personBiking,
        Color.fromARGB(157, 255, 82, 82),
      ),
      _buildTappableCard(
        'Arts martiaux',
        FontAwesomeIcons.userNinja,
        Colors.amber,
      ),
      _buildTappableCard(
        'Yoga',
        FontAwesomeIcons.peace,
        Colors.brown,
      ),
      _buildTappableCard(
        'Danse',
        FontAwesomeIcons.music,
        Colors.grey,
      ),
      _buildTappableCard(
        'Autres',
        FontAwesomeIcons.question,
        Colors.pink,
      ),
    ];
    return cards;
  }

  Widget _buildTappableCard(String content, IconData icon, Color color) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SeanceCreate(category: content)),
        );
      },
      child:
          CardSeanceFiltre(content: content, iconData: icon, cardColor: color),
    );
  }
}
