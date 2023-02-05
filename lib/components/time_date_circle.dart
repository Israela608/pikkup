import 'package:flutter/material.dart';
import 'package:pikkup/utils/dimensions.dart';

//The circle dot that separates the tim and the date of the tile
class TimeDateCircle extends StatelessWidget {
  const TimeDateCircle({Key? key, required this.color}) : super(key: key);
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.d3 + (Dimensions.d1 * 0.54),
      width: Dimensions.d3 + (Dimensions.d1 * 0.54),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
