import 'package:flutter/material.dart';
import 'package:pikkup/utils/app_colors.dart' as app_colors;

class AppCheckBox extends StatelessWidget {
  const AppCheckBox(
      {Key? key, required this.isChecked, required this.onChangedCallback})
      : super(key: key);
  final bool isChecked;
  final dynamic onChangedCallback;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      width: 24,
      child: Checkbox(
        activeColor: app_colors.primaryBlue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        side: const BorderSide(width: 2.0, color: app_colors.checkBoxAsh),
        value: isChecked,
        onChanged: onChangedCallback,
      ),
    );
  }
}