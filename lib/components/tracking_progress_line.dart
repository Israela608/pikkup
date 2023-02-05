import 'package:flutter/material.dart';
import 'package:pikkup/config/themes/app_colors.dart';
import 'package:pikkup/config/themes/decorations.dart';
import 'package:pikkup/utils/dimensions.dart';

class TrackingProgressLine extends StatelessWidget {
  const TrackingProgressLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimensions.d57,
      width: Dimensions.d2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildLine(),
          _buildLine(),
          _buildLine(),
          _buildLine(),
        ],
      ),
    );
  }

  Container _buildLine() {
    return Container(
      height: Dimensions.d10,
      width: Dimensions.d2,
      decoration: progressLineDecoration.copyWith(color: iconAsh),
    );
  }
}
