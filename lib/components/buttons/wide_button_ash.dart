import 'package:flutter/material.dart';
import 'package:pikkup/components/buttons/wide_button.dart';

class WideButtonAsh extends StatelessWidget {
  const WideButtonAsh({Key? key, required this.label}) : super(key: key);
  final String label;

  @override
  Widget build(BuildContext context) {
    return WideButton(
      label: label,
      isDisabled: true,
      onPressedCallback: null,
    );
  }
}
