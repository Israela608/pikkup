import 'package:credit_card_type_detector/credit_card_type_detector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:pikkup/components/texts/plain_text.dart';
import 'package:pikkup/utils/app_colors.dart' as app_colors;
import 'package:pikkup/utils/constants.dart';

class CardNumberBox extends StatelessWidget {
  const CardNumberBox({
    Key? key,
    required this.cardType,
    required this.textController,
    required this.validatorCallback,
    required this.onChangedCallback,
  }) : super(key: key);

  final CreditCardType cardType;
  final TextEditingController textController;
  final dynamic validatorCallback;
  final dynamic onChangedCallback;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PlainText(text: 'Card Number'),
        const SizedBox(height: 10),
        TextFormField(
          controller: textController,
          keyboardType: TextInputType.phone,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validatorCallback,
          obscureText: false,
          inputFormatters: [
            MaskedInputFormatter('#### #### #### ####',
                allowedCharMatcher: RegExp('[0-9]'))
          ],
          cursorColor: app_colors.primaryBlack,
          style: const TextStyle(color: app_colors.primaryBlack),
          onChanged: onChangedCallback,
          decoration: kTextFieldDecoration.copyWith(
            //counter: const Offstage(), //Prevents the counter from showing
            suffixIcon: cardTypeIcon(context: context),
            suffixIconColor: Colors.transparent,
            hintText: 'XXXX XXXX XXXX XXXX',
            hintStyle: const TextStyle(
              color: app_colors.hintAsh,
              fontSize: 12,
              fontFamily: 'Inter',
            ),
          ),
        ),
      ],
    );
  }

  Widget cardTypeIcon({required BuildContext context}) {
    Widget iconWidget;

    if (cardType == CreditCardType.mastercard) {
      iconWidget = const Image(
        image: AssetImage('images/mastercard.png'),
        width: 32.63,
        height: 20,
      );
    } else if (cardType == CreditCardType.visa) {
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

    return FittedBox(
      //fit: BoxFit.none,
      fit: BoxFit.scaleDown,
      child: iconWidget,
    );
  }
}
