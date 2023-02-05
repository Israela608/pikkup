import 'package:flutter/material.dart';
import 'package:pikkup/config/themes/app_colors.dart' as app_colors;
import 'package:pikkup/utils/dimensions.dart';

class Back extends StatelessWidget {
  const Back({
    Key? key,
    this.onPressed,
    this.isWhiteColor = false,
  }) : super(key: key);

  final dynamic onPressed;
  final bool isWhiteColor;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      alignment: Alignment.centerLeft,
      icon: SizedBox(
          height: Dimensions.d18,
          child: ImageIcon(
            const AssetImage('images/back.png'),
            color: isWhiteColor ? app_colors.white : app_colors.black,
          )),
      onPressed: onPressed ?? () => Navigator.pop(context),
    );
  }
}
