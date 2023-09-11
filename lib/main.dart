import 'package:flutter/material.dart';
import 'package:renconsport/screen/homepage/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Search Game",
      home: HomePage(),
      // theme: CustomTheme.defaultTheme
    );
  }
}
