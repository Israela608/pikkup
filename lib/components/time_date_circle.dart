import 'package:flutter/material.dart';

class TimeDateCircle extends StatelessWidget {
  const TimeDateCircle({Key? key, required this.color}) : super(key: key);
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 3.54,
      width: 3.54,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
