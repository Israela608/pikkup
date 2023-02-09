import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:pikkup/components/spacer.dart';
import 'package:pikkup/components/texts/plain_text.dart';
import 'package:pikkup/config/themes/app_colors.dart' as app_colors;
import 'package:pikkup/config/themes/decorations.dart';
import 'package:pikkup/config/themes/styles.dart';
import 'package:pikkup/utils/dimensions.dart';

class PhoneNumberBox extends StatelessWidget {
  const PhoneNumberBox({
    Key? key,
    required this.numberController,
    required this.onValidatedCallback,
    required this.onChangedCallback,
  }) : super(key: key);

  final TextEditingController numberController;
  final dynamic onValidatedCallback;
  final dynamic onChangedCallback;

  @override
  Widget build(BuildContext context) {
    String initialCountry = 'NG';
    PhoneNumber number = PhoneNumber(isoCode: 'NG'); //Initial Country code

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PlainText(text: 'Phone number'),
        const TitleBodySpacer(),
        InternationalPhoneNumberInput(
            onInputChanged: onChangedCallback,
            onInputValidated: onValidatedCallback,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please Enter Phone Number';
              }
              if ((value.length == 10 && !value.startsWith('0')) ||
                  (value.length == 11 && value.startsWith('0'))) {
                return null;
              }
              /*if ((value.length == 10 && value[0] != '0') ||
                  (value.length == 11 && value[0] == '0')) {
                return null;
              }*/
              return 'Invalid number';
            },
            selectorConfig: SelectorConfig(
              selectorType: PhoneInputSelectorType.DIALOG,
              setSelectorButtonAsPrefixIcon: true,
              leadingPadding: Dimensions.d20,
            ),
            ignoreBlank: false,
            autoValidateMode: AutovalidateMode.onUserInteraction,
            cursorColor: app_colors.primaryBlack,
            selectorTextStyle: textFieldText,
            initialValue: number,
            textFieldController: numberController,
            formatInput: false,
            keyboardType: const TextInputType.numberWithOptions(
                signed: true, decimal: true),
            inputBorder: const OutlineInputBorder(),
            onSaved: (PhoneNumber number) {
              debugPrint('On Saved: $number');
            },
            inputDecoration: textFieldDecoration),

        /*
        ElevatedButton(
          onPressed: () {
            getPhoneNumber('+15417543010');
          },
          child: const Text('Update'),
        ),
        ElevatedButton(
          onPressed: () {
            formKey.currentState.save();
          },
          child: const Text('Save'),
        ),*/
      ],
    );
  }
}
