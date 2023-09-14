import 'package:flutter/material.dart';
import 'package:renconsport/screen/widget/boutonAddUserSeance.dart';
import 'package:renconsport/screen/widget/container.dart';
import 'package:renconsport/services/theme.dart';

class Messagerie extends StatefulWidget {
  const Messagerie({super.key});

  @override
  State<Messagerie> createState() => _MessagerieState();
}

class _MessagerieState extends State<Messagerie> {
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Widget
                    ContainerMessagerie(),
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
