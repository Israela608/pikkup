import 'package:flutter/material.dart';
import 'package:pikkup/components/buttons/back.dart';
import 'package:pikkup/utils/constants.dart';

class BlendedAppBar extends StatelessWidget with PreferredSizeWidget {
  BlendedAppBar({Key? key, this.onBackPressed}) : super(key: key);
  final dynamic onBackPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Back(onPressed: onBackPressed ?? () => Navigator.pop(context)),
      backgroundColor: Colors.transparent,
      elevation: 0,
      toolbarHeight: kBlendedAppBarHeight,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kBlendedAppBarHeight);
}
