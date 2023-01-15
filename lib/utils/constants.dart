import 'package:flutter/material.dart';
import 'package:pikkup/utils/app_colors.dart' as app_colors;

const double kStandardAppBarHeight = 68;
const double kBlendedAppBarHeight = 96;
const double kStandardPaddingSize = 16;
const double kTextFieldBoxSpace = 24;

//Padding
const EdgeInsetsGeometry kScreenHorizontalPadding =
    EdgeInsets.symmetric(horizontal: kStandardPaddingSize);

const kTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: app_colors.primaryBlueDark, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: app_colors.primaryBlueDark, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
);

const kMoneyTextFieldDecoration = InputDecoration(
  filled: true,
  fillColor: app_colors.fillAsh,
  counter: Offstage(), //Prevents the counter from showing
  hintText: '\u{20A6}0.00',
  hintStyle: TextStyle(
    fontSize: 27,
    fontWeight: FontWeight.bold,
    fontFamily: 'Inter',
    color: app_colors.hintAsh,
  ),
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
  contentPadding: EdgeInsets.all(32),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(4.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: app_colors.iconAsh, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(4.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: app_colors.primaryBlue, width: 1.5),
    borderRadius: BorderRadius.all(Radius.circular(4.0)),
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
