import 'package:flutter/material.dart';
import 'package:pikkup/components/buttons/wide_button.dart';
import 'package:pikkup/components/buttons/wide_button_ash.dart';
import 'package:pikkup/components/texts/body_text.dart';
import 'package:pikkup/components/texts/header_text.dart';
import 'package:pikkup/screens/dialog/reset_password_successful_dialog_screen.dart';
import 'package:pikkup/view_models/reset_password_view_model.dart';
import 'package:pikkup/widgets/scaffolds/plain_scaffold.dart';
import 'package:provider/provider.dart';

import '../../components/text_field_boxes/password_box.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  static const String id = 'reset_password_screen';

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  late final TextEditingController _newPasswordController;
  late final TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _newPasswordController = TextEditingController();
    _confirmPasswordController = TextEditingController();

    Provider.of<ResetPasswordViewModel>(context, listen: false).initialize();
  }

  @override
  void dispose() {
    super.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ResetPasswordViewModel>(context);
    return PlainScaffold(
      child: Form(
        key: model.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 24),
            const HeaderText(text: 'Reset Password'),
            const SizedBox(height: 8),
            const BodyText(
                text:
                    'Enter your new password you would like to use for your account'),
            const SizedBox(height: 26),
            NewPasswordBoxWidget(textController: _newPasswordController),
            const SizedBox(height: 24),
            ConfirmPasswordBoxWidget(
                textController: _confirmPasswordController),
            const SizedBox(height: 72),
            const ResetPasswordButton(),
          ],
        ),
      ),
    );
  }
}

class NewPasswordBoxWidget extends StatelessWidget {
  const NewPasswordBoxWidget({Key? key, required this.textController})
      : super(key: key);
  final dynamic textController;

  @override
  Widget build(BuildContext context) {
    return Consumer<ResetPasswordViewModel>(
      builder: (BuildContext context, model, Widget? child) {
        return PasswordBox(
          text: 'New Password',
          passwordController: textController,
          isObscure: model.isNewPasswordObscure,
          validatorCallback: (value) {
            return model.newPasswordValidator(passwordValue: value!);
          },
          onPressedCallback: () {
            model.toggleNewPasswordObscure();
          },
          onChangedCallback: (value) {
            //Logic
            //Do something with the user input.
            model.setNewPassword(newPassword: value);
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
    return Consumer<ResetPasswordViewModel>(
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

class ResetPasswordButton extends StatelessWidget {
  const ResetPasswordButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ResetPasswordViewModel>(context);
    return !model.isCompleted
        ? const WideButtonAsh(label: 'Reset Password')
        : WideButton(
            label: 'Create Account',
            onPressedCallback: () {
              debugPrint("Successful");

              //Now upload the data to database
              Navigator.pushNamed(
                  context, ResetPasswordSuccessfulDialogScreen.id);
            },
          );
  }
}
