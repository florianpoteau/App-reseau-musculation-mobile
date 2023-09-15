import 'package:flutter/material.dart';

class ContainerProfil extends StatelessWidget {
  final Widget child;

  ContainerProfil({required this.child});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: 380,
        height: 630,
        margin: EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: child,
        ),
      ),
    );
  }
}
