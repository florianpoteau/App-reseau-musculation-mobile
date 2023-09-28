import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:renconsport/models/user.dart';
import 'package:renconsport/screen/widget/Bouton/boutonAddUserSeance.dart';
import 'package:renconsport/screen/widget/Container/containerMessagerie.dart';
import 'package:renconsport/services/GetUsers/fetchUser.dart';
import 'package:renconsport/services/Messagerie/fetchMessagerie.dart';
import 'package:renconsport/services/authToken/getToken.dart';
import 'package:renconsport/services/theme.dart';

class UserList extends StatefulWidget {
  const UserList({Key? key});

  @override
  State<UserList> createState() => _MessagerieState();
}

class _MessagerieState extends State<UserList> {
  List<User> activeContacts = [];
  List<User> otherContacts = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  Future<void> _loadUsers() async {
    final tokenInfo =
        await GetToken.getToken(); // Récupère les informations du token

    if (tokenInfo != null) {
      final userId = tokenInfo[
          'id']; // Supposons que 'sub' contient l'identifiant de l'utilisateur

      try {
        final userList = await GetAllUsers.fetchUsers();

        final activeUserIds = await fetchMessagerie.getActiveUserIds(userId);

        setState(() {
          // Filtrer les utilisateurs actifs et les autres utilisateurs
          activeContacts = userList
              .where((user) => activeUserIds.contains(user.id))
              .toList();
          otherContacts = userList
              .where((user) => !activeUserIds.contains(user.id))
              .toList();

          isLoading = false;
        });
      } catch (e) {
        print('Erreur lors du chargement des utilisateurs: $e');
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              color: CustomTheme.Colorblue,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // Condition qui permet de vérifier si la liste des contacts est vide
                        if (activeContacts.isNotEmpty)
                          Column(
                            children: [
                              Text(
                                "Mes conversations:",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white),
                              ),
                              SizedBox(height: 10),
                              // boucle qui affiche les contacts si elle est rempli
                              for (User user in activeContacts)
                                Padding(
                                  padding: EdgeInsets.only(bottom: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      ContainerMessagerie(
                                        id: user.id,
                                        username: user.username,
                                        age: user.age,
                                      ),
                                      SizedBox(height: 20),
                                      new ConstrainedBox(
                                        constraints: new BoxConstraints(
                                          minHeight: 80.0,
                                        ),
                                        child: BoutonAddUserSeance(),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),

                        // Afficher les autres utilisateurs
                        if (otherContacts.isNotEmpty)
                          Column(
                            children: [
                              // affiche les autres utilisateurs
                              if (activeContacts.isEmpty)
                                Text(
                                  "Faites des rencontres:",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.white),
                                ),
                              if (activeContacts.isNotEmpty)
                                Text(
                                  "Faites d'autres rencontres:",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.white),
                                ),
                              SizedBox(height: 10),
                              for (User user in otherContacts)
                                Padding(
                                  padding: EdgeInsets.only(bottom: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      ContainerMessagerie(
                                        id: user.id,
                                        username: user.username,
                                        age: user.age,
                                      ),
                                      SizedBox(height: 20),
                                      new ConstrainedBox(
                                        constraints: new BoxConstraints(
                                          minHeight: 80.0,
                                        ),
                                        child: BoutonAddUserSeance(),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (isLoading)
            Container(
              color: CustomTheme.Colorblue, // Fond semi-transparent
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }
}
