import 'package:flutter/material.dart';
import 'package:pikkup/config/themes/app_colors.dart' as app_colors;
import 'package:pikkup/config/themes/decorations.dart';
import 'package:pikkup/config/themes/styles.dart';
import 'package:pikkup/utils/dimensions.dart';

class ReceiverInfoCard extends StatelessWidget {
  const ReceiverInfoCard(
      {Key? key,
      required this.name,
      required this.phoneNumber,
      this.backgroundColor})
      : super(key: key);
  final String name;
  final String phoneNumber;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimensions.d16),
      decoration: smallBorderedCardDecoration.copyWith(
        color: backgroundColor ?? app_colors.tileBlue,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: interNormalBoldText,
          ),
          SizedBox(height: Dimensions.d8),
          Text(
            phoneNumber,
            style: interSmallText,
          ),
        ],
      ),
    );
  }
}
