class User {
  final int? id;
  final String email;
  final String username;
  final String? password;
  final int age;

  User(
      {this.id,
      required this.email,
      required this.username,
      this.password,
      required this.age});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        username: json['username'],
        email: json['email'],
        age: json['age'],
        password: json['password']);
  }

  factory User.json(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        username: json['username'],
        email: json['email'],
        age: json['age']);
  }
}
