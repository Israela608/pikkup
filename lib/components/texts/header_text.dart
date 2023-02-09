import 'package:flutter/material.dart';
import 'package:pikkup/config/themes/app_colors.dart' as app_colors;
import 'package:pikkup/config/themes/styles.dart';
import 'package:pikkup/utils/dimensions.dart';

enum HeaderTextSize { big, normal, small, verySmall }

class HeaderText extends StatelessWidget {
  const HeaderText({
    Key? key,
    required this.text,
    this.color = app_colors.primaryBlack,
    this.headerTextSize = HeaderTextSize.normal,
    this.isCentered = false,
  }) : super(key: key);

  final String text;
  final Color color;
  final HeaderTextSize headerTextSize;
  final bool isCentered;

  @override
  Widget build(BuildContext context) {
    late double _fontSize;

    switch (headerTextSize) {
      case HeaderTextSize.big:
        _fontSize = Dimensions.headerTextBigSize;
        break;

      case HeaderTextSize.normal:
        _fontSize = Dimensions.headerTextSize;
        break;

      case HeaderTextSize.small:
        _fontSize = Dimensions.headerTextSmallSize;
        break;

      case HeaderTextSize.verySmall:
        _fontSize = Dimensions.standardTextSize;
        break;
    }

    return Text(
      text,
      style: soraNormalText.copyWith(
        fontSize: _fontSize,
        color: color,
      ),
      textAlign: isCentered ? TextAlign.center : null,
    );
  }
}
