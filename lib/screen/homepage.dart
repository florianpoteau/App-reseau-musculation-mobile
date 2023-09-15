import 'package:flutter/material.dart';
import '../widget/buttons.dart';
import '../widget/containerCardSport.dart';
import '../screen/profilPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF293548),
        toolbarHeight: 100.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Bonjour User',
              style: TextStyle(
                fontSize: 28,
              ),
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
            Expanded(child: ContainerCardSport(cardColor: Color(0xFFEEB116))),
            FooterButtons(),
          ],
        ),
      ),
    );
  }
}
