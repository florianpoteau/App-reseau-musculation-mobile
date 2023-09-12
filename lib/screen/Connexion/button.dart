import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            primary: Colors.white, onPrimary: Colors.black),
        child: Text(
          text,
        ));
  }
}
