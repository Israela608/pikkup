import 'package:flutter/material.dart';
import 'package:pikkup/components/buttons/wide_button.dart';
import 'package:pikkup/components/buttons/wide_outlined_button.dart';
import 'package:pikkup/components/texts/description_text.dart';
import 'package:pikkup/screens/create_account_screen.dart';
import 'package:pikkup/screens/login_screen.dart';
import 'package:pikkup/utils/app_colors.dart' as app_colors;

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  static const String id = 'welcome_screen';

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: app_colors.background,
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),
              const Image(
                  width: 146,
                  height: 38,
                  image: AssetImage('images/pikkup.png')),
              const SizedBox(height: 150),
              const Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Sora',
                  color: app_colors.primaryBlack,
                ),
              ),
              const SizedBox(height: 10),
              const DescriptionText(text: 'How do you wish to continue?'),
              const SizedBox(height: 60),
              WideButton(
                label: 'Create an Account',
                onPressedCallback: () {
                  Navigator.pushNamed(context, CreateAccountScreen.id);
                },
              ),
              const SizedBox(height: 20),
              WideOutlinedButton(
                label: 'Log in',
                onPressedCallback: () {
                  Navigator.pushNamed(context, LoginScreen.id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
