class User {
  final String email;
  final String username;
  final String password;
  final int age;

  User(
      {required this.email,
      required this.username,
      required this.password,
      required this.age});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        username: json['username'],
        email: json['email'],
        age: json['age'],
        password: json['password']);
  }
}
