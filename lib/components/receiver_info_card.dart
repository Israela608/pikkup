import 'package:flutter/material.dart';
import 'package:pikkup/utils/app_colors.dart' as app_colors;

class ReceiverInfoCard extends StatelessWidget {
  const ReceiverInfoCard(
      {Key? key,
      required this.name,
      required this.phoneNumber,
      this.backgroundColor})
      : super(key: key);
  final String name;
  final String phoneNumber;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: backgroundColor ?? app_colors.tileBlue,
        border: Border.all(
            width: 1, color: app_colors.primaryBlue.withOpacity(0.15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(
              fontSize: 13,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
              color: app_colors.primaryBlack,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            phoneNumber,
            style: const TextStyle(
              fontSize: 10,
              fontFamily: 'Inter',
              color: app_colors.primaryBlack,
            ),
          ),
        ],
      ),
    );
  }
}
