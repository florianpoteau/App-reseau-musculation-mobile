import 'package:renconsport/models/exercice.dart';

class Entrainement {
  final String nom;
  final DateTime? datedebut;
  final DateTime? datefin;
  final int serie;
  final int repetition;
  final int? poids;
  final String? note;
  final int userid;
  final int exerciceid;
  final String? exercicegenre;
  final bool ispublic;
  final int? dureeminute;
  final int? dureeheure;

  Entrainement(
      {required this.nom,
      this.datedebut,
      this.datefin,
      required this.serie,
      required this.repetition,
      this.poids,
      required this.note,
      required this.userid,
      required this.ispublic,
      required this.exerciceid,
      required this.dureeminute,
      required this.dureeheure,
      this.exercicegenre});

  factory Entrainement.fromJson(Map<String, dynamic> json) {
    final userIdJson = json['userid'] as Map<String, dynamic>;
    final userId = userIdJson['id'] as int;
    final exerciceIdJson = json['exerciceid'] as Map<String, dynamic>;
    final exerciceId = exerciceIdJson['id'] as int;

    final exerciceGenreJson = json['exerciceid'] as Map<String, dynamic>;
    final exerciceGenre = exerciceGenreJson['genre'] as String;

    DateTime? datedebut =
        json['datedebut'] != null ? DateTime.parse(json['datedebut']) : null;

    DateTime? datefin =
        json['datefin'] != null ? DateTime.parse(json['datefin']) : null;

    return Entrainement(
        nom: json['nom'],
        datedebut: datedebut,
        datefin: datefin,
        serie: json['serie'],
        repetition: json['repetition'],
        poids: json['poids'],
        note: json['note'],
        userid: userId,
        ispublic: json['ispublic'],
        dureeminute: json['dureeminute'],
        dureeheure: json['dureeheure'],
        exerciceid: exerciceId,
        exercicegenre: exerciceGenre);
  }
}
