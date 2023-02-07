import 'package:flutter/material.dart';
import 'package:pikkup/config/themes/app_colors.dart' as app_colors;
import 'package:pikkup/config/themes/styles.dart';

class SmallText extends StatelessWidget {
  const SmallText({
    Key? key,
    required this.text,
    this.color = app_colors.primaryBlack,
    this.isSmall = false,
    this.isCentered = false,
  }) : super(key: key);

  final String text;
  final Color color;
  final bool isSmall;
  final bool isCentered;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: isSmall
          ? soraExtremelySmallText.copyWith(color: color)
          : soraSmallText.copyWith(color: color),
      textAlign: isCentered ? TextAlign.center : null,
    );
  }
}
