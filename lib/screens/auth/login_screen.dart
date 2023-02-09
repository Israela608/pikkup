import 'package:flutter/material.dart';
import 'package:pikkup/components/buttons/wide_button.dart';
import 'package:pikkup/components/buttons/wide_button_ash.dart';
import 'package:pikkup/components/clickable_texts/clickable_text.dart';
import 'package:pikkup/components/spacer.dart';
import 'package:pikkup/components/texts/body_text.dart';
import 'package:pikkup/components/texts/header_text.dart';
import 'package:pikkup/components/texts/plain_text.dart';
import 'package:pikkup/screens/auth/create_account_screen.dart';
import 'package:pikkup/screens/auth/forgot_password_screen.dart';
import 'package:pikkup/screens/home/home_screen.dart';
import 'package:pikkup/utils/dimensions.dart';
import 'package:pikkup/widgets/error_message.dart';
import 'package:pikkup/widgets/scaffolds/plain_scaffold.dart';
import 'package:provider/provider.dart';

import '../../components/text_field_boxes/email_box.dart';
import '../../components/text_field_boxes/password_box.dart';
import '../../view_models/login_view_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const String id = '/login_screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();

    Provider.of<LoginViewModel>(context, listen: false).initialize();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<LoginViewModel>(context);
    return PlainScaffold(
        child: Form(
      key: model.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const StandardSpacer(),
          const HeaderText(text: 'Log in to your account'),
          const TitleBodySpacer(),
          const BodyText(
              text: 'You are one step away from accessing your pikkup account'),
          SizedBox(height: Dimensions.d26),
          EmailBoxWidget(textController: _emailController),
          const StandardSpacer(),
          PasswordBoxWidget(textController: _passwordController),
          SizedBox(height: Dimensions.d20),
          ErrorMessage(errorMessage: model.errorMessage),
          SizedBox(height: Dimensions.d4),
          const ForgotPassword(),
          SizedBox(height: Dimensions.d32),
          const LoginButton(),
          SizedBox(height: Dimensions.d48),
          const MixedText(),
        ],
      ),
    ));
  }
}

class EmailBoxWidget extends StatelessWidget {
  const EmailBoxWidget({Key? key, required this.textController})
      : super(key: key);
  final dynamic textController;

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginViewModel>(
      builder: (BuildContext context, model, Widget? child) {
        return EmailBox(
          emailController: textController,
          validatorCallback: (value) {
            return model.emailValidator(emailValue: value!);
          },
          onChangedCallback: (value) {
            //Logic
            //Do something with the user input.
            model.setEmail(email: value);
          },
        );
      },
    );
  }
}

class PasswordBoxWidget extends StatelessWidget {
  const PasswordBoxWidget({Key? key, required this.textController})
      : super(key: key);
  final dynamic textController;

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginViewModel>(
      builder: (BuildContext context, model, Widget? child) {
        return PasswordBox(
          text: 'Password',
          passwordController: textController,
          isObscure: model.isPasswordObscure,
          validatorCallback: (value) {
            return model.passwordValidator(passwordValue: value!);
          },
          onPressedCallback: () {
            model.togglePasswordObscure();
          },
          onChangedCallback: (value) {
            //Logic
            //Do something with the user input.
            model.setPassword(password: value);
          },
        );
      },
    );
  }
}

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        WidgetSpan(
          child: ClickableText(
            text: 'Forgot your Password?',
            isNormalBlack: true,
            onPressed: () {
              Navigator.pushNamed(context, ForgotPasswordScreen.id);
            },
          ),
        )
      ]),
    );
  }
}

class MixedText extends StatelessWidget {
  const MixedText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          const WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: PlainText(text: 'Don\'t have an account?'),
          ),
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: ClickableText(
              text: ' Create account ',
              isBold: true,
              onPressed: () {
                Navigator.pushNamed(context, CreateAccountScreen.id);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<LoginViewModel>(context);
    return !model.isCompleted
        ? const WideButtonAsh(label: 'Log in')
        : WideButton(
            label: 'Log in',
            onPressedCallback: () {
              debugPrint("Successful");
              model.addErrorMessage();

              //Now upload the data to database
              Navigator.pushReplacementNamed(context, HomeScreen.id);
            },
          );
  }
}
