import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pikkup/components/texts/plain_text.dart';
import 'package:pikkup/utils/app_colors.dart' as app_colors;
import 'package:pikkup/utils/constants.dart';

class TextBox extends StatelessWidget {
  const TextBox({
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
        const SizedBox(height: 10),
        TextFormField(
          controller: textController,
          keyboardType: TextInputType.name,
          validator: validatorCallback,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          cursorColor: app_colors.primaryBlack,
          style: const TextStyle(color: app_colors.primaryBlack),
          onChanged: onChangedCallback,
          decoration: kTextFieldDecoration,
        ),
      ],
    );
  }
}
