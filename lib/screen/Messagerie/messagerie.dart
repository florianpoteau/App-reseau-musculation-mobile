import 'package:flutter/material.dart';
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
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Row(
                        children: [
                          Icon(
                            Icons.account_circle,
                            size: 80,
                          ),
                          SizedBox(width: 30),
                          Text(
                            "FLO",
                            style: TextStyle(fontSize: 30),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white,
                      ),
                    ),
                    new ConstrainedBox(
                      constraints: new BoxConstraints(
                        minHeight: 80.0,
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.22,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Icon(
                            Icons.add,
                            size: 40,
                          ),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(80),
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color.fromARGB(255, 35, 135, 216)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
