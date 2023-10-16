import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Modale/modaleDetailCard.dart';

class CardSeanceFiltre extends StatefulWidget {
  final String content;
  final IconData iconData;
  final Color cardColor;
  final VoidCallback? onTap;
  final int? serie;
  final int? repetition;
  final String? note;
  final int? poids;
  final String? exerciceGenre;
  final bool? ispublic;
  final int? idEntrainement;

  CardSeanceFiltre({
    required this.content,
    required this.iconData,
    required this.cardColor,
    this.onTap,
    this.serie,
    this.repetition,
    this.note,
    Key? key,
    this.poids,
    this.exerciceGenre,
    this.ispublic,
    this.idEntrainement,
  }) : super(key: key);

  @override
  _CardSeanceFiltreState createState() => _CardSeanceFiltreState();
}

class _CardSeanceFiltreState extends State<CardSeanceFiltre> {
  bool _isPressed = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _isPressed = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    Future.delayed(const Duration(milliseconds: 150), () {
      setState(() {
        _isPressed = false;
      });
    });
    Future.delayed(const Duration(milliseconds: 300), () {
      if (widget.onTap != null) {
        widget.onTap!();
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return CardDetailsModale(
              cardTitle: widget.content,
              cardDetails: "Détails de ${widget.content}",
              serie: widget.serie,
              repetition: widget.repetition,
              note: widget.note,
              poids: widget.poids,
              exerciceGenre: widget.exerciceGenre,
              ispublic: widget.ispublic,
              idEntrainement: widget.idEntrainement,
            );
          },
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: () {
        setState(() {
          _isPressed = false;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        transform: Matrix4.identity()..scale(_isPressed ? 0.95 : 1.0),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: 80,
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Card(
            color: widget.cardColor,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FaIcon(
                    widget.iconData,
                    size: 45,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text(
                        widget.content,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 28,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
