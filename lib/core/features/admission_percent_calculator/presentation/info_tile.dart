import 'package:flutter/material.dart';
import 'package:uni_quest_project/core/constants/app_font_size.dart';

class InfoTile extends StatelessWidget {
  final String title;
  final String value;
  final double height;

  const InfoTile(
      {super.key,
      required this.title,
      required this.value,
      required this.height});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: height * AppFontSize.xxxl)),
        Text(value,
            style: TextStyle(
                color: Colors.white70, fontSize: height * AppFontSize.xxxl)),
      ],
    );
  }
}
