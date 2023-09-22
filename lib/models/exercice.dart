class Exercice {
  final int id;
  final String genre;

  Exercice({required this.genre, required this.id});

  factory Exercice.fromJson(Map<String, dynamic> json) {
    return Exercice(genre: json['genre'], id: json['id']);
  }
}
