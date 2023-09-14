import 'package:flutter/material.dart';
import 'package:renconsport/models/user.dart';
import 'package:renconsport/services/GetUsers/fetchUser.dart';
import 'package:renconsport/services/authToken/getToken.dart';
import 'package:renconsport/screen/widget/FooterButton/footerButton.dart';
import 'package:renconsport/screen/widget/containerCardSport.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  Future<void> _loadUsers() async {
    try {
      final userList = await GetAllUsers.fetchUsers();
      setState(() {
        users = userList as List<User>;
      });
    } catch (e) {
      print('Erreur lors du chargement des utilisateurs: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF293548),
        toolbarHeight: 100.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FutureBuilder<Map<String, dynamic>?>(
              future: GetToken.getUsernameFromToken(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  final data =
                      snapshot.data as Map<String, dynamic>?; // Forcer le type
                  final username =
                      data != null ? data['username'] : 'Utilisateur inconnu';
                  return Text(
                    "Bonjour ${username.toString()}",
                    style: TextStyle(
                      fontSize: 28,
                    ),
                  );
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
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 30,
            ),
          ],
        ),
      ),
      body: Container(
        color: Color(0xFFEE7203),
        child: Column(
          children: [
            Expanded(child: ContainerCardSport()),
            FooterButton(),
          ],
        ),
      ),
    );
  }
}
