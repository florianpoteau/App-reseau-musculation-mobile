class Exercice {
  final String genre;

  Exercice({required this.genre});

  factory Exercice.fromJson(Map<String, dynamic> json) {
    return Exercice(genre: json['genre']);
  }
}
