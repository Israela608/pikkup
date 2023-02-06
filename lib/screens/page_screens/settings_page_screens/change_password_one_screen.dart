import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/utils/unfocuser.dart';
import 'package:pikkup/components/buttons/wide_button.dart';
import 'package:pikkup/components/buttons/wide_button_ash.dart';
import 'package:pikkup/components/text_field_boxes/password_box.dart';
import 'package:pikkup/config/themes/app_colors.dart' as app_colors;
import 'package:pikkup/config/themes/decorations.dart';
import 'package:pikkup/screens/page_screens/settings_page_screens/change_password_two_screen.dart';
import 'package:pikkup/view_models/settings_page_view_models/change_password_one_view_model.dart';
import 'package:pikkup/widgets/error_message.dart';
import 'package:pikkup/widgets/standard_app_bar.dart';
import 'package:provider/provider.dart';

class ChangePasswordOneScreen extends StatefulWidget {
  const ChangePasswordOneScreen({Key? key}) : super(key: key);

  static const String id = 'change_password_one_screen';

  @override
  State<ChangePasswordOneScreen> createState() =>
      _ChangePasswordOneScreenState();
}

class _ChangePasswordOneScreenState extends State<ChangePasswordOneScreen> {
  late final TextEditingController _oldPasswordController;

  @override
  void initState() {
    super.initState();
    _oldPasswordController = TextEditingController();

    Provider.of<ChangePasswordOneViewModel>(context, listen: false)
        .initialize();
  }

  @override
  void dispose() {
    super.dispose();
    _oldPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ChangePasswordOneViewModel>(context);
    return Unfocuser(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: app_colors.background,
          appBar: StandardAppBar(
            title: 'Change Password',
          ),
          body: Container(
            padding: kScreenHorizontalPadding,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 40),
                  Center(
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: app_colors.tileBlue,
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 43, vertical: 37),
                      child: const Image(
                          image: AssetImage('images/lock_picture.png'),
                          fit: BoxFit.contain),
                    ),
                  ),
                  const SizedBox(height: 46),
                  OldPasswordBoxWidget(textController: _oldPasswordController),
                  const SizedBox(height: 20),
                  ErrorMessage(errorMessage: model.errorMessage),
                  const SizedBox(height: 80),
                  const CompletedWideButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class OldPasswordBoxWidget extends StatelessWidget {
  const OldPasswordBoxWidget({Key? key, required this.textController})
      : super(key: key);
  final dynamic textController;

  @override
  Widget build(BuildContext context) {
    return Consumer<ChangePasswordOneViewModel>(
      builder: (BuildContext context, model, Widget? child) {
        return Form(
          key: model.formKey,
          child: PasswordBox(
            text: 'Enter Old Password',
            passwordController: textController,
            isObscure: model.isOldPasswordObscure,
            validatorCallback: (value) {
              return model.oldPasswordValidator(passwordValue: value!);
            },
            onPressedCallback: () {
              model.toggleOldPasswordObscure();
            },
            onChangedCallback: (value) {
              //Logic
              //Do something with the user input.
              model.setOldPassword(oldPassword: value);
              model.updateButton();
            },
          ),
        );
      },
    );
  }
}

class CompletedWideButton extends StatelessWidget {
  const CompletedWideButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ChangePasswordOneViewModel>(context);
    return !model.isCompleted
        ? const WideButtonAsh(label: 'Verify Password')
        : WideButton(
            label: 'Verify Password',
            onPressedCallback: () {
              if (model.isCorrectPassword) {
                debugPrint("Successful");
                //hasError = false;
                model.setHasError(hasError: false);

                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Aye!!"),
                  duration: Duration(seconds: 2),
                ));

                //model.addErrorMessage();

                //Now upload the data to database
                Navigator.pushReplacementNamed(
                    context, ChangePasswordTwoScreen.id);
                return;
              } else {
                debugPrint("Unsuccessful");
                model.setHasError(hasError: true);
              }
            },
          );
  }
}
