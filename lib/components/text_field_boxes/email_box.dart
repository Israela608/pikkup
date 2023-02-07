import 'package:flutter/material.dart';
import 'package:pikkup/components/spacers/spacer.dart';
import 'package:pikkup/components/texts/plain_text.dart';
import 'package:pikkup/config/themes/app_colors.dart' as app_colors;
import 'package:pikkup/config/themes/decorations.dart';
import 'package:pikkup/config/themes/styles.dart';

class EmailBox extends StatelessWidget {
  const EmailBox({
    Key? key,
    required this.emailController,
    required this.validatorCallback,
    required this.onChangedCallback,
  }) : super(key: key);

  final TextEditingController emailController;
  final dynamic validatorCallback;
  final dynamic onChangedCallback;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PlainText(text: 'Email'),
        const TitleBoxSpacer(),
        TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            validator: validatorCallback,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            cursorColor: app_colors.primaryBlack,
            style: textFieldText,
            onChanged: onChangedCallback,
            decoration: textFieldDecoration.copyWith(
              prefixIcon: const Icon(
                Icons.mail_outline,
                color: app_colors.iconAsh,
              ),
            )),
      ],
    );
  }
}
