import 'package:flutter/material.dart';
import 'package:pikkup/config/themes/app_colors.dart' as app_colors;
import 'package:pikkup/config/themes/styles.dart';

enum BodyTextSize { normal, small }

class BodyText extends StatelessWidget {
  const BodyText({
    Key? key,
    required this.text,
    this.color = app_colors.description,
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
          ? interSmallText.copyWith(color: color)
          : interNormalText.copyWith(color: color),
      textAlign: isCentered ? TextAlign.center : null,
    );
  }
}
