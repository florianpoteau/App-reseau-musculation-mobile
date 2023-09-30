import 'package:flutter/material.dart';

class ButtonIdentificationUser extends StatefulWidget {
  final VoidCallback onPressed;
  final String texte;

  ButtonIdentificationUser({
    required this.onPressed,
    required this.texte,
  });

  @override
  _ButtonIdentificationUserState createState() =>
      _ButtonIdentificationUserState();
}

class _ButtonIdentificationUserState extends State<ButtonIdentificationUser> {
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
      onTap: widget.onPressed,
      child: Transform.scale(
        scale: _isPressed ? 0.95 : 1.0,
        child: ElevatedButton(
          onPressed: null,
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              widget.texte,
              style: TextStyle(color: Colors.black),
            ),
          ),
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(Colors.white),
          ),
        ),
      ),
    );
  }
}
