import 'package:flutter/material.dart';
import 'package:pikkup/utils/app_colors.dart' as app_colors;

class WideOutlinedButton extends StatelessWidget {
  const WideOutlinedButton(
      {Key? key, required this.label, required this.onPressedCallback})
      : super(key: key);
  final String label;
  final dynamic onPressedCallback;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: OutlinedButton(
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            fontFamily: 'Sora',
            color: app_colors.primaryBlue,
          ),
        ),
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          side: const BorderSide(color: app_colors.primaryBlue, width: 1),
        ),
        onPressed: onPressedCallback,
      ),
    );
  }
}
