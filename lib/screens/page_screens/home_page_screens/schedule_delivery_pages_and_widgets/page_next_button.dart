import 'package:flutter/material.dart';
import 'package:pikkup/components/buttons/wide_button.dart';
import 'package:pikkup/components/buttons/wide_button_ash.dart';
import 'package:pikkup/screens/page_screens/home_page_screens/summary_info_screen.dart';
import 'package:pikkup/view_models/home_page_view_models/send_a_package_view_model.dart';
import 'package:provider/provider.dart';

class NextButton extends StatelessWidget {
  const NextButton({Key? key, required this.isCompleted}) : super(key: key);
  final bool isCompleted;

  //final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<SendAPackageViewModel>(context);
    return !isCompleted
        ? const WideButtonAsh(label: 'Next')
        : WideButton(
            label: 'Next',
            onPressedCallback: () {
              model.currentPosition < 3
                  ? model.nextPage()
                  : Navigator.pushNamed(
                      context, SummaryInfoScreen.id); ///////////////
              //model.isPickupAddressSaveCheck is true, save pickup address
            },
          );
  }
}
