import 'package:flutter/material.dart';
import 'package:pikkup/components/buttons/wide_button.dart';
import 'package:pikkup/components/texts/header_text.dart';
import 'package:pikkup/screens/home/home_screen.dart';
import 'package:pikkup/utils/dimensions.dart';
import 'package:pikkup/view_models/home_view_model.dart';
import 'package:pikkup/widgets/scaffolds/plain_scaffold.dart';
import 'package:provider/provider.dart';

class ChangePasswordSuccessfulDialogScreen extends StatelessWidget {
  const ChangePasswordSuccessfulDialogScreen({Key? key}) : super(key: key);

  static const String id = '/change_password_successful_dialog_screen';

  @override
  Widget build(BuildContext context) {
    return PlainScaffold(
      isScrollable: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flexible(
            child: Image(
              height: 0.238 * Dimensions.screenHeight,
              image: const AssetImage('images/success_image.png'),
            ),
          ),
          Flexible(
            child: Image(
              height: 0.135 * Dimensions.screenHeight,
              image: const AssetImage('images/check_box_outlined.png'),
            ),
          ),
          SizedBox(height: 0.085 * Dimensions.screenHeight),
          const HeaderText(
            text: 'You’ve changed your password',
            headerTextSize: HeaderTextSize.small,
            isCentered: true,
          ),
          SizedBox(height: 0.14 * Dimensions.screenHeight),
          WideButton(
            label: 'Back to settings',
            isOutlined: true,
            onPressedCallback: () {
              Navigator.pushNamed(context, HomeScreen.id);
              Provider.of<HomeViewModel>(context, listen: false)
                  .setCurrentIndex(currentIndex: 3); //Go to Settings page
            },
          )
        ],
      ),
    );
  }
}
