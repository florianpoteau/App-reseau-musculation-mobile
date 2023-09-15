import 'package:flutter/material.dart';
import '../widget/buttons.dart';
import '../widget/containerCardSport.dart';
import '../widget/filter.dart';

class SeancePublic extends StatefulWidget {
  @override
  _SeancePublicState createState() => _SeancePublicState();
}

class _SeancePublicState extends State<SeancePublic> {
  String? _selectedSport = 'Tout';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF293548),
        toolbarHeight: 100.0,
        title: FilterDropdown(
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
            Expanded(child: ContainerCardSport(selectedSport: _selectedSport)),
            FooterButtons(showSearchButton: false),
          ],
        ),
      ),
    );
  }
}
