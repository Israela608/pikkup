import 'package:flutter/material.dart';
import 'package:pikkup/components/buttons/wide_button.dart';
import 'package:pikkup/components/buttons/wide_button_ash.dart';
import 'package:pikkup/components/text_field_boxes/password_box.dart';
import 'package:pikkup/components/texts/body_text.dart';
import 'package:pikkup/config/themes/app_colors.dart' as app_colors;
import 'package:pikkup/screens/dialog/change_password_successful_dialog_screen.dart';
import 'package:pikkup/utils/dimensions.dart';
import 'package:pikkup/view_models/settings_page_view_models/change_password_two_view_model.dart';
import 'package:pikkup/widgets/error_message.dart';
import 'package:pikkup/widgets/scaffolds/standard_scaffold.dart';
import 'package:provider/provider.dart';

class ChangePasswordTwoScreen extends StatefulWidget {
  const ChangePasswordTwoScreen({Key? key}) : super(key: key);

  static const String id = '/change_password_two_screen';

  @override
  State<ChangePasswordTwoScreen> createState() =>
      _ChangePasswordTwoScreenState();
}

class _ChangePasswordTwoScreenState extends State<ChangePasswordTwoScreen> {
  late final TextEditingController _newPasswordController;
  late final TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _newPasswordController = TextEditingController();
    _confirmPasswordController = TextEditingController();

    Provider.of<ChangePasswordTwoViewModel>(context, listen: false)
        .initialize();
  }

  @override
  void dispose() {
    super.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ChangePasswordTwoViewModel>(context);
    return StandardScaffold(
      title: 'Change Password',
      child: Form(
        key: model.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: Dimensions.d40),
            Center(
              child: Container(
                height: Dimensions.d150,
                width: Dimensions.d150,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: app_colors.tileBlue,
                ),
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.d40 + Dimensions.d3,
                    vertical: Dimensions.d30 + Dimensions.d7),
                child: const Image(
                    image: AssetImage('images/lock_picture.png'),
                    fit: BoxFit.contain),
              ),
            ),
            SizedBox(height: Dimensions.d40 + Dimensions.d6),
            const BodyText(
                text:
                    'Enter your new password you would like to use for your account'),
            SizedBox(height: Dimensions.d20),
            NewPasswordBoxWidget(textController: _newPasswordController),
            SizedBox(height: Dimensions.standardSpacing),
            ConfirmPasswordBoxWidget(
                textController: _confirmPasswordController),
            SizedBox(height: Dimensions.d10),
            ErrorMessage(errorMessage: model.errorMessage),
            SizedBox(height: Dimensions.d80),
            const ChangePasswordButton(),
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
    return Consumer<ChangePasswordTwoViewModel>(
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
            model.updateButton();
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
    return Consumer<ChangePasswordTwoViewModel>(
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
            model.updateButton();
          },
        );
      },
    );
  }
}

class ChangePasswordButton extends StatelessWidget {
  const ChangePasswordButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ChangePasswordTwoViewModel>(context);
    return !model.isCompleted
        ? const WideButtonAsh(label: 'Change Password')
        : WideButton(
            label: 'Change Password',
            onPressedCallback: () {
              debugPrint("Successful");
              //hasError = false;
              model.setHasError(hasError: false);
              // model.setNewPassword(newPassword: '');
              // model.setConfirmPassword(confirmPassword: '');

              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Aye!!"),
                duration: Duration(seconds: 2),
              ));

              //model.addErrorMessage();

              //Now upload the data to database
              Navigator.pushReplacementNamed(
                  context, ChangePasswordSuccessfulDialogScreen.id);
            },
          );
  }
}
