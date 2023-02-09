import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:pikkup/components/buttons/wide_button.dart';
import 'package:pikkup/components/buttons/wide_button_ash.dart';
import 'package:pikkup/components/clickable_texts/clickable_text.dart';
import 'package:pikkup/components/spacer.dart';
import 'package:pikkup/components/text_field_boxes/email_box.dart';
import 'package:pikkup/components/text_field_boxes/password_box.dart';
import 'package:pikkup/components/text_field_boxes/phone_number_box.dart';
import 'package:pikkup/components/text_field_boxes/text_box.dart';
import 'package:pikkup/components/texts/body_text.dart';
import 'package:pikkup/components/texts/header_text.dart';
import 'package:pikkup/components/texts/plain_text.dart';
import 'package:pikkup/config/themes/app_colors.dart' as app_colors;
import 'package:pikkup/config/themes/styles.dart';
import 'package:pikkup/screens/auth/login_screen.dart';
import 'package:pikkup/screens/auth/verify_number_screen.dart';
import 'package:pikkup/utils/dimensions.dart';
import 'package:pikkup/view_models/create_account_view_model.dart';
import 'package:pikkup/widgets/error_message.dart';
import 'package:pikkup/widgets/scaffolds/plain_scaffold.dart';
import 'package:provider/provider.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  static const String id = '/create_account_screen';

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneNumberController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneNumberController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();

    Provider.of<CreateAccountViewModel>(context, listen: false).initialize();
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PlainScaffold(
      child: Consumer<CreateAccountViewModel>(
          builder: (BuildContext context, model, Widget? child) {
        return Form(
          key: model.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const HeaderText(text: 'Create an account'),
              const TitleBodySpacer(),
              const BodyText(
                  text:
                      'Enter your personal details to help setup your account'),
              SizedBox(height: Dimensions.d26),
              NameBoxWidget(textController: _nameController),
              const StandardSpacer(),
              EmailBoxWidget(textController: _emailController),
              const StandardSpacer(),
              PhoneNumberBoxWidget(textController: _phoneNumberController),
              const StandardSpacer(),
              PasswordBoxWidget(textController: _passwordController),
              const StandardSpacer(),
              ConfirmPasswordBoxWidget(
                  textController: _confirmPasswordController),
              SizedBox(height: Dimensions.d20),
              ErrorMessage(errorMessage: model.errorMessage),
              SizedBox(height: Dimensions.d20),
              const MixedTextFirst(),
              SizedBox(height: Dimensions.d48),
              const CreateAccountButton(),
              SizedBox(height: Dimensions.d32),
              const MixedTextSecond(),
              SizedBox(height: Dimensions.d40 + Dimensions.d2),
            ],
          ),
        );
      }),
    );
  }
}

class NameBoxWidget extends StatelessWidget {
  const NameBoxWidget({Key? key, required this.textController})
      : super(key: key);
  final dynamic textController;

  @override
  Widget build(BuildContext context) {
    return Consumer<CreateAccountViewModel>(
      builder: (BuildContext context, model, Widget? child) {
        return TextBox(
          text: 'Name',
          textController: textController,
          validatorCallback: (value) {
            return model.nameValidator(nameValue: value!);
          },
          onChangedCallback: (value) {
            //Logic
            //Do something with the user input.
            model.setName(name: value);
          },
        );
      },
    );
  }
}

class EmailBoxWidget extends StatelessWidget {
  const EmailBoxWidget({Key? key, required this.textController})
      : super(key: key);
  final dynamic textController;

  @override
  Widget build(BuildContext context) {
    return Consumer<CreateAccountViewModel>(
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

class PhoneNumberBoxWidget extends StatelessWidget {
  const PhoneNumberBoxWidget({Key? key, required this.textController})
      : super(key: key);
  final dynamic textController;

  @override
  Widget build(BuildContext context) {
    return Consumer<CreateAccountViewModel>(
        builder: (BuildContext context, model, Widget? child) {
      return PhoneNumberBox(
        numberController: textController,
        onValidatedCallback: (bool value) {
          debugPrint(
              value.toString()); //true if input is validated, false if not
          model.phoneNumberValidator(isPhoneNumberValidated: value);
        },
        onChangedCallback: (PhoneNumber number) {
          debugPrint(number.phoneNumber);
          model.setPhoneNumber(number: number);
        },
      );
    });
  }
}

class PasswordBoxWidget extends StatelessWidget {
  const PasswordBoxWidget({Key? key, required this.textController})
      : super(key: key);
  final dynamic textController;

  @override
  Widget build(BuildContext context) {
    return Consumer<CreateAccountViewModel>(
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

class ConfirmPasswordBoxWidget extends StatelessWidget {
  const ConfirmPasswordBoxWidget({Key? key, required this.textController})
      : super(key: key);
  final dynamic textController;

  @override
  Widget build(BuildContext context) {
    return Consumer<CreateAccountViewModel>(
      builder: (BuildContext context, model, Widget? child) {
        return PasswordBox(
          text: 'Confirm Password',
          passwordController: textController,
          isObscure: model.isConfirmPasswordObscure,
          validatorCallback: (value) {
            return model.confirmPasswordValidator(
              passwordValue: value!,
            );
          },
          onPressedCallback: () {
            model.toggleConfirmPasswordObscure();
          },
          onChangedCallback: (value) {
            //Logic
            //Do something with the user input.
            model.setConfirmPassword(confirmPassword: value);
          },
        );
      },
    );
  }
}

class MixedTextFirst extends StatelessWidget {
  const MixedTextFirst({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          const WidgetSpan(child: BodyText(text: 'By clicking ')),
          TextSpan(
            text: '“Create Account”, ',
            style: interNormalBoldText.copyWith(color: app_colors.description),
          ),
          const WidgetSpan(child: BodyText(text: ' you agree to the ')),
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: ClickableText(
              text: 'Terms and conditions',
              onPressed: () {
                debugPrint('Terms and conditions');
              },
            ),
          ),
          const WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: BodyText(text: ' and '),
          ),
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: ClickableText(
              text: 'Privacy policy',
              onPressed: () {
                debugPrint('Privacy policy');
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MixedTextSecond extends StatelessWidget {
  const MixedTextSecond({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          const WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: PlainText(text: 'Already have an account?'),
          ),
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: ClickableText(
              text: ' Log in ',
              isBold: true,
              onPressed: () {
                debugPrint('Log in');
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ConfirmButtonWidget extends StatelessWidget {
  const ConfirmButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<CreateAccountViewModel>(context);
    return !model.isCompleted
        ? const WideButtonAsh(label: 'Confirm Email')
        : WideButton(
            label: 'Confirm Email',
            onPressedCallback: () {
              Navigator.pushReplacementNamed(context, VerifyNumberScreen.id);
            },
          );
  }
}

class CreateAccountButton extends StatelessWidget {
  const CreateAccountButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<CreateAccountViewModel>(context);
    return !model.isCompleted
        ? const WideButtonAsh(label: 'Create Account')
        : WideButton(
            label: 'Create Account',
            onPressedCallback: () {
              model.addErrorMessage();

              //Now upload the data to database
              Navigator.pushReplacementNamed(context, VerifyNumberScreen.id);
            },
          );
  }
}
