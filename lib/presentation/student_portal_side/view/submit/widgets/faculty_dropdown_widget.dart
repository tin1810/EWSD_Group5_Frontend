import 'package:flutter/material.dart';

class FacultyDropdownWidget extends StatefulWidget {
  const FacultyDropdownWidget({super.key});

  @override
  State<FacultyDropdownWidget> createState() => _FacultyDropdownWidgetState();
}

class _FacultyDropdownWidgetState extends State<FacultyDropdownWidget> {
  String? selectedFaculty;
  List<String> faculties = [
    "Faculty of Science",
    "Faculty of Arts",
    "Faculty of Engineering",
    "Faculty of Medicine",
    "Faculty of Business",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        border: Border.all(
          color: Colors.black,
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          elevation: 0,
          iconDisabledColor: Colors.white,
          iconEnabledColor: Colors.white,
          focusColor: Colors.transparent,
          value: selectedFaculty,
          hint: Text(
            "Select Faculty",
            style: TextStyle(color: Colors.white),
          ),
          dropdownColor: Colors.grey[700],
          isExpanded: true,
          items: faculties.map((String faculty) {
            return DropdownMenuItem<String>(
              value: faculty,
              child: Text(
                faculty,
                style: TextStyle(color: Colors.white),
              ),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              selectedFaculty = value;
            });
          },
        ),
      ),
    );
  }
}
