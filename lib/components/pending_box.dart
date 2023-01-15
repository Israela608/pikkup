import 'package:flutter/material.dart';
import 'package:pikkup/components/pending_circle.dart';
import 'package:pikkup/utils/app_colors.dart' as app_colors;

class PendingBox extends StatelessWidget {
  const PendingBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 13.5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          //color: app_colors.buttonAsh,
          color: app_colors.primaryBlue.withOpacity(0.05)),
      child: Row(
        children: [
          const PendingCircle(),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: const Text(
              'Pending',
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'Inter',
                color: app_colors.primaryBlue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
