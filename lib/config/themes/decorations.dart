import 'package:flutter/material.dart';
import 'package:pikkup/config/themes/app_colors.dart' as app_colors;
import 'package:pikkup/config/themes/styles.dart';
import 'package:pikkup/utils/dimensions.dart';

const double kStandardAppBarHeight = 68;
const double kBlendedAppBarHeight = 96;
const double kStandardPaddingSize = 16;

EdgeInsetsGeometry get kScreenHorizontalPadding =>
    const EdgeInsets.symmetric(horizontal: 16);

/*
TextInputDecorations
*/

final textFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.all(Dimensions.d15),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(Dimensions.d10),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide:
        BorderSide(color: app_colors.primaryBlueDark, width: Dimensions.d1),
    borderRadius: BorderRadius.circular(Dimensions.d10),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide:
        BorderSide(color: app_colors.primaryBlueDark, width: Dimensions.d2),
    borderRadius: BorderRadius.circular(Dimensions.d10),
  ),
);

final moneyTextFieldDecoration = InputDecoration(
  filled: true,
  fillColor: app_colors.fillAsh,
  counter: const Offstage(), //Prevents the counter from showing
  hintText: '\u{20A6}0.00',
  hintStyle: textFieldHintText.copyWith(
    fontSize: Dimensions.d27,
    fontWeight: FontWeight.bold,
  ),
  /* hintStyle: TextStyle(
    fontSize: Dimensions.d27,
    fontWeight: FontWeight.bold,
    fontFamily: 'Inter',
    color: app_colors.hintAsh,
  ),*/
  // prefixIcon: FittedBox(
  //   fit: BoxFit.scaleDown,
  //   alignment: Alignment.center,
  //   child: Padding(
  //     padding: EdgeInsets.only(left: 32.0),
  //     child: Image(
  //       image: AssetImage('images/naira.png'),
  //       height: 36.7,
  //       width: 36.7,
  //       color: app_colors.primaryBlue,
  //     ),
  //   ),
  // ),
  // contentPadding: EdgeInsets.only(top: 32, bottom: 32, left: 4, right: 32),
  contentPadding: EdgeInsets.all(Dimensions.d32),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(Dimensions.d4)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: app_colors.iconAsh, width: Dimensions.d1),
    borderRadius: BorderRadius.all(Radius.circular(Dimensions.d4)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
        color: app_colors.primaryBlue,
        width: Dimensions.d1 + (Dimensions.d1 / 2)),
    borderRadius: BorderRadius.all(Radius.circular(Dimensions.d4)),
  ),
);

// const kTextFieldDecoration = InputDecoration(
//   prefixIcon: Icon(Icons.lock),
//   suffixIcon: Icon(Icons.visibility),
//   // suffixIcon: IconButton(
//   //     icon: Icon(
//   //         _isObscure ? Icons.visibility : Icons.visibility_off),
//   //     onPressed: () {
//   //       setState(() {
//   //         _isObscure = !_isObscure;
//   //       });
//   //     }),
//   //hintText: 'Enter a value',//This text will be overwritten by the copyWith() callback when it's being called
//   contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//   border: OutlineInputBorder(
//     borderRadius: BorderRadius.all(Radius.circular(10.0)),
//   ),
//   enabledBorder: OutlineInputBorder(
//     borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
//     borderRadius: BorderRadius.all(Radius.circular(10.0)),
//   ),
//   focusedBorder: OutlineInputBorder(
//     borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
//     borderRadius: BorderRadius.all(Radius.circular(10.0)),
//   ),
// );

/*
BoxDecorations
*/

final borderedCardDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(Dimensions.d8),
  color: app_colors.tileBlue,
  border: Border.all(
      width: Dimensions.d1, color: app_colors.primaryBlue.withOpacity(0.15)),
);

final smallBorderedCardDecoration = borderedCardDecoration.copyWith(
  borderRadius: BorderRadius.circular(Dimensions.d4),
);

final progressLineDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(Dimensions.d10),
  color: app_colors.borderAsh,
);
