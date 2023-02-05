import 'package:flutter/material.dart';
import 'package:pikkup/components/texts/body_text.dart';
import 'package:pikkup/config/themes/app_colors.dart' as app_colors;
import 'package:pikkup/config/themes/decorations.dart';
import 'package:pikkup/utils/dimensions.dart';
import 'package:pikkup/utils/ui_parameters.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({Key? key, required this.text, required this.onPressed})
      : super(key: key);
  final String text;
  final dynamic onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Dimensions.d8),
      decoration: borderedCardDecoration,
      child: Material(
        color: app_colors.tileAsh,
        child: InkWell(
          onTap: onPressed,
          child: Container(
            color: Colors.transparent,
            padding: UIParameters.standardPadding,
            child: BodyText(text: text),
          ),
        ),
      ),
    );
  }
}
