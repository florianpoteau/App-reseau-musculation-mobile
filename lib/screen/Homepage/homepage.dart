import 'package:flutter/material.dart';

class HomepageH extends StatefulWidget {
  const HomepageH({super.key});

  @override
  State<HomepageH> createState() => _HomepageState();
}

class _HomepageState extends State<HomepageH> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Accueil"),
      ),
      body: Text("HELLO"),
    );
  }
}
