import 'package:flutter/material.dart';
import 'package:pikkup/components/buttons/wide_button.dart';
import 'package:pikkup/components/spacer.dart';
import 'package:pikkup/components/texts/body_text.dart';
import 'package:pikkup/components/texts/header_text.dart';
import 'package:pikkup/utils/dimensions.dart';
import 'package:pikkup/widgets/scaffolds/plain_scaffold.dart';

class OpenMailDialogScreen extends StatelessWidget {
  const OpenMailDialogScreen({Key? key}) : super(key: key);

  static const String id = '/open_mail_dialog_screen';

  @override
  Widget build(BuildContext context) {
    return PlainScaffold(
        isScrollable: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 0.1 * Dimensions.screenHeight),
            Flexible(
              child: Image(
                height: 0.21 * Dimensions.screenHeight,
                image: const AssetImage('images/mail_box.png'),
              ),
            ),
            SizedBox(height: Dimensions.d32),
            const HeaderText(
              text: 'We\'ve sent you a mail',
              headerTextSize: HeaderTextSize.small,
              isCentered: true,
            ),
            const TitleBodySpacer(),
            const BodyText(
              text:
                  'Check your mail and follow the instructions to reset your password.',
              isCentered: true,
            ),
            SizedBox(height: Dimensions.d100 + Dimensions.d10 + Dimensions.d4),
            WideButton(
              label: 'Open Mail app',
              isOutlined: true,
              onPressedCallback: () {},
            )
          ],
        ));
  }
}
