import 'package:flutter/material.dart';
import 'package:pikkup/components/spacers/spacer.dart';
import 'package:pikkup/components/texts/plain_text.dart';
import 'package:pikkup/config/themes/app_colors.dart' as app_colors;
import 'package:pikkup/config/themes/decorations.dart';
import 'package:pikkup/config/themes/styles.dart';

class NumberBox extends StatelessWidget {
  const NumberBox({
    Key? key,
    required this.text,
    required this.textController,
    required this.validatorCallback,
    required this.onChangedCallback,
  }) : super(key: key);

  final String text;
  final TextEditingController textController;
  final dynamic validatorCallback;
  final dynamic onChangedCallback;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PlainText(text: text),
        const TitleBoxSpacer(),
        TextFormField(
            controller: textController,
            keyboardType: TextInputType.number,
            validator: validatorCallback,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            cursorColor: app_colors.primaryBlack,
            style: textFieldText,
            onChanged: onChangedCallback,
            decoration: textFieldDecoration),
      ],
    );
  }
}
