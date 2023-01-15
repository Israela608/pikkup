import 'package:flutter/material.dart';
import 'package:pikkup/screens/home_screen.dart';
import 'package:pikkup/utils/app_colors.dart' as app_colors;
import 'package:pikkup/utils/constants.dart';
import 'package:pikkup/view_models/home_view_model.dart';
import 'package:pikkup/widgets/blended_app_bar.dart';
import 'package:provider/provider.dart';

import '../../components/buttons/wide_outlined_button.dart';
import '../../components/texts/header_text_small_centered.dart';

class ChangePasswordSuccessfulDialogScreen extends StatelessWidget {
  const ChangePasswordSuccessfulDialogScreen({Key? key}) : super(key: key);

  static const String id = 'change_password_successful_dialog_screen';

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: app_colors.background,
        appBar: BlendedAppBar(),
        body: Container(
          padding: kScreenHorizontalPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                child: Image(
                  height: 0.238 * screenHeight,
                  image: const AssetImage('images/success_image.png'),
                ),
              ),
              Flexible(
                child: Image(
                  height: 0.135 * screenHeight,
                  image: const AssetImage('images/check_box_outlined.png'),
                ),
              ),
              SizedBox(height: 0.085 * screenHeight),
              const HeaderTextSmallCentered(
                  text: 'You’ve changed your password'),
              SizedBox(height: 0.14 * screenHeight),
              WideOutlinedButton(
                label: 'Back to settings',
                onPressedCallback: () {
                  Navigator.pushNamed(context, HomeScreen.id);
                  Provider.of<HomeViewModel>(context, listen: false)
                      .setCurrentIndex(currentIndex: 3); //Go to Settings page
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}