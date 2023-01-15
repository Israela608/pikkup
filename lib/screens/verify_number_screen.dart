import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pikkup/components/buttons/wide_button.dart';
import 'package:pikkup/components/buttons/wide_button_ash.dart';
import 'package:pikkup/components/clickable_texts/clickable_text_bold.dart';
import 'package:pikkup/components/texts/description_text.dart';
import 'package:pikkup/components/texts/header_text.dart';
import 'package:pikkup/screens/login_screen.dart';
import 'package:pikkup/utils/app_colors.dart' as app_colors;
import 'package:pikkup/utils/constants.dart';
import 'package:pikkup/view_models/verify_number_view_model.dart';
import 'package:pikkup/widgets/blended_app_bar.dart';
import 'package:pikkup/widgets/error_message.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

class VerifyNumberScreen extends StatefulWidget {
  const VerifyNumberScreen({Key? key}) : super(key: key);

  static const String id = 'verify_number_screen';

  @override
  State<VerifyNumberScreen> createState() => _VerifyNumberScreenState();
}

class _VerifyNumberScreenState extends State<VerifyNumberScreen> {
  late StreamController<ErrorAnimationType> _errorController;

  @override
  void initState() {
    Provider.of<VerifyNumberViewModel>(context, listen: false).initialize();
    _errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    _errorController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<VerifyNumberViewModel>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: app_colors.background,
        appBar: BlendedAppBar(),
        body: Container(
          padding: kScreenHorizontalPadding,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 30),
                const HeaderText(text: 'Verify your Email'),
                const SizedBox(height: 8),
                const MixedTextOne(),
                const SizedBox(height: 37),
                PinCodeWidget(errorController: _errorController),
                const SizedBox(height: 20),
                ErrorMessage(errorMessage: model.errorMessage),
                const SizedBox(height: 20),
                const MixedTextTwo(),
                const SizedBox(height: 125),
                CompletedWideButton(
                  errorController: _errorController,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PinCodeWidget extends StatelessWidget {
  const PinCodeWidget({Key? key, required this.errorController})
      : super(key: key);
  final dynamic errorController;

  @override
  Widget build(BuildContext context) {
    return Consumer<VerifyNumberViewModel>(
        builder: (BuildContext context, model, Widget? child) {
      return PinCodeTextField(
        appContext: context,
        pastedTextStyle: TextStyle(
          color: Colors.green.shade600,
          fontWeight: FontWeight.bold,
        ),
        length: 6,
        obscureText: false,
        obscuringCharacter: '*',
        animationType: AnimationType.fade,
        // validator: (v) {
        // },
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(5),
          fieldHeight: 56,
          fieldWidth: 47,
          borderWidth: 1,
          activeFillColor: model.hasError ? Colors.orange : app_colors.fillAsh,
          inactiveFillColor: Colors.transparent,
          selectedFillColor: Colors.transparent,
          activeColor: app_colors.primaryBlueDark,
          inactiveColor: app_colors.borderAsh,
          selectedColor: app_colors.primaryBlueDark,
        ),
        cursorColor: app_colors.primaryBlack,
        animationDuration: const Duration(milliseconds: 200),
        textStyle: const TextStyle(
            fontSize: 20,
            height: 1.5,
            fontWeight: FontWeight.w600,
            fontFamily: 'Sora'),
        backgroundColor: Colors.transparent,
        enableActiveFill: true,
        autoFocus: true,
        errorAnimationController: errorController,
        //controller: textEditingController,
        keyboardType: TextInputType.number,
        onCompleted: (v) {
          //When all boxes are filled
          debugPrint("Completed");
        },
        onTap: () {
          debugPrint("Pressed");

          model.setHasError(hasError: false);
        },
        onChanged: (value) {
          debugPrint(value);

          model.setCodeText(codeInput: value);
          model.changeButton();
        },
        beforeTextPaste: (text) {
          debugPrint("Allowing to paste $text");
          //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
          //but you can show anything you want here, like your pop up saying wrong paste format or etc
          return true;
        },
      );
    });
  }
}

class MixedTextOne extends StatelessWidget {
  const MixedTextOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
        children: [
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: DescriptionText(text: 'Enter the code sent to '),
          ),
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: Text(
              'dav****pe@gmail.com',
              //'+234 **** 3456',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                fontFamily: 'Inter',
                color: app_colors.primaryBlack,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MixedTextTwo extends StatelessWidget {
  const MixedTextTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          const WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: DescriptionText(text: 'Didn\'t receive any code?'),
          ),
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: ClickableTextBold(
              text: ' Resend ',
              onPressed: () {
                debugPrint('Resending the code');
                //Resend the code
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CompletedWideButton extends StatelessWidget {
  const CompletedWideButton({Key? key, required this.errorController})
      : super(key: key);
  final dynamic errorController;

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<VerifyNumberViewModel>(context);
    if (!model.isCompleted) {
      return const WideButtonAsh(label: 'Verify Email');
    }
    return WideButton(
      label: 'Verify Email',
      onPressedCallback: () {
        if (model.codeIsCorrect) {
          debugPrint("Successful");
          model.setHasError(hasError: false);

          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Aye!!"),
            duration: Duration(seconds: 2),
          ));

          //model.addErrorMessage();

          //Now upload the data to database
          Navigator.pushReplacementNamed(context, LoginScreen.id);

          return;
        } else {
          debugPrint("Unsuccessful");

          errorController.add(
              ErrorAnimationType.shake); // Triggering error shake animation
          model.setHasError(hasError: true);
        }
      },
    );
  }
}
