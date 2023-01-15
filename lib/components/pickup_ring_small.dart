import 'package:flutter/material.dart';
import 'package:pikkup/utils/app_colors.dart' as app_colors;

class PickupRingSmall extends StatelessWidget {
  const PickupRingSmall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 13.59,
      width: 13.59,
      padding: const EdgeInsets.all(1.13),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: app_colors.successDark, width: 3.5),
        ),
      ),
    );
  }
}
