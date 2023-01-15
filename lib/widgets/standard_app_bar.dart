import 'package:flutter/material.dart';
import 'package:pikkup/components/buttons/back.dart';
import 'package:pikkup/components/texts/header_text_small.dart';
import 'package:pikkup/utils/app_colors.dart' as app_colors;
import 'package:pikkup/utils/constants.dart';

class StandardAppBar extends StatelessWidget with PreferredSizeWidget {
  StandardAppBar({Key? key, required this.label, this.onBackPressed})
      : super(key: key);
  final String label;
  final dynamic onBackPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Back(onPressed: onBackPressed ?? () => Navigator.pop(context)),
      title: HeaderTextSmall(text: label),
      centerTitle: true,
      toolbarHeight: kStandardAppBarHeight,
      backgroundColor: app_colors.background,
      elevation: 2,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kStandardAppBarHeight);
}
