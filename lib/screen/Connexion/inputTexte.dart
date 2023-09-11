import 'package:flutter/material.dart';
import 'package:renconsport/services/theme.dart';

class InputTexte extends StatelessWidget {
  const InputTexte({super.key, required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: text,
        prefixIcon: Icon(
          icon,
          color: Colors.white,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        labelStyle: TextStyle(color: Colors.white),
        filled: true,
        fillColor: CustomTheme.Colorblue,
      ),
      style: TextStyle(color: Colors.white),
    );
  }
}
