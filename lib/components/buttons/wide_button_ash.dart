import 'package:flutter/material.dart';
import 'package:pikkup/utils/app_colors.dart' as app_colors;

class WideButtonAsh extends StatelessWidget {
  const WideButtonAsh({Key? key, required this.label}) : super(key: key);
  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: ElevatedButton(
        child: Text(
          label,
          style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              fontFamily: 'Sora'),
        ),
        style: ElevatedButton.styleFrom(
          primary: app_colors.buttonAsh,
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5)),
        ), onPressed: () {},
      ),
    );
  }
}
