import 'package:flutter/material.dart';
import '../widget/marqueeDefilementTexte.dart';

class ContainerMessagerie extends StatelessWidget {
  final String username;

  const ContainerMessagerie({Key? key, required this.username})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Row(
        children: [
          Icon(
            Icons.account_circle,
            size: 80,
          ),
          SizedBox(width: 15),
          Expanded(
            child: ScrollingText(
              text: username,
              style: TextStyle(fontSize: 30),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
      ),
    );
  }
}
