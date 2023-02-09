//The control screenHeight for our dimensions is 844
//The control screenWidth for our dimensions is 390

import 'package:flutter/material.dart';

//The control screenHeight for our dimensions is 844
//The control screenWidth for our dimensions is 390

class Dimensions {
  static late double screenHeight;
  static late double screenWidth;

  static void init(BuildContext context) {
    final size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;
  }

  //Text
  static double standardTextSize = d16;
  static double smallTextSize = d12;
  static double verySmallTextSize = d10;
  static double extremelySmallTextSize = d8;
  static double headerTextSize = d25;
  static double headerTextSmallSize = d20;
  static double headerTextBigSize = d30;

  //Button
  static double wideButtonHeight = d56;

  //Spacing
  static double titleBodySpacing = d8;
  static double standardSpacing = d24;
  static double bigSpacing = d32;
  static double standardAppBarHeight = d60 + d5;
  static double blendedAppBarHeight = d80 + d16;
  static double standardPaddingSize = d16;
  static double smallPaddingSize = d8;

  //dimensions
  static double d1 = screenHeight / 844;
  static double d2 = screenHeight / 422;
  static double d3 = screenHeight / 281.33;
  static double d4 = screenHeight / 211;
  static double d5 = screenHeight / 168.8;
  static double d6 = screenHeight / 140.67;
  static double d7 = screenHeight / 120.57;
  static double d8 = screenHeight / 105.5;
  static double d9 = screenHeight / 93.78;
  static double d10 = screenHeight / 84.4;
  static double d12 = screenHeight / 70.33;
  static double d13 = screenHeight / 64.92;
  static double d14 = screenHeight / 60.29;
  static double d15 = screenHeight / 56.27;
  static double d16 = screenHeight / 52.75;
  static double d18 = screenHeight / 46.89;
  static double d20 = screenHeight / 42.2;
  static double d23 = screenHeight / 36.7;
  static double d24 = screenHeight / 35.17;
  static double d25 = screenHeight / 33.76;
  static double d26 = screenHeight / 32.46;
  static double d27 = screenHeight / 31.26;
  static double d30 = screenHeight / 28.13;
  static double d32 = screenHeight / 26.38;
  static double d36 = screenHeight / 23.44;
  static double d40 = screenHeight / 21.1;
  static double d41 = screenHeight / 20.59;
  static double d45 = screenHeight / 18.76;
  static double d48 = screenHeight / 17.56;
  static double d49 = screenHeight / 17.22;
  static double d50 = screenHeight / 16.88;
  static double d52 = screenHeight / 16.23;
  static double d56 = screenHeight / 15.07;
  static double d57 = screenHeight / 14.81;
  static double d58 = screenHeight / 14.55;
  static double d60 = screenHeight / 14.07;
  static double d70 = screenHeight / 12.06;
  static double d72 = screenHeight / 11.72;
  static double d75 = screenHeight / 11.25;
  static double d80 = screenHeight / 10.55;
  static double d84 = screenHeight / 10.05;
  static double d100 = screenHeight / 8.44;
  static double d120 = screenHeight / 7.03;
  static double d140 = screenHeight / 6.03;
  static double d150 = screenHeight / 5.63;
  static double d160 = screenHeight / 5.23;
  static double d170 = screenHeight / 4.96;
  static double d180 = screenHeight / 4.69;
  static double d200 = screenHeight / 4.22;
  static double d300 = screenHeight / 2.81;
}
