import 'package:flutter/material.dart';
import 'package:pikkup/config/themes/app_colors.dart' as app_colors;
import 'package:pikkup/config/themes/styles.dart';
import 'package:pikkup/utils/dimensions.dart';

class ProductStatusBox extends StatelessWidget {
  const ProductStatusBox({Key? key, this.isCompleted = false})
      : super(key: key);

  final bool isCompleted;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.d13 + (Dimensions.d1 * 0.5)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.d4),
        color: isCompleted
            ? app_colors.success.withOpacity(0.05)
            : app_colors.primaryBlue.withOpacity(0.05),
      ),
      child: Row(
        children: [
          _statusCircle(),
          SizedBox(width: Dimensions.d8),
          Container(
            padding: EdgeInsets.symmetric(vertical: Dimensions.d8),
            child: Text(
              isCompleted ? 'Completed' : 'Pending',
              style: interNormalText.copyWith(
                  color: isCompleted
                      ? app_colors.successDark
                      : app_colors.primaryBlue),
            ),
          ),
        ],
      ),
    );
  }

  Container _statusCircle() {
    return Container(
        height: Dimensions.d8,
        width: Dimensions.d8,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isCompleted ? app_colors.successDark : app_colors.primaryBlue,
        ));
  }
}
