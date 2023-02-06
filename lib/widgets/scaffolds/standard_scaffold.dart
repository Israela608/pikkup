import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/utils/unfocuser.dart';
import 'package:pikkup/config/themes/app_colors.dart' as app_colors;
import 'package:pikkup/utils/ui_parameters.dart';
import 'package:pikkup/widgets/standard_app_bar.dart';

class StandardScaffold extends StatelessWidget {
  const StandardScaffold({
    Key? key,
    required this.title,
    required this.child,
    this.isBackButtonPresent = true,
    this.isBlueAppBar = false,
    this.isPaddingPresent = true,
    this.isScrollable = true,
    this.onBackPressed,
  }) : super(key: key);

  final String title;
  final Widget child;
  final bool isBackButtonPresent;
  final bool isBlueAppBar;
  final bool isPaddingPresent;
  final bool isScrollable;
  final VoidCallback? onBackPressed;

  @override
  Widget build(BuildContext context) {
    return Unfocuser(
      child: Scaffold(
        backgroundColor: app_colors.background,
        appBar: StandardAppBar(
          title: title,
          isBackButtonPresent: isBackButtonPresent,
          isBlueAppBar: isBlueAppBar,
          onBackPressed: onBackPressed,
        ),
        body: Container(
          padding:
              isPaddingPresent ? UIParameters.screenHorizontalPadding : null,
          child: isScrollable ? SingleChildScrollView(child: child) : child,
        ),
      ),
    );
  }
}
