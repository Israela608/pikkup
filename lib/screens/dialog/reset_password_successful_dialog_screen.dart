import 'package:flutter/material.dart';
import 'package:pikkup/components/buttons/wide_button.dart';
import 'package:pikkup/components/spacer.dart';
import 'package:pikkup/components/texts/body_text.dart';
import 'package:pikkup/components/texts/header_text.dart';
import 'package:pikkup/screens/auth/login_screen.dart';
import 'package:pikkup/utils/dimensions.dart';
import 'package:pikkup/widgets/scaffolds/plain_scaffold.dart';

class ResetPasswordSuccessfulDialogScreen extends StatelessWidget {
  const ResetPasswordSuccessfulDialogScreen({Key? key}) : super(key: key);

  static const String id = '/reset_password_successful_dialog_screen';

  @override
  Widget build(BuildContext context) {
    return PlainScaffold(
      isBackButtonPresent: false,
      isScrollable: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flexible(
            child: Image(
              height: 0.21 * Dimensions.screenHeight,
              image: const AssetImage('images/check_box_outlined.png'),
            ),
          ),
          SizedBox(height: Dimensions.d32),
          const HeaderText(
            text: 'Password reset successful',
            headerTextSize: HeaderTextSize.small,
            isCentered: true,
          ),
          const TitleBodySpacer(),
          const BodyText(
            text:
                'Your password has been successfully reset.\nYou can now login to your account to continue.',
            isCentered: true,
          ),
          SizedBox(height: Dimensions.d100 + Dimensions.d10 + Dimensions.d4),
          WideButton(
            label: 'Go to Login',
            isOutlined: true,
            onPressedCallback: () {
              Navigator.pushNamed(context, LoginScreen.id);
            },
          )
        ],
      ),
    );
  }
}
