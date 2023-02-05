import 'package:flutter/material.dart';
import 'package:pikkup/utils/dimensions.dart';

class Pin extends StatelessWidget {
  const Pin({Key? key, required this.onPressed}) : super(key: key);
  final dynamic onPressed;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: Dimensions.d200 + Dimensions.d2,
      right: Dimensions.d32,
      child: InkWell(
        onTap: onPressed,
        child: Image(
          height: Dimensions.d70 + (Dimensions.d1 * 0.72),
          image: const AssetImage('images/pin.png'),
        ),
      ),
    );
  }
}
