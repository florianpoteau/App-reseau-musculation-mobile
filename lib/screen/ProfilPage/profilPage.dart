import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:renconsport/models/user.dart';
import 'package:renconsport/services/GetUsers/fetchUser.dart';
import 'package:renconsport/services/Router/CustomRouter.dart';
import 'package:renconsport/services/authToken/getToken.dart';

import '../widget/Profil/containerProfil.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({Key? key}) : super(key: key);

  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF293548),
        toolbarHeight: 100.0,
        title: Text(
          'Profil',
          style: TextStyle(
            fontSize: 28,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xFFEE7203),
          child: Center(
            child: FutureBuilder<Map<String, dynamic>?>(
              future: GetToken.getToken(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  final data = snapshot.data as Map<String, dynamic>?;

                  final username =
                      data != null ? data['username'] : 'Utilisateur inconnu';
                  final userEmail =
                      data != null ? data['email'] : 'E-mail inconnu';

                  return ContainerProfil(
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20),
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.grey[300],
                                radius: 40,
                              ),
                              SizedBox(width: 20),
                              Text(
                                '${username.toString()}',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Email : ${userEmail.toString()}',
                            style: TextStyle(
                              fontSize: 24,
                            ),
                          ),
                          SizedBox(height: 20),
                          SizedBox(
                            height: 50,
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              // Supprimer le token
                              final storage = FlutterSecureStorage();
                              await storage.delete(key: 'token');

                              // Naviguer vers la page de connexion
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                CustomRouter.connexion,
                                (route) => false,
                              );
                            },
                            child: Text("Déconnexion"),
                          )
                        ],
                      ),
                    ),
                  );
                } else {
                  return Text("Chargement...");
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
