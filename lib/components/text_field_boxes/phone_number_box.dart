import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:pikkup/components/texts/plain_text.dart';
import 'package:pikkup/utils/app_colors.dart' as app_colors;
import 'package:pikkup/utils/constants.dart';

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
        const SizedBox(height: 10),
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
            selectorConfig: const SelectorConfig(
              selectorType: PhoneInputSelectorType.DIALOG,
              setSelectorButtonAsPrefixIcon: true,
              leadingPadding: 20,
            ),
            ignoreBlank: false,
            autoValidateMode: AutovalidateMode.onUserInteraction,
            cursorColor: app_colors.primaryBlack,
            selectorTextStyle: const TextStyle(color: app_colors.primaryBlack),
            initialValue: number,
            textFieldController: numberController,
            formatInput: false,
            keyboardType: const TextInputType.numberWithOptions(
                signed: true, decimal: true),
            inputBorder: const OutlineInputBorder(),
            onSaved: (PhoneNumber number) {
              debugPrint('On Saved: $number');
            },
            inputDecoration: kTextFieldDecoration),

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
