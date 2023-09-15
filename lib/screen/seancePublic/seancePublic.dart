import 'package:flutter/material.dart';
import 'package:renconsport/screen/widget/FooterButton/footerButton.dart';
import 'package:renconsport/screen/widget/containerCardSport.dart';
import 'package:renconsport/screen/widget/dropDown/filterDropDown.dart';
import 'package:renconsport/services/theme.dart';

class SeancePublic extends StatefulWidget {
  const SeancePublic({super.key});

  @override
  State<SeancePublic> createState() => _SeancePublicState();
}

class _SeancePublicState extends State<SeancePublic> {
  String? _selectedSport = 'Tout';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF293548),
        toolbarHeight: 100.0,
        title: FilterDropDown(
          onChanged: (value) {
            setState(() {
              _selectedSport = value;
            });
          },
        ),
      ),
      body: Container(
        color: Color(0xFFEE7203),
        child: Column(
          children: [
            Expanded(
                child: ContainerCardSport(
              selectedSport: _selectedSport,
              cardColor: CustomTheme.Colororange,
            )),
            FooterButton(showSearchButton: false),
          ],
        ),
      ),
    );
  }
}
