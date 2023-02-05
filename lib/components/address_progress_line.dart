import 'package:flutter/material.dart';
import 'package:pikkup/config/themes/app_colors.dart' as app_colors;
import 'package:pikkup/config/themes/decorations.dart';
import 'package:pikkup/utils/dimensions.dart';

class AddressProgressLine extends StatelessWidget {
  const AddressProgressLine({
    Key? key,
    this.isCompleted = false,
    this.isSmall = false,
  }) : super(key: key);

  final bool isCompleted;
  final bool isSmall;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:
          isSmall ? (Dimensions.d41 + (Dimensions.d1 * 0.61)) : Dimensions.d49,
      width: isSmall ? (Dimensions.d1 + (Dimensions.d1 * 0.7)) : Dimensions.d2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildLine(smallLine: true),
          _buildLine(),
          _buildLine(),
          _buildLine(smallLine: true),
        ],
      ),
    );
  }

  Container _buildLine({bool smallLine = false}) {
    return Container(
      height: smallLine ? Dimensions.d6 : Dimensions.d10,
      width: Dimensions.d2,
      decoration: isCompleted
          ? progressLineDecoration.copyWith(color: app_colors.successDark)
          : progressLineDecoration,
    );
  }
}
