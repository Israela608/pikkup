import 'package:flutter/material.dart';
import 'package:pikkup/config/themes/app_colors.dart' as app_colors;
import 'package:pikkup/config/themes/styles.dart';
import 'package:pikkup/utils/dimensions.dart';
import 'package:pikkup/utils/ui_parameters.dart';

class StandardBottomSheet extends StatelessWidget {
  const StandardBottomSheet(
      {Key? key, required this.title, required this.widget})
      : super(key: key);
  final String title;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: app_colors.backgroundGrey,
      //Make the parent container same color as the grey background
      child: Container(
        //This os the real container we are building on
        decoration: BoxDecoration(
            borderRadius: UIParameters.bottomSheetBorderRadius,
            color: app_colors.background),
        padding: EdgeInsets.only(
          top: Dimensions.d20,
          left: Dimensions.standardPaddingSize,
          right: Dimensions.standardPaddingSize,
        ),
        height: Dimensions.screenHeight * 0.724,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            BottomSheetAppBar(title: title),
            SizedBox(height: Dimensions.d20),
            Expanded(child: widget)
          ],
        ),
      ),
    );
  }
}

class BottomSheetAppBar extends StatelessWidget {
  const BottomSheetAppBar({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: soraSubtitleText.copyWith(fontWeight: FontWeight.w600),
        ),
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.close,
            size: Dimensions.d32,
          ),
          //iconSize: 32,
        )
      ],
    );
  }
}
