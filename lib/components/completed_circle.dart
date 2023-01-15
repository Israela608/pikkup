import 'package:flutter/material.dart';
import 'package:pikkup/utils/app_colors.dart' as app_colors;

class CompletedCircle extends StatelessWidget {
  const CompletedCircle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8,
      width: 8,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: app_colors.successDark,
      ),
    );
  }
}
