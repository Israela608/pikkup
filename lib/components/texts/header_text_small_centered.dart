import 'package:flutter/material.dart';
import 'package:pikkup/utils/app_colors.dart' as app_colors;

class HeaderTextSmallCentered extends StatelessWidget {
  const HeaderTextSmallCentered({Key? key, required this.text})
      : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          fontFamily: 'Sora',
          color: app_colors.primaryBlack,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}