import 'package:flutter/material.dart';
import 'package:renconsport/models/user.dart';
import 'package:renconsport/screen/widget/boutonAddUserSeance.dart';
import 'package:renconsport/screen/widget/container.dart';
import 'package:renconsport/services/GetUsers/fetchUser.dart';
import 'package:renconsport/services/theme.dart';

class Messagerie extends StatefulWidget {
  const Messagerie({super.key});

  @override
  State<Messagerie> createState() => _MessagerieState();
}

class _MessagerieState extends State<Messagerie> {
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
        users = userList;
      });
    } catch (e) {
      print('Erreur lors du chargement des utilisateurs: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      ),
      body: Container(
        color: CustomTheme.Colorblue,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: new ConstrainedBox(
                constraints: new BoxConstraints(
                  minHeight: 80.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Widget
                    for (User user in users)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ContainerMessagerie(username: user.username),
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
                  ],
                ),
              ),
            ),
            Expanded(
                child: Align(
              alignment: Alignment.bottomLeft,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
