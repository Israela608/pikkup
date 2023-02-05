import 'package:flutter/material.dart';
import 'package:pikkup/config/themes/app_colors.dart' as app_colors;
import 'package:pikkup/utils/dimensions.dart';

class AppCheckBox extends StatelessWidget {
  const AppCheckBox(
      {Key? key, required this.isChecked, required this.onChangedCallback})
      : super(key: key);
  final bool isChecked;
  final dynamic onChangedCallback;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimensions.d24,
      width: Dimensions.d24,
      child: Checkbox(
        activeColor: app_colors.primaryBlue,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimensions.d4)),
        side: BorderSide(width: Dimensions.d2, color: app_colors.checkBoxAsh),
        value: isChecked,
        onChanged: onChangedCallback,
      ),
    );
  }
}
