import 'package:flutter/material.dart';
import 'package:pikkup/utils/app_colors.dart' as app_colors;

class PlainTextBlackBold extends StatelessWidget {
  const PlainTextBlackBold({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 12,
        fontFamily: 'Inter',
        fontWeight: FontWeight.bold,
        color: app_colors.primaryBlack,
      ),
    );
  }
}
