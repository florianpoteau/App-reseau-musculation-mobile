import 'package:flutter/material.dart';

class FilterDropdown extends StatefulWidget {
  final ValueChanged<String?> onChanged;

  FilterDropdown({required this.onChanged});

  @override
  _FilterDropdownState createState() => _FilterDropdownState();
}

class _FilterDropdownState extends State<FilterDropdown> {
  String? _selectedFilter = 'Tout';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          hint: Text("Filtre des séances"),
          value: _selectedFilter,
          items: <String>[
            'Tout',
            'Musculation',
            'Athlétisme',
            'Natation',
            'Football',
            'Basket-ball',
            'Tennis',
            'Cyclisme',
            'Arts martiaux',
            'Yoga',
            'Danse'
          ].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (newValue) {
            setState(() {
              _selectedFilter = newValue;
            });
            widget.onChanged(newValue);
          },
        ),
      ),
    );
  }
}
