import 'package:flutter/material.dart';
import 'package:pikkup/components/texts/plain_text.dart';
import 'package:pikkup/config/themes/app_colors.dart' as app_colors;
import 'package:pikkup/config/themes/styles.dart';
import 'package:pikkup/utils/dimensions.dart';

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
      iconWidget = Image(
        image: const AssetImage('images/mastercard.png'),
        width: Dimensions.d32 + Dimensions.d1 * 0.63,
        height: Dimensions.d20,
      );
    } else if (cardType == 'visa') {
      iconWidget = Image(
        image: const AssetImage('images/visa.png'),
        width: Dimensions.d36,
        height: Dimensions.d23,
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
          padding:
              EdgeInsets.symmetric(vertical: Dimensions.standardPaddingSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PlainText(text: cardNumber, isBlackColor: true),
              SizedBox(height: Dimensions.smallPaddingSize),
              Text(
                expiryDate,
                style: interSmallText.copyWith(color: app_colors.hintAsh),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: Dimensions.d27),
          child: iconWidget,
        ),
      ],
    );
  }
}
