import 'package:flutter/material.dart';
import 'package:renconsport/models/entrainement.dart';
import 'package:renconsport/screen/widget/FooterButton/footerButton.dart';
import 'package:renconsport/screen/widget/Container/containerCardSport.dart';
import 'package:renconsport/screen/widget/dropDown/filterDropDown.dart';
import 'package:renconsport/services/Entrainements/fetchEntrainement.dart';
import 'package:renconsport/services/Entrainements/fetchEntrainement.dart';
import 'package:renconsport/services/theme.dart';

class SeancePublic extends StatefulWidget {
  const SeancePublic({super.key});

  @override
  State<SeancePublic> createState() => _SeancePublicState();
}

class _SeancePublicState extends State<SeancePublic> {
  String? _selectedSport = 'Tout';
  List<Entrainement> entrainements = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadEntrainement();
  }

// Dans la méthode _loadEntrainement, après avoir obtenu les données
  Future<void> _loadEntrainement() async {
    try {
      final data = await FetchEntrainement.fetchEntrainements();
      final entrainementsList = data.cast<Entrainement>();

      // Filtrer les entraînements publics
      final entrainementsPublics = entrainementsList
          .where((entrainement) => entrainement.ispublic)
          .toList();

      setState(() {
        entrainements = entrainementsPublics;
        isLoading = false;
      });
    } catch (e) {
      print("Erreur lors du chargement des Entrainements: $e");
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
        title: FilterDropDown(
          onChanged: (value) {
            setState(() {
              _selectedSport = value;
            });
          },
        ),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Container(
              color: Color(0xFFEE7203),
              child: Column(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 630,
                          margin: EdgeInsets.only(top: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ListView.builder(
                            itemCount: entrainements.length,
                            itemBuilder: (context, index) {
                              final entrainement = entrainements[index];
                              return ContainerCardSport(
                                idEntrainement: entrainement.id,
                                selectedSport: _selectedSport,
                                cardColor: Color(0xFFEEB116),
                                textContent: entrainement.nom,
                                exerciceGenre: entrainement.exercicegenre,
                                serie: entrainement.serie,
                                repetition: entrainement.repetition,
                                note: entrainement.note,
                                poids: entrainement.poids,
                              );
                            },
                          )),
                    ),
                  ),
                  FooterButton(showSearchButton: false),
                ],
              ),
            ),
    );
  }
}
