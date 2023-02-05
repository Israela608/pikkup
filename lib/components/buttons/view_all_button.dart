import 'package:flutter/material.dart';
import 'package:pikkup/config/themes/app_colors.dart' as app_colors;
import 'package:pikkup/utils/dimensions.dart';

class ViewAllButton extends StatelessWidget {
  const ViewAllButton({Key? key, required this.onPressed}) : super(key: key);
  final dynamic onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: app_colors.tileBlue,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimensions.d4)),
        minimumSize: Size.zero,
        elevation: 0.4,
        padding: EdgeInsets.all(Dimensions.d8),
      ),
      child: Text(
        'view all',
        style: TextStyle(
          fontSize: Dimensions.d10,
          fontFamily: 'Inter',
          color: app_colors.primaryBlue,
        ),
      ),
    );
  }
}
