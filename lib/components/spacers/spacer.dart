import 'package:flutter/material.dart';
import 'package:pikkup/utils/dimensions.dart';

class TitleBoxSpacer extends StatelessWidget {
  const TitleBoxSpacer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: Dimensions.titleBoxSpacing);
  }
}

class StandardSpacer extends StatelessWidget {
  const StandardSpacer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: Dimensions.standardSpacing);
  }
}
