import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/utils/unfocuser.dart';
import 'package:pikkup/components/buttons/back.dart';
import 'package:pikkup/config/themes/app_colors.dart' as app_colors;
import 'package:pikkup/utils/dimensions.dart';
import 'package:pikkup/utils/ui_parameters.dart';

class PlainScaffold extends StatelessWidget {
  const PlainScaffold({
    Key? key,
    required this.child,
    this.isBackButtonPresent = true,
    this.isPaddingPresent = true,
    this.isScrollable = true,
    this.onBackPressed,
  }) : super(key: key);

  final Widget child;
  final bool isBackButtonPresent;
  final bool isPaddingPresent;
  final bool isScrollable;
  final VoidCallback? onBackPressed;

  @override
  Widget build(BuildContext context) {
    return Unfocuser(
      child: Scaffold(
        backgroundColor: app_colors.background,
        appBar: isBackButtonPresent
            ? PlainAppBar(
                onBackPressed: onBackPressed,
              )
            : null,
        //This Padding will make sure the Status bar space is secured despite the AppBar not being present
        body: Padding(
          padding: isBackButtonPresent
              ? const EdgeInsets.all(0)
              : EdgeInsets.only(top: Dimensions.standardSpacing),
          child: Container(
            padding:
                isPaddingPresent ? UIParameters.screenHorizontalPadding : null,
            child: isScrollable ? SingleChildScrollView(child: child) : child,
          ),
        ),
      ),
    );
  }
}

class PlainAppBar extends StatelessWidget with PreferredSizeWidget {
  PlainAppBar({Key? key, this.onBackPressed}) : super(key: key);
  final dynamic onBackPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Back(onPressed: onBackPressed),
      backgroundColor: Colors.transparent,
      elevation: 0,
      toolbarHeight: Dimensions.blendedAppBarHeight,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(Dimensions.blendedAppBarHeight);
}
