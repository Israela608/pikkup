import 'package:flutter/material.dart';
import 'package:pikkup/screens/login_screen.dart';
import 'package:pikkup/utils/app_colors.dart' as app_colors;
import 'package:pikkup/utils/constants.dart';

import '../../components/buttons/wide_outlined_button.dart';
import '../../components/texts/description_text_centered.dart';
import '../../components/texts/header_text_small_centered.dart';

class ResetPasswordSuccessfulDialogScreen extends StatelessWidget {
  const ResetPasswordSuccessfulDialogScreen({Key? key}) : super(key: key);

  static const String id = 'reset_password_successful_dialog_screen';

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: app_colors.background,
      body: SafeArea(
        child: Container(
          padding: kScreenHorizontalPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                child: Image(
                  height: 0.21 * screenHeight,
                  image: const AssetImage('images/check_box_outlined.png'),
                ),
              ),
              const SizedBox(height: 32),
              const HeaderTextSmallCentered(text: 'Password reset successful'),
              const SizedBox(height: 8),
              const DescriptionTextCentered(
                  text:
                      'Your password has been successfully reset.\nYou can now login to your account to continue.'),
              const SizedBox(height: 114),
              WideOutlinedButton(
                label: 'Go to Login',
                onPressedCallback: () {
                  Navigator.pushNamed(context, LoginScreen.id);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
