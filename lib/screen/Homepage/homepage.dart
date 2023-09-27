import 'package:flutter/material.dart';
import 'package:renconsport/models/entrainement.dart';
import 'package:renconsport/screen/widget/containerCardSport.dart';
import 'package:renconsport/services/Entrainements/fetchEntrainement.dart';
import 'package:renconsport/screen/widget/FooterButton/footerButton.dart';
import 'package:renconsport/services/Router/CustomRouter.dart';
import 'package:renconsport/services/authToken/getToken.dart';

import '../ProfilPage/profilPage.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Entrainement> entrainements = [];
  bool isLoading = true;
  String username = 'Chargement...';
  int? userId;

  @override
  void initState() {
    super.initState();
    _loadUsername();
    _loadEntrainements();
  }

  void _loadUsername() async {
    final data = await GetToken.getToken();
    setState(() {
      username = data != null ? data['username'] : 'Utilisateur inconnu';
      userId = data != null
          ? data['id']
          : null; // Récupération de l'ID de l'utilisateur
    });
  }

  Future<void> _loadEntrainements() async {
    try {
      final data = await GetEntrainements.fetchEntrainements();

      setState(() {
        // Filtrer les entraînements pour ne conserver que ceux de l'utilisateur actuel
        entrainements = data
            .where((entrainement) => entrainement.userid == userId)
            .toList();
        isLoading = false;
      });
    } catch (e, stackTrace) {
      print("Erreur lors du chargement des Entrainements: $e");
      print("Stack trace : ${stackTrace}"); // Afficher la trace de la pile
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
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FutureBuilder<Map<String, dynamic>?>(
              future: GetToken.getToken(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  final data = snapshot.data as Map<String, dynamic>?;
                  final username =
                      data != null ? data['username'] : 'Utilisateur inconnu';
                  if (username != null && username.isNotEmpty) {
                    return Text(
                      "Bonjour ${username.toString()}",
                      style: TextStyle(
                        fontSize: 28,
                      ),
                    );
                  } else {
                    return Text(
                      'Nom d\'utilisateur vide ou null',
                      style: TextStyle(
                        fontSize: 28,
                      ),
                    );
                  }
                } else {
                  return Text(
                    'Chargement...',
                    style: TextStyle(
                      fontSize: 28,
                    ),
                  );
                }
              },
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, CustomRouter.profilPage);
              },
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 30,
              ),
            ),
          ],
        ),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Container(
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
                  child: FutureBuilder<Map<String, dynamic>?>(
                    future: GetToken.getToken(),
                    builder: (context, tokenSnapshot) {
                      if (tokenSnapshot.connectionState ==
                          ConnectionState.done) {
                        final tokenData = tokenSnapshot.data;
                        if (tokenData != null) {
                          return ListView.builder(
                            itemCount: entrainements.length,
                            itemBuilder: (context, index) {
                              final entrainement = entrainements[index];

                              if (entrainement.ispublic) {
                                return ContainerCardSport(
                                  textContent: entrainement.nom,
                                  cardColor: Color(0xFFEEB116),
                                  exerciceGenre: entrainement.exercicegenre,
                                  selectedSport: null,
                                  serie: entrainement.serie,
                                  repetition: entrainement.repetition,
                                  note: entrainement.note,
                                  poids: entrainement.poids,
                                  ispublic: entrainement.ispublic,
                                );
                              } else {
                                return ContainerCardSport(
                                  cardColor: Colors.cyan,
                                  selectedSport: null,
                                  textContent: entrainement.nom,
                                  exerciceGenre: entrainement.exercicegenre,
                                  serie: entrainement.serie,
                                  repetition: entrainement.repetition,
                                  note: entrainement.note,
                                  poids: entrainement.poids,
                                  ispublic: entrainement.ispublic,
                                );
                              }
                            },
                          );
                        } else {
                          // Gérer le cas où le token n'est pas valide ou n'existe pas
                          return Text("");
                        }
                      } else {
                        return CircularProgressIndicator();
                      }
                    },
                  ),
                ),
              ),
            ),
      bottomNavigationBar: FooterButton(),
    );
  }
}
