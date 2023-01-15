import 'package:flutter/material.dart';
import 'package:pikkup/components/texts/plain_text.dart';
import 'package:pikkup/utils/app_colors.dart' as app_colors;
import 'package:pikkup/utils/constants.dart';

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
        const SizedBox(height: 10),
        TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            validator: validatorCallback,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            cursorColor: app_colors.primaryBlack,
            style: const TextStyle(color: app_colors.primaryBlack),
            onChanged: onChangedCallback,
            decoration: kTextFieldDecoration.copyWith(
              prefixIcon: const Icon(
                Icons.mail_outline,
                color: app_colors.iconAsh,
              ),
            )),
      ],
    );
  }
}
