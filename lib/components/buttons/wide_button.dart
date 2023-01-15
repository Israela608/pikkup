import 'package:flutter/material.dart';
import 'package:pikkup/utils/app_colors.dart' as app_colors;

class WideButton extends StatelessWidget {
  const WideButton({Key? key, required this.label, required this.onPressedCallback}) : super(key: key);
  final String label;
  final dynamic onPressedCallback;

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
          primary: app_colors.primaryBlue,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5)),
        ),

        onPressed: onPressedCallback,
      ),
    );
  }
}
