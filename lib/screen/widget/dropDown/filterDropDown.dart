import 'package:flutter/material.dart';

class FilterDropDown extends StatefulWidget {
  const FilterDropDown({super.key, required this.onChanged});

  final ValueChanged<String?> onChanged;

  @override
  State<FilterDropDown> createState() => _FilterDropDownState();
}

class _FilterDropDownState extends State<FilterDropDown> {
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
    ;
  }
}
