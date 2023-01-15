import 'package:flutter/material.dart';
import 'package:pikkup/utils/app_colors.dart' as app_colors;

class AddressProgressLineGreenSmall extends StatelessWidget {
  const AddressProgressLineGreenSmall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 41.61,
      width: 1.7,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 6,
            width: 2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: app_colors.successDark,
            ),
          ),
          Container(
            height: 10,
            width: 2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: app_colors.successDark,
            ),
          ),
          Container(
            height: 10,
            width: 2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: app_colors.successDark,
            ),
          ),
          Container(
            height: 6,
            width: 2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: app_colors.successDark,
            ),
          ),
        ],
      ),
    );
  }
}
