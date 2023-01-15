import 'package:flutter/material.dart';
import 'package:pikkup/utils/app_colors.dart' as app_colors;
import 'package:pikkup/utils/constants.dart';
import 'package:pikkup/widgets/blended_app_bar.dart';

import '../../components/buttons/wide_outlined_button.dart';
import '../../components/texts/description_text_centered.dart';
import '../../components/texts/header_text_small_centered.dart';

class OpenMailDialogScreen extends StatelessWidget {
  const OpenMailDialogScreen({Key? key}) : super(key: key);

  static const String id = 'open_mail_dialog_screen';

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: app_colors.background,
      appBar: BlendedAppBar(),
      body: SafeArea(
        child: Container(
          padding: kScreenHorizontalPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 0.1 * screenHeight),
              Flexible(
                child: Image(
                  height: 0.21 * screenHeight,
                  image: const AssetImage('images/mail_box.png'),
                ),
              ),
              const SizedBox(height: 32),
              const HeaderTextSmallCentered(text: 'We\'ve sent you a mail'),
              const SizedBox(height: 8),
              const DescriptionTextCentered(
                  text:
                      'Check your mail and follow the instructions to reset your password.'),
              const SizedBox(height: 114),
              WideOutlinedButton(
                label: 'Open Mail app',
                onPressedCallback: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
