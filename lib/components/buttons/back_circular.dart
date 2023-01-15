import 'package:flutter/material.dart';
import 'package:pikkup/utils/app_colors.dart' as app_colors;

class BackCircular extends StatelessWidget {
  const BackCircular({Key? key, required this.onPressed}) : super(key: key);
  final dynamic onPressed;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 50,
      left: 16,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          height: 48,
          width: 48,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: const FittedBox(
            fit: BoxFit.none,
            child: SizedBox(
              height: 18,
              child: ImageIcon(
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
