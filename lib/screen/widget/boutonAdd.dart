import 'package:flutter/material.dart';

class BoutonAdd extends StatelessWidget {
  const BoutonAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.22,
      child: ElevatedButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
          size: 40,
        ),
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(80),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(
              Color.fromARGB(255, 35, 135, 216)),
        ),
      ),
    );
  }
}
