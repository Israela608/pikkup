import 'package:flutter/material.dart';
import 'package:pikkup/components/spacers/spacer.dart';
import 'package:pikkup/components/texts/plain_text.dart';
import 'package:pikkup/config/themes/app_colors.dart' as app_colors;
import 'package:pikkup/config/themes/decorations.dart';
import 'package:pikkup/config/themes/styles.dart';
import 'package:pikkup/utils/formatters.dart';

class CardExpiryDateBox extends StatelessWidget {
  const CardExpiryDateBox({
    Key? key,
    required this.textController,
    required this.validatorCallback,
    required this.onChangedCallback,
  }) : super(key: key);

  final TextEditingController textController;
  final dynamic validatorCallback;
  final dynamic onChangedCallback;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PlainText(text: 'Expiry Date'),
        const SpacerTitleBox(),
        TextFormField(
            controller: textController,
            keyboardType: TextInputType.phone,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: validatorCallback,
            inputFormatters: [
              ExpirationDateFormatter()
              //We combine two input formatters here
              /*
              CreditCardExpirationDateFormatter(), //The main formatter for the expiry date
              MaskedInputFormatter('##/##',
                  allowedCharMatcher: RegExp(
                      '[0-9]')) //Makes sure a dash cannot be inputted in the number textField
              */
            ],
            cursorColor: app_colors.primaryBlack,
            style: textFieldText,
            onChanged: onChangedCallback,
            decoration: textFieldDecoration.copyWith(
              prefixIcon: const FittedBox(
                fit: BoxFit.none,
                child: ImageIcon(
                  AssetImage('images/calender_two.png'),
                  color: app_colors.iconGrey,
                ),
              ),
              hintText: 'MM/YY',
              hintStyle: textFieldHintText,
            )),
      ],
    );
  }
}
