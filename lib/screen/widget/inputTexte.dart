import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputTexte extends StatelessWidget {
  const InputTexte({
    Key? key,
    required this.icon,
    required this.text,
    required this.controller,
    required this.showPassword,
    required this.colorInput,
    required this.colorTexte,
    required this.type,
    required this.floatingLabel,
    required this.minLength,
    required this.maxleight,
  }) : super(key: key);

  final IconData icon;
  final String text;
  final bool showPassword;
  final TextEditingController controller;
  final Color colorInput;
  final Color colorTexte;
  final TextInputType type;
  final FloatingLabelBehavior floatingLabel;
  final int minLength;
  final int maxleight;

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
          floatingLabelBehavior: floatingLabel,
          filled: true,
          fillColor: colorInput,
        ),
        style: TextStyle(color: colorTexte),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Veuillez saisir du texte';
          }
          if (value.length < minLength) {
            return 'Le texte doit contenir au moins $minLength caractères';
          }
          if (value.length > maxleight) {
            return 'Le texte contient $minLength caractères en trop';
          }
          return null; // La validation a réussi
        });
  }
}
