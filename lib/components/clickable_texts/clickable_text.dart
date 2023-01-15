import 'package:flutter/material.dart';
import 'package:pikkup/components/texts/description_text.dart';
import 'package:pikkup/utils/app_colors.dart' as app_colors;

class ClickableText extends StatelessWidget {
  const ClickableText({Key? key, required this.text, required this.onPressed}) : super(key: key);
  final String text;
  final dynamic onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 12,
          fontFamily: 'Inter',
          color: app_colors.primaryBlue,
        ),
      ),
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 4),
        alignment: Alignment.centerLeft,
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      onPressed: onPressed,
    );
  }
}
