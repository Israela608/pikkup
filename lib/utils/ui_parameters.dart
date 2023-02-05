import 'package:flutter/material.dart';
import 'package:pikkup/utils/dimensions.dart';

class UIParameters {
  /*
  Padding
   */
  static EdgeInsetsGeometry get screenHorizontalPadding =>
      EdgeInsets.symmetric(horizontal: Dimensions.standardScreenPaddingSize);

  static EdgeInsetsGeometry get standardPadding =>
      EdgeInsets.all(Dimensions.standardScreenPaddingSize);

  //Returns true if the user is in dark mode, returns false if we are in light mode
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }
}
