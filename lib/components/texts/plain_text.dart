import 'package:flutter/material.dart';
import 'package:pikkup/config/themes/app_colors.dart' as app_colors;
import 'package:pikkup/config/themes/styles.dart';

class PlainText extends StatelessWidget {
  const PlainText({
    Key? key,
    required this.text,
    this.isBlackColor = false,
    this.isBold = false,
  }) : super(key: key);

  final String text;
  final bool isBlackColor;
  final bool isBold;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: interNormalText.copyWith(
        color: isBlackColor ? app_colors.primaryBlack : app_colors.textAsh,
        fontWeight: isBold ? FontWeight.bold : null,
      ),
    );
  }
}
