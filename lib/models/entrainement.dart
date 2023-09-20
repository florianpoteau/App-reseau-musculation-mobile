class Entrainement {
  final String nom;
  final DateTime datedebut;
  final DateTime datefin;
  final int serie;
  final int repetition;
  final int poids;
  final String note;
  final String userid;
  final String exerciceid;

  Entrainement({
    required this.nom,
    required this.datedebut,
    required this.datefin,
    required this.serie,
    required this.repetition,
    required this.poids,
    required this.note,
    required this.userid,
    required this.exerciceid,
  });

  factory Entrainement.fromJson(Map<String, dynamic> json) {
    final userIdJson = json['userid'] as Map<String, dynamic>;
    final userId = userIdJson['@id'];
    final exerciceIdJson = json['exerciceid'] as Map<String, dynamic>;
    final exerciceId = exerciceIdJson['@id'];

    return Entrainement(
      nom: json['nom'],
      datedebut: DateTime.parse(json['datedebut']),
      datefin: DateTime.parse(json['datefin']),
      serie: json['serie'],
      repetition: json['repetition'],
      poids: json['poids'],
      note: json['note'],
      userid: userId,
      exerciceid: exerciceId,
    );
  }
}
