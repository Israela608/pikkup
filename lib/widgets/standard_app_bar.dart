import 'package:flutter/material.dart';
import 'package:pikkup/components/buttons/back.dart';
import 'package:pikkup/components/texts/header_text.dart';
import 'package:pikkup/config/themes/app_colors.dart' as app_colors;
import 'package:pikkup/utils/dimensions.dart';

class StandardAppBar extends StatelessWidget with PreferredSizeWidget {
  StandardAppBar(
      {Key? key,
      required this.title,
      this.isBackButtonPresent = true,
      this.isBlueAppBar = false,
      this.onBackPressed})
      : super(key: key);

  final String title;
  final bool isBackButtonPresent;
  final bool isBlueAppBar;
  final dynamic onBackPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: isBackButtonPresent
          ? Back(
              onPressed: onBackPressed,
              isWhiteColor: isBlueAppBar ? true : false,
            )
          : null,
      title: HeaderText(
        text: title,
        headerTextSize: HeaderTextSize.small,
        color: isBlueAppBar ? app_colors.white : app_colors.primaryBlack,
      ),
      centerTitle: true,
      toolbarHeight: Dimensions.standardAppBarHeight,
      backgroundColor:
          isBlueAppBar ? app_colors.primaryBlue : app_colors.background,
      elevation: 2,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(Dimensions.standardAppBarHeight);
}
