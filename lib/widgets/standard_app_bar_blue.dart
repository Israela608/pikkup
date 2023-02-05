import 'package:flutter/material.dart';
import 'package:pikkup/components/buttons/back.dart';
import 'package:pikkup/components/texts/header_text.dart';
import 'package:pikkup/config/themes/app_colors.dart' as app_colors;
import 'package:pikkup/config/themes/decorations.dart';

class StandardAppBarBlue extends StatelessWidget with PreferredSizeWidget {
  StandardAppBarBlue({Key? key, required this.label, this.onBackPressed})
      : super(key: key);
  final String label;
  final dynamic onBackPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Back(
        onPressed: onBackPressed ?? () => Navigator.pop(context),
        isWhiteColor: true,
      ),
      title: HeaderText(
          text: label,
          headerTextSize: HeaderTextSize.small,
          color: app_colors.white),
      centerTitle: true,
      toolbarHeight: kStandardAppBarHeight,
      backgroundColor: app_colors.primaryBlue,
      elevation: 2,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kStandardAppBarHeight);
}
