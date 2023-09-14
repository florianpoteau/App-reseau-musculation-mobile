import 'package:flutter/material.dart';
import '../widget/buttons.dart';

class SeancePublic extends StatefulWidget {
  @override
  _SeancePublicState createState() => _SeancePublicState();
}

class _SeancePublicState extends State<SeancePublic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Container(
        color: Color(0xFFEE7203),
        child: Column(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: 380,
                  height: 630,
                  margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),
            FooterButtons(),
          ],
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFF293548),
      toolbarHeight: 100.0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Bonjour User',
            style: TextStyle(
              fontSize: 28.0,
            ),
          ),
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 30.0,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(100.0);
}
