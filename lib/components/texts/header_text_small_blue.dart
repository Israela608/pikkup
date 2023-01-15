import 'package:flutter/material.dart';
import 'package:pikkup/utils/app_colors.dart' as app_colors;

class HeaderTextSmallBlue extends StatelessWidget {
  const HeaderTextSmallBlue({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        fontFamily: 'Sora',
        color: app_colors.primaryBlue,
      ),
    );
  }
}
