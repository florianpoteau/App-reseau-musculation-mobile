import 'package:flutter/material.dart';
import 'package:renconsport/models/user.dart';
import 'package:renconsport/screen/widget/Bouton/boutonAddUserSeance.dart';
import 'package:renconsport/screen/widget/Container/containerMessagerie.dart';
import 'package:renconsport/services/GetUsers/fetchUser.dart';
import 'package:renconsport/services/theme.dart';

class UserList extends StatefulWidget {
  const UserList({Key? key});

  @override
  State<UserList> createState() => _MessagerieState();
}

class _MessagerieState extends State<UserList> {
  List<User> users = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  Future<void> _loadUsers() async {
    try {
      final userList = await GetAllUsers.fetchUsers();
      setState(() {
        users = userList;
        isLoading = false;
      });
    } catch (e) {
      print('Erreur lors du chargement des utilisateurs: $e');
      setState(() {
        isLoading = false;
      });
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
            // Utilisation de SingleChildScrollView
            child: Container(
              color: CustomTheme.Colorblue,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // Widget
                        for (User user in users)
                          Padding(
                            padding: EdgeInsets.only(bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                  // Widget
                                  child: BoutonAddUserSeance(),
                                ),
                              ],
                            ),
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
