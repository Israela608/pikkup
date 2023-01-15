import 'package:flutter/material.dart';
import 'package:pikkup/components/destination_ring_big.dart';
import 'package:pikkup/components/texts/plain_text.dart';
import 'package:pikkup/utils/app_colors.dart' as app_colors;
import 'package:pikkup/utils/constants.dart';

class DestinationAddressBox extends StatelessWidget {
  const DestinationAddressBox({
    Key? key,
    required this.text,
    required this.addressController,
    required this.validatorCallback,
    required this.onPressedCallback,
    required this.onChangedCallback,
  }) : super(key: key);

  final String text;
  final TextEditingController addressController;
  final dynamic validatorCallback;
  final dynamic onPressedCallback;
  final dynamic onChangedCallback;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PlainText(text: text),
        const SizedBox(height: 10),
        TextFormField(
            //expands: true,
            //minLines: null,
            //maxLines: null,
            controller: addressController,
            keyboardType: TextInputType.text,
            validator: validatorCallback,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            cursorColor: app_colors.primaryBlack,
            style: const TextStyle(color: app_colors.primaryBlack),
            onChanged: onChangedCallback,
            decoration: kTextFieldDecoration.copyWith(
              prefixIcon: const FittedBox(
                  fit: BoxFit.none, child: DestinationRingBig()),
            )
            // .copyWith(
            //     hintText:
            //     'Enter your email'), //We use copyWith to overwrite the text in the hintText:
            ),
      ],
    );
  }
}
