import 'package:flutter/material.dart';

class Pin extends StatelessWidget {
  const Pin({Key? key, required this.onPressed}) : super(key: key);
  final dynamic onPressed;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 202,
      right: 32,
      child: InkWell(
        onTap: onPressed,
        child: const Image(
          height: 70.72,
          image: AssetImage('images/pin.png'),
        ),
      ),
    );
  }
}
