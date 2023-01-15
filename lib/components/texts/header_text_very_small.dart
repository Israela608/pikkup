import 'package:flutter/material.dart';
import 'package:pikkup/utils/app_colors.dart' as app_colors;

class HeaderTextVerySmall extends StatelessWidget {
  const HeaderTextVerySmall({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        fontFamily: 'Sora',
        color: app_colors.primaryBlack,
      ),
    );
  }
}
