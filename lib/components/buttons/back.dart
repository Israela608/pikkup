import 'package:flutter/material.dart';
import 'package:pikkup/utils/app_colors.dart' as app_colors;

class Back extends StatelessWidget {
  const Back({Key? key, this.onPressed}) : super(key: key);
  final dynamic onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      alignment: Alignment.centerLeft,
      icon: const SizedBox(height: 18, child: ImageIcon(AssetImage('images/back.png'),color: app_colors.black,)),
      onPressed: onPressed,
    );
  }
}
