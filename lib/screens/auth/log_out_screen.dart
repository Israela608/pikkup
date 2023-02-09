import 'package:flutter/material.dart';
import 'package:pikkup/components/buttons/wide_button.dart';
import 'package:pikkup/utils/dimensions.dart';
import 'package:pikkup/widgets/scaffolds/standard_scaffold.dart';

class LogOutScreen extends StatelessWidget {
  const LogOutScreen({Key? key}) : super(key: key);

  static const String id = '/log_out_screen';

  @override
  Widget build(BuildContext context) {
    return StandardScaffold(
      title: 'Logout',
      isScrollable: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 0.13 * Dimensions.screenHeight),
          Flexible(
            child: Image(
              height: 0.248 * Dimensions.screenHeight,
              image: const AssetImage('images/log_out_picture.png'),
            ),
          ),
          SizedBox(height: 0.152 * Dimensions.screenHeight),
          WideButton(
            label: 'Confirm Log out',
            onPressedCallback: () {
              //Log out the user
            },
          )
        ],
      ),
    );
  }
}
