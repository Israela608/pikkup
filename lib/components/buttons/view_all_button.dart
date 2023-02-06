import 'package:flutter/material.dart';
import 'package:pikkup/config/themes/app_colors.dart' as app_colors;
import 'package:pikkup/config/themes/styles.dart';

class ViewAllButton extends StatelessWidget {
  const ViewAllButton({Key? key, required this.onPressed}) : super(key: key);
  final dynamic onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: elevatedButton,
      child: Text(
        'view all',
        style: interSmallText.copyWith(color: app_colors.primaryBlue),
      ),
    );
  }
}
