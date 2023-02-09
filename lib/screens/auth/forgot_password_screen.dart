import 'package:flutter/material.dart';
import 'package:pikkup/components/buttons/wide_button.dart';
import 'package:pikkup/components/buttons/wide_button_ash.dart';
import 'package:pikkup/components/spacer.dart';
import 'package:pikkup/components/text_field_boxes/email_box.dart';
import 'package:pikkup/components/texts/body_text.dart';
import 'package:pikkup/components/texts/header_text.dart';
import 'package:pikkup/screens/dialog/open_mail_dialog_screen.dart';
import 'package:pikkup/utils/dimensions.dart';
import 'package:pikkup/view_models/forgot_password_view_model.dart';
import 'package:pikkup/widgets/scaffolds/plain_scaffold.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  static const String id = '/forgot_password_screen';

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late final TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();

    Provider.of<ForgotPasswordViewModel>(context, listen: false).initialize();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PlainScaffold(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const StandardSpacer(),
        const HeaderText(text: 'Forgot Password'),
        const TitleBodySpacer(),
        const BodyText(
            text:
                'Enter the email used in registration to reset your password, we will send you instructions'),
        SizedBox(height: Dimensions.d26),
        EmailBoxWidget(textController: _emailController),
        SizedBox(height: Dimensions.d80),
        const ConfirmEmailButton(),
      ],
    ));
  }
}

class EmailBoxWidget extends StatelessWidget {
  const EmailBoxWidget({Key? key, required this.textController})
      : super(key: key);
  final dynamic textController;

  @override
  Widget build(BuildContext context) {
    return Consumer<ForgotPasswordViewModel>(
      builder: (BuildContext context, model, Widget? child) {
        return Form(
          key: model.formKey,
          child: EmailBox(
            emailController: textController,
            validatorCallback: (value) {
              return model.emailValidator(emailValue: value!);
            },
            onChangedCallback: (value) {
              //Logic
              //Do something with the user input.
              model.setEmail(email: value);
              model.updateButton();
            },
          ),
        );
      },
    );
  }
}

class ConfirmEmailButton extends StatelessWidget {
  const ConfirmEmailButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ForgotPasswordViewModel>(context);
    return !model.isCompleted
        ? const WideButtonAsh(label: 'Confirm Email')
        : WideButton(
            label: 'Create Account',
            onPressedCallback: () {
              debugPrint("Successful");
              Navigator.pushNamed(context, OpenMailDialogScreen.id);
            },
          );
  }
}
