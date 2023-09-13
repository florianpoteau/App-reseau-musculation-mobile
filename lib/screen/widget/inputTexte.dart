import 'package:flutter/material.dart';
import 'package:renconsport/services/theme.dart';

class InputTexte extends StatelessWidget {
  const InputTexte(
      {super.key,
      required this.icon,
      required this.text,
      required this.controller,
      required this.showPassword,
      required this.colorInput,
      required this.colorTexte,
      required this.type});

  final IconData icon;
  final String text;
  final bool showPassword;
  final TextEditingController controller;
  final Color colorInput;
  final Color colorTexte;
  final TextInputType type;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: type,
      obscureText: showPassword,
      controller: controller,
      decoration: InputDecoration(
        labelText: text,
        prefixIcon: Icon(
          icon,
          color: colorTexte,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        labelStyle: TextStyle(color: colorTexte),
        filled: true,
        fillColor: colorInput,
      ),
      style: TextStyle(color: colorTexte),
    );
  }
}
