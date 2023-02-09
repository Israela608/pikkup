import 'package:flutter/material.dart';
import 'package:pikkup/utils/dimensions.dart';

class UIParameters {
  /*
  Padding
   */
  static EdgeInsetsGeometry get screenHorizontalPadding =>
      EdgeInsets.symmetric(horizontal: Dimensions.standardPaddingSize);

  static EdgeInsetsGeometry get standardPadding =>
      EdgeInsets.all(Dimensions.standardPaddingSize);

  static EdgeInsetsGeometry get smallPadding =>
      EdgeInsets.all(Dimensions.smallPaddingSize);

  /*
  BorderRadius
  */
  static BorderRadius get standardBorderRadius =>
      BorderRadius.circular(Dimensions.d8);

  static BorderRadius get smallBorderRadius =>
      BorderRadius.circular(Dimensions.d4);

  static BorderRadius get bottomSheetBorderRadius => BorderRadius.only(
        topLeft: Radius.circular(Dimensions.d16),
        topRight: Radius.circular(Dimensions.d16),
      );

  //Returns true if the user is in dark mode, returns false if we are in light mode
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }
}
