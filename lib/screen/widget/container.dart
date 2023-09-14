import 'package:flutter/material.dart';

class ContainerMessagerie extends StatelessWidget {
  const ContainerMessagerie({super.key});

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
    );
  }
}
