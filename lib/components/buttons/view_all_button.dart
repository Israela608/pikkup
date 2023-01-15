import 'package:flutter/material.dart';
import 'package:pikkup/utils/app_colors.dart' as app_colors;

class ViewAllButton extends StatelessWidget {
  const ViewAllButton({Key? key, required this.onPressed}) : super(key: key);
  final dynamic onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: app_colors.tileBlue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        minimumSize: Size.zero,
        elevation: 0.4,
        padding: const EdgeInsets.all(8),
      ),
      child: const Text(
        'view all',
        style: TextStyle(
          fontSize: 10,
          fontFamily: 'Inter',
          color: app_colors.primaryBlue,
        ),
      ),
    );
  }
}
