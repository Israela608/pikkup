import 'package:flutter/material.dart';
import 'package:pikkup/config/themes/app_colors.dart' as app_colors;
import 'package:pikkup/config/themes/styles.dart';

class ClickableText extends StatelessWidget {
  const ClickableText({
    Key? key,
    required this.text,
    this.isNormalBlack = false,
    this.isBold = false,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final bool isNormalBlack;
  final bool isBold;

  final dynamic onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        text,
        style: !isBold
            ? interNormalText.copyWith(
                color: isNormalBlack
                    ? app_colors.primaryBlack
                    : app_colors.primaryBlue,
              )
            : interNormalBoldText.copyWith(
                color: app_colors.primaryBlue,
              ),
      ),
      style: clickableText,
      onPressed: onPressed,
    );
  }
}
