import 'package:flutter/material.dart';
import 'package:renconsport/screen/Connexion/connexion.dart';
import 'package:renconsport/services/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Search Game",
        home: HomePage(),
        theme: CustomTheme.defaultTheme);
  }
}
