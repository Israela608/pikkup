import 'package:flutter/material.dart';
import 'package:pikkup/components/buttons/back_white.dart';
import 'package:pikkup/components/texts/header_text_small_white.dart';
import 'package:pikkup/utils/app_colors.dart' as app_colors;
import 'package:pikkup/utils/constants.dart';

class StandardAppBarBlue extends StatelessWidget with PreferredSizeWidget {
  StandardAppBarBlue({Key? key, required this.label, this.onBackPressed})
      : super(key: key);
  final String label;
  final dynamic onBackPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: BackWhite(
        onPressed: onBackPressed ?? () => Navigator.pop(context),
      ),
      title: HeaderTextSmallWhite(text: label),
      centerTitle: true,
      toolbarHeight: kStandardAppBarHeight,
      backgroundColor: app_colors.primaryBlue,
      elevation: 2,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kStandardAppBarHeight);
}
