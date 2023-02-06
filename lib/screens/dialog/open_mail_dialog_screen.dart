import 'package:flutter/material.dart';
import 'package:pikkup/components/buttons/wide_button.dart';
import 'package:pikkup/components/texts/body_text.dart';
import 'package:pikkup/components/texts/header_text.dart';
import 'package:pikkup/widgets/scaffolds/plain_scaffold.dart';

class OpenMailDialogScreen extends StatelessWidget {
  const OpenMailDialogScreen({Key? key}) : super(key: key);

  static const String id = 'open_mail_dialog_screen';

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return PlainScaffold(
        isScrollable: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 0.1 * screenHeight),
            Flexible(
              child: Image(
                height: 0.21 * screenHeight,
                image: const AssetImage('images/mail_box.png'),
              ),
            ),
            const SizedBox(height: 32),
            const HeaderText(
              text: 'We\'ve sent you a mail',
              headerTextSize: HeaderTextSize.small,
              isCentered: true,
            ),
            const SizedBox(height: 8),
            const BodyText(
              text:
                  'Check your mail and follow the instructions to reset your password.',
              isCentered: true,
            ),
            const SizedBox(height: 114),
            WideButton(
              label: 'Open Mail app',
              isOutlined: true,
              onPressedCallback: () {},
            )
          ],
        ));
  }
}
