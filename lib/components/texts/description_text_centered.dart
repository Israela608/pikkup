import 'package:flutter/material.dart';
import 'package:pikkup/utils/app_colors.dart' as app_colors;

class DescriptionTextCentered extends StatelessWidget {
  const DescriptionTextCentered({Key? key, required this.text})
      : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 12,
        fontFamily: 'Inter',
        color: app_colors.description,
      ),
      textAlign: TextAlign.center,
    );
  }
}
