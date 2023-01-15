import 'package:flutter/material.dart';
import 'package:pikkup/utils/app_colors.dart' as app_colors;

class HeaderTextSmall extends StatelessWidget {
  const HeaderTextSmall({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        fontFamily: 'Sora',
        color: app_colors.primaryBlack,
      ),
    );
  }
}
