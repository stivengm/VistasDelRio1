import 'package:flutter/material.dart';

class HeaderSectionWidget extends StatelessWidget {
  final String titleSection;
  const HeaderSectionWidget({super.key, required this.titleSection});

  @override
  Widget build(BuildContext context) {
    return Text(
      titleSection,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold
      ),
    );
  }
}