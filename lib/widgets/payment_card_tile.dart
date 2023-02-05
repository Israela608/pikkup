import 'package:flutter/material.dart';
import 'package:pikkup/components/texts/plain_text.dart';
import 'package:pikkup/config/themes/app_colors.dart' as app_colors;

class PaymentCardTile extends StatelessWidget {
  const PaymentCardTile({
    Key? key,
    required this.cardNumber,
    required this.expiryDate,
    required this.cardType,
  }) : super(key: key);

  final String cardNumber;
  final String expiryDate;
  final String cardType;

  @override
  Widget build(BuildContext context) {
    Widget iconWidget;

    if (cardType == 'mastercard') {
      iconWidget = const Image(
        image: AssetImage('images/mastercard.png'),
        width: 32.63,
        height: 20,
      );
    } else if (cardType == 'visa') {
      iconWidget = const Image(
        image: AssetImage('images/visa.png'),
        width: 36,
        height: 23,
      );
    } else {
      iconWidget = const ImageIcon(
        AssetImage('images/card.png'),
        color: app_colors.iconGrey,
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PlainText(text: cardNumber, isBlackColor: true),
              const SizedBox(height: 8),
              Text(
                expiryDate,
                style: const TextStyle(
                  fontSize: 10,
                  fontFamily: 'Inter',
                  color: app_colors.hintAsh,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 27),
          child: iconWidget,
        ),
      ],
    );
  }
}
