import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
import 'package:pikkup/components/texts/plain_text.dart';
import 'package:pikkup/utils/app_colors.dart' as app_colors;
import 'package:pikkup/utils/constants.dart';

class CardCvvBox extends StatelessWidget {
  const CardCvvBox({
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
        const PlainText(text: 'CVV'),
        const SizedBox(height: 10),
        TextFormField(
            controller: textController,
            keyboardType: TextInputType.phone,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: validatorCallback,
            inputFormatters: [
              MaskedInputFormatter('###', allowedCharMatcher: RegExp('[0-9]'))
            ],
            cursorColor: app_colors.primaryBlack,
            style: const TextStyle(color: app_colors.primaryBlack),
            onChanged: onChangedCallback,
            decoration: kTextFieldDecoration.copyWith(
              hintText: '000',
              hintStyle: const TextStyle(
                color: app_colors.hintAsh,
                fontSize: 12,
                fontFamily: 'Inter',
              ),
            )),
      ],
    );
  }
}
