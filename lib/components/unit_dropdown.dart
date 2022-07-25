import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/view_constants.dart';
import '../model/unit.dart';

class UnitDropdown extends StatelessWidget {
  final Unit unit;
  final Function(Unit?) onChanged;

  const UnitDropdown({
    Key? key,
    required this.unit,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<Unit>(
      value: unit,
      isExpanded: true,
      onChanged: onChanged,
      style: GoogleFonts.comfortaa(
        fontSize: ViewConstants.smallFont,
        color: Colors.black,
      ),
      decoration: const InputDecoration(
        labelText: 'Unit',
      ),
      items: Unit.values
          .map(
            (unit) => DropdownMenuItem(
              value: unit,
              child: Text(unit.name),
            ),
          )
          .toList(),
    );
  }
}
