import 'package:flutter/material.dart';
import 'package:pikkup/utils/app_colors.dart' as app_colors;

class AddressProgressLine extends StatelessWidget {
  const AddressProgressLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 49,
      width: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 6,
            width: 2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: app_colors.borderAsh,
            ),
          ),
          Container(
            height: 10,
            width: 2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: app_colors.borderAsh,
            ),
          ),
          Container(
            height: 10,
            width: 2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: app_colors.borderAsh,
            ),
          ),
          Container(
            height: 6,
            width: 2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: app_colors.borderAsh,
            ),
          ),
        ],
      ),
    );
  }
}
