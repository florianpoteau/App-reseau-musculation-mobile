import 'package:renconsport/models/exercice.dart';

class Entrainement {
  final String nom;
  final DateTime datedebut;
  final DateTime datefin;
  final int serie;
  final int repetition;
  final int poids;
  final String note;
  final int userid;
  final int exerciceid;
  final bool ispublic;
  final int? dureeminute;
  final int? dureeheure;

  Entrainement({
    required this.nom,
    required this.datedebut,
    required this.datefin,
    required this.serie,
    required this.repetition,
    required this.poids,
    required this.note,
    required this.userid,
    required this.ispublic,
    required this.exerciceid,
    required this.dureeminute,
    required this.dureeheure,
  });

  factory Entrainement.fromJson(Map<String, dynamic> json) {
    final userIdJson = json['userid'] as Map<String, dynamic>;
    final userId = userIdJson['id'] as int;
    final exerciceIdJson = json['exerciceid'] as Map<String, dynamic>;
    final exerciceId = exerciceIdJson['id'] as int;

    return Entrainement(
      nom: json['nom'],
      datedebut: DateTime.parse(json['datedebut']),
      datefin: DateTime.parse(json['datefin']),
      serie: json['serie'],
      repetition: json['repetition'],
      poids: json['poids'],
      note: json['note'],
      userid: userId,
      ispublic: json['ispublic'],
      dureeminute: json['dureeminute'],
      dureeheure: json['dureeheure'],
      exerciceid: exerciceId,
    );
  }
}
