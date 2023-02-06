import 'package:flutter/material.dart';
import 'package:pikkup/components/buttons/wide_button.dart';
import 'package:pikkup/config/themes/app_colors.dart' as app_colors;
import 'package:pikkup/config/themes/decorations.dart';
import 'package:pikkup/widgets/standard_app_bar.dart';

class LogOutScreen extends StatelessWidget {
  const LogOutScreen({Key? key}) : super(key: key);

  static const String id = 'log_out_screen';

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: app_colors.background,
      appBar: StandardAppBar(
        title: 'Logout',
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: kStandardPaddingSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 0.13 * screenHeight),
              Flexible(
                child: Image(
                  height: 0.248 * screenHeight,
                  image: const AssetImage('images/log_out_picture.png'),
                ),
              ),
              SizedBox(height: 0.152 * screenHeight),
              WideButton(
                label: 'Confirm Log out',
                onPressedCallback: () {
                  //Log out the user
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
