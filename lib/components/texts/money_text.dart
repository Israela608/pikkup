import 'package:flutter/material.dart';
import 'package:pikkup/config/themes/styles.dart';
import 'package:pikkup/utils/dimensions.dart';

class MoneyText extends StatelessWidget {
  const MoneyText({Key? key, required this.amount}) : super(key: key);
  final String amount;

  ///Convert amount to Money format

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: Image(
              image: const AssetImage('images/naira.png'),
              height: Dimensions.d36 + (Dimensions.d1 * 0.7),
            ),
          ),
          WidgetSpan(child: SizedBox(width: Dimensions.d4)),
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: Text(
              amount,
              style: moneyText,
            ),
          ),
        ],
      ),
    );
  }
}
