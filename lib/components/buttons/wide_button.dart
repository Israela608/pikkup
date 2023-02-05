import 'package:flutter/material.dart';
import 'package:pikkup/config/themes/app_colors.dart' as app_colors;
import 'package:pikkup/config/themes/styles.dart';
import 'package:pikkup/utils/dimensions.dart';

class WideButton extends StatelessWidget {
  const WideButton({
    Key? key,
    required this.label,
    required this.onPressedCallback,
    this.isDisabled = false,
    this.isOutlined = false,
  }) : super(key: key);

  final String label;
  final dynamic onPressedCallback;
  final bool isDisabled;
  final bool isOutlined;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimensions.wideButtonHeight,
      child: ElevatedButton(
        child: Text(
          label,
          style: isOutlined
              ? soraButtonText.copyWith(color: app_colors.primaryBlue)
              : soraButtonText,
        ),
        style: isOutlined
            ? wideButtonOutlined
            : isDisabled
                ? wideButtonDisabled
                : wideButton,
        onPressed: isDisabled ? null : onPressedCallback,
      ),
    );
  }
}
