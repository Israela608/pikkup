import 'package:flutter/material.dart';
import 'package:pikkup/components/buttons/wide_button.dart';
import 'package:pikkup/components/buttons/wide_button_ash.dart';
import 'package:pikkup/components/text_field_boxes/password_box.dart';
import 'package:pikkup/config/themes/app_colors.dart' as app_colors;
import 'package:pikkup/screens/auth/change_password_two_screen.dart';
import 'package:pikkup/utils/dimensions.dart';
import 'package:pikkup/view_models/settings_page_view_models/change_password_one_view_model.dart';
import 'package:pikkup/widgets/error_message.dart';
import 'package:pikkup/widgets/scaffolds/standard_scaffold.dart';
import 'package:provider/provider.dart';

class ChangePasswordOneScreen extends StatefulWidget {
  const ChangePasswordOneScreen({Key? key}) : super(key: key);

  static const String id = '/change_password_one_screen';

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
    return StandardScaffold(
      title: 'Change Password',
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
          OldPasswordBoxWidget(textController: _oldPasswordController),
          SizedBox(height: Dimensions.d20),
          ErrorMessage(errorMessage: model.errorMessage),
          SizedBox(height: Dimensions.d80),
          const CompletedWideButton(),
        ],
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
