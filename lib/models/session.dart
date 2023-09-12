class Token {
  final String username;
  final String password;

  Token({required this.username, required this.password});

  Token.fromJson(Map<String, dynamic> json)
      : username = json['username'],
        password = json['password'];
}
