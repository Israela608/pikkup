import 'package:flutter/material.dart';
import 'package:pikkup/config/themes/app_colors.dart' as app_colors;
import 'package:pikkup/config/themes/styles.dart';
import 'package:pikkup/utils/dimensions.dart';
import 'package:pikkup/utils/ui_parameters.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({Key? key, this.errorMessage}) : super(key: key);
  final String? errorMessage;

  @override
  Widget build(BuildContext context) {
    if (errorMessage == null) {
      return Container();
    } else {
      return Container(
        margin: EdgeInsets.symmetric(vertical: Dimensions.d10),
        padding: UIParameters.standardPadding,
        alignment: Alignment.center,
        child: Text(
          errorMessage.toString(), //Convert String? to String
          style: soraSubtitleText.copyWith(color: app_colors.white),
          //textAlign: TextAlign.center,
        ),
        decoration: BoxDecoration(
          color: app_colors.error,
          borderRadius: BorderRadius.circular(Dimensions.d5),
        ),
      );
    }
  }
}
