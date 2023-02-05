import 'package:flutter/material.dart';
import 'package:pikkup/config/themes/app_colors.dart' as app_colors;
import 'package:pikkup/utils/dimensions.dart';

class BackCircular extends StatelessWidget {
  const BackCircular({Key? key, required this.onPressed}) : super(key: key);
  final dynamic onPressed;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: Dimensions.d50,
      left: Dimensions.d16,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          height: Dimensions.d48,
          width: Dimensions.d48,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: FittedBox(
            fit: BoxFit.none,
            child: SizedBox(
              height: Dimensions.d18,
              child: const ImageIcon(
                AssetImage('images/back.png'),
                color: app_colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
