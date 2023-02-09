import 'package:flutter/material.dart';
import 'package:pikkup/utils/dimensions.dart';

class TitleBodySpacer extends StatelessWidget {
  const TitleBodySpacer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: Dimensions.titleBodySpacing);
  }
}

class StandardSpacer extends StatelessWidget {
  const StandardSpacer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: Dimensions.standardSpacing);
  }
}

class BigSpacer extends StatelessWidget {
  const BigSpacer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: Dimensions.bigSpacing);
  }
}
