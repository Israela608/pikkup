import 'package:flutter/material.dart';
import 'package:pikkup/components/texts/description_text.dart';
import 'package:pikkup/utils/app_colors.dart' as app_colors;

class AddressCard extends StatelessWidget {
  const AddressCard({Key? key, required this.text, required this.onPressed})
      : super(key: key);
  final String text;
  final dynamic onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: app_colors.tileBlue,
        border: Border.all(
            width: 1, color: app_colors.primaryBlue.withOpacity(0.15)),
      ),
      child: Material(
        color: app_colors.tileAsh,
        child: InkWell(
          onTap: onPressed,
          child: Container(
            color: Colors.transparent,
            padding: const EdgeInsets.all(16),
            child: DescriptionText(text: text),
          ),
        ),
      ),
    );
  }
}
