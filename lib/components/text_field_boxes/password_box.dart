import 'package:flutter/material.dart';
import 'package:pikkup/components/spacers/spacer.dart';
import 'package:pikkup/components/texts/plain_text.dart';
import 'package:pikkup/config/themes/app_colors.dart' as app_colors;
import 'package:pikkup/config/themes/decorations.dart';
import 'package:pikkup/config/themes/styles.dart';

class PasswordBox extends StatelessWidget {
  const PasswordBox({
    Key? key,
    required this.text,
    required this.passwordController,
    required this.isObscure,
    required this.validatorCallback,
    required this.onPressedCallback,
    required this.onChangedCallback,
  }) : super(key: key);

  final String text;
  final TextEditingController passwordController;
  final bool isObscure;
  final dynamic validatorCallback;
  final dynamic onPressedCallback;
  final dynamic onChangedCallback;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PlainText(text: text),
        const TitleBoxSpacer(),
        TextFormField(
            //expands: true,
            //minLines: null,
            //maxLines: null,
            controller: passwordController,
            obscureText: isObscure,
            keyboardType: TextInputType.text,
            validator: validatorCallback,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            cursorColor: app_colors.primaryBlack,
            style: textFieldText,
            onChanged: onChangedCallback,
            decoration: textFieldDecoration.copyWith(
              prefixIcon: const Icon(
                Icons.lock,
                color: app_colors.iconAsh,
              ),
              suffixIcon: IconButton(
                icon: Icon(isObscure ? Icons.visibility : Icons.visibility_off),
                color: app_colors.primaryBlack,
                onPressed: onPressedCallback,
              ),
            )
            // .copyWith(
            //     hintText:
            //     'Enter your email'), //We use copyWith to overwrite the text in the hintText:
            ),
      ],
    );
  }
}
