import 'package:flutter/material.dart';
import 'package:pikkup/utils/dimensions.dart';

class SpacerTitleBox extends StatelessWidget {
  const SpacerTitleBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: Dimensions.titleBoxSpacing);
  }
}

class SpacerTextFieldBox extends StatelessWidget {
  const SpacerTextFieldBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: Dimensions.standardSpacing);
  }
}
