import 'package:flutter/material.dart';
import 'package:pikkup/utils/app_colors.dart' as app_colors;

class MoneyTextBlue extends StatelessWidget {
  const MoneyTextBlue({Key? key, required this.amount}) : super(key: key);
  final String amount;

  ///Convert amount to Money format

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          const WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: Image(
              image: AssetImage('images/naira.png'),
              height: 36.7,
              color: app_colors.primaryBlue,
            ),
          ),
          const WidgetSpan(child: SizedBox(width: 4)),
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: Text(
              amount,
              style: const TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
                fontFamily: 'Sora',
                color: app_colors.primaryBlue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
