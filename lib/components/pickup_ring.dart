import 'package:flutter/material.dart';
import 'package:pikkup/utils/app_colors.dart' as app_colors;

class PickupRing extends StatelessWidget {
  const PickupRing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 16,
      width: 16,
      padding: const EdgeInsets.all(1.33),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: app_colors.successDark, width: 4),
        ),
      ),
    );
  }
}
