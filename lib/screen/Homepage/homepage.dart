import 'package:flutter/material.dart';
import 'package:renconsport/models/user.dart';
import 'package:renconsport/services/GetUsers/fetchUser.dart';
import 'package:renconsport/services/authToken/getToken.dart';
import 'package:renconsport/screen/widget/FooterButton/footerButton.dart';
import 'package:renconsport/screen/widget/containerCardSport.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_marquee/flutter_marquee.dart';

import '../ProfilPage/profilPage.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String username = 'Chargement...';

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  void _loadUsername() async {
    final data = await GetToken.getToken();
    setState(() {
      username = data != null ? data['username'] : 'Utilisateur inconnu';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF293548),
        toolbarHeight: 100.0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FutureBuilder<Map<String, dynamic>?>(
              future: GetToken.getToken(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  final data = snapshot.data as Map<String, dynamic>?;
                  final username =
                      data != null ? data['username'] : 'Utilisateur inconnu';
                  if (username != null && username.isNotEmpty) {
                    return Text(
                      "Bonjour ${username.toString()}",
                      style: TextStyle(
                        fontSize: 28,
                      ),
                    );
                  } else {
                    return Text(
                      'Nom d\'utilisateur vide ou null',
                      style: TextStyle(
                        fontSize: 28,
                      ),
                    );
                  }
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
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilPage()),
                );
              },
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 30,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        color: Color(0xFFEE7203),
        child: Column(
          children: [
            Expanded(
                child: ContainerCardSport(
              cardColor: Color(0xFFEEB116),
              selectedSport: null,
            )),
            FooterButton(),
          ],
        ),
      ),
    );
  }
}
