import 'package:flutter/material.dart';
import 'package:pikkup/components/buttons/wide_button.dart';
import 'package:pikkup/components/spacer.dart';
import 'package:pikkup/components/texts/body_text.dart';
import 'package:pikkup/components/texts/header_text.dart';
import 'package:pikkup/screens/auth/create_account_screen.dart';
import 'package:pikkup/screens/auth/login_screen.dart';
import 'package:pikkup/utils/dimensions.dart';
import 'package:pikkup/widgets/scaffolds/plain_scaffold.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  static const String id = '/welcome_screen';

  @override
  Widget build(BuildContext context) {
    return PlainScaffold(
      isBackButtonPresent: false,
      isScrollable: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: Dimensions.d40 + Dimensions.d3),
          Image(
            width: Dimensions.d140 + Dimensions.d6,
            height: Dimensions.d30 + Dimensions.d8,
            image: const AssetImage('images/pikkup.png'),
          ),
          SizedBox(height: Dimensions.d150 + Dimensions.d3),
          const HeaderText(
            text: 'Welcome',
            headerTextSize: HeaderTextSize.big,
          ),
          SizedBox(height: Dimensions.d6),
          const BodyText(text: 'How do you wish to continue?'),
          SizedBox(height: Dimensions.d60 + Dimensions.d1),
          WideButton(
            label: 'Create an Account',
            onPressedCallback: () {
              Navigator.pushNamed(context, CreateAccountScreen.id);
            },
          ),
          const StandardSpacer(),
          WideButton(
            label: 'Log in',
            isOutlined: true,
            onPressedCallback: () {
              Navigator.pushNamed(context, LoginScreen.id);
            },
          ),
        ],
      ),
    );
  }
}
