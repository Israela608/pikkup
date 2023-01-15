import 'package:flutter/material.dart';
import 'package:pikkup/utils/app_colors.dart' as app_colors;

class TrackingProgressLine extends StatelessWidget {
  const TrackingProgressLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 57,
      width: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 10,
            width: 2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: app_colors.iconAsh,
            ),
          ),
          Container(
            height: 10,
            width: 2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: app_colors.iconAsh,
            ),
          ),
          Container(
            height: 10,
            width: 2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: app_colors.iconAsh,
            ),
          ),
          Container(
            height: 10,
            width: 2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: app_colors.iconAsh,
            ),
          ),
        ],
      ),
    );
  }
}
