import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:renconsport/models/exercice.dart';
import 'package:renconsport/screen/widget/Card/cardSeanceFiltre.dart';
import 'package:renconsport/screen/widget/Exercices/getExercices.dart';
import 'package:renconsport/services/theme.dart';
import '../SeanceCreate/seanceCreate.dart';
import '../widget/marqueeDefilementTexte.dart';

class CreationSeanceFiltre extends StatefulWidget {
  const CreationSeanceFiltre({super.key});

  @override
  State<CreationSeanceFiltre> createState() => _CreationSeanceFiltreState();
}

class _CreationSeanceFiltreState extends State<CreationSeanceFiltre> {
  List<Exercice> exercices = [];
  bool isLoading = true;
  Exercice? selectedExercice;

  @override
  void initState() {
    super.initState();
    _loadExercices();
  }

  void _loadExercices() async {
    try {
      final data = await GetExercices.fetchExercices();
      setState(() {
        exercices = data.cast<Exercice>();
        isLoading = false;
      });
    } catch (e, stackTrace) {
      print("erreur lors du chargement des exercices: $e");
      print("Stack trace : ${stackTrace}");
      setState(() {
        isLoading = false;
      });
    }
  }

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
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Container(
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
    List<Widget> cards = [];

    // Ajoutez ici les genres d'exercices et leurs icônes/couleurs associées
    final exerciseIcons = {
      'Musculation': FontAwesomeIcons.dumbbell,
      'Athlétisme': FontAwesomeIcons.personRunning,
      'Natation': FontAwesomeIcons.personSwimming,
      'Football': FontAwesomeIcons.futbol,
      'Basket-ball': FontAwesomeIcons.baseball,
      'Tennis': FontAwesomeIcons.tableTennisPaddleBall,
      'Cyclisme': FontAwesomeIcons.personBiking,
      'Arts martiaux': FontAwesomeIcons.userNinja,
      'Yoga': FontAwesomeIcons.peace,
      'Danse': FontAwesomeIcons.music,
      'Autres': FontAwesomeIcons.question,
    };

    final exerciseColors = {
      'Musculation': Color.fromARGB(157, 255, 82, 82),
      'Athlétisme': Colors.cyanAccent,
      'Natation': Colors.blueAccent,
      'Football': Colors.green,
      'Basket-ball': Color.fromARGB(143, 189, 48, 214),
      'Tennis': Colors.yellow,
      'Cyclisme': Color.fromARGB(157, 255, 82, 82),
      'Arts martiaux': Colors.amber,
      'Yoga': Colors.brown,
      'Danse': Colors.grey,
      'Autres': Colors.pink,
    };

    // Parcourez les exercices et ajoutez-les à la liste de cartes
    for (final exercice in exercices) {
      final icon = exerciseIcons[exercice.genre] ?? FontAwesomeIcons.question;
      final color = exerciseColors[exercice.genre] ?? Colors.grey;
      cards.add(_buildTappableCard(exercice.genre, icon, color));
    }

    return cards;
  }

  Widget _buildTappableCard(String content, IconData icon, Color color) {
    return CardSeanceFiltre(
        contentString: content,
        contentWidget: ScrollingText(
            text: content,
            style: TextStyle(fontSize: 28)), // Utilisez ScrollingText ici
        iconData: icon,
        cardColor: color,
        onTap: () {
          selectedExercice =
              exercices.firstWhere((exercice) => exercice.genre == content);
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SeanceCreate(
                    category: content, selectedExercice: selectedExercice)),
          );
        });
  }
}
