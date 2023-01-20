import 'package:flutter/material.dart';

class DropMenu extends StatelessWidget {
  const DropMenu({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> list = <String>[
      'Semester 1',
      'Semester 2',
      'Semester 3',
      'Semester 4',
      'Semester 5',
      'Semester 6',
      'Semester 7'
    ];
    String dropdownValue = list.first;

    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(
        Icons.list_outlined,
        color: Color(0xff106FA4),
      ),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      onChanged: (String? value) {
        dropdownValue = value!;
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
