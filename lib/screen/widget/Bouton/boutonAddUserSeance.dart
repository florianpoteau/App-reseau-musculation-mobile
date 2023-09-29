import 'package:flutter/material.dart';

class BoutonAddUserSeance extends StatefulWidget {
  @override
  _BoutonAddUserSeanceState createState() => _BoutonAddUserSeanceState();
}

class _BoutonAddUserSeanceState extends State<BoutonAddUserSeance> {
  bool _isPressed = false;

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _isPressed = true;
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTap: () {},
      child: Transform.scale(
        scale: _isPressed ? 0.9 : 1.0,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.22,
          child: ElevatedButton(
            onPressed: null,
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
        ),
      ),
    );
  }
}
