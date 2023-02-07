import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pikkup/components/location_ring.dart';
import 'package:pikkup/components/spacers/spacer.dart';
import 'package:pikkup/components/texts/plain_text.dart';
import 'package:pikkup/config/themes/app_colors.dart' as app_colors;
import 'package:pikkup/config/themes/decorations.dart';
import 'package:pikkup/config/themes/styles.dart';

class PickupAddressBox extends StatelessWidget {
  const PickupAddressBox({
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
        const TitleBoxSpacer(),
        TextFormField(
          controller: addressController,
          keyboardType: TextInputType.text,
          validator: validatorCallback,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          cursorColor: app_colors.primaryBlack,
          style: textFieldText,
          onChanged: onChangedCallback,
          decoration: textFieldDecoration.copyWith(
            prefixIcon: const FittedBox(
              fit: BoxFit.none,
              child: LocationRing(
                locationRingType: LocationRingType.pickup,
                locationRingSize: LocationRingSize.big,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
