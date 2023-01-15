import 'package:flutter/material.dart';
import 'package:pikkup/utils/app_colors.dart' as app_colors;

class DescriptionTextSmallWhite extends StatelessWidget {
  const DescriptionTextSmallWhite({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 10,
        fontFamily: 'Inter',
        color: app_colors.white,
      ),
    );
  }
}
