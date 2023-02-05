import 'package:flutter/material.dart';
import 'package:pikkup/config/themes/app_colors.dart' as app_colors;

class StandardBottomSheet extends StatelessWidget {
  const StandardBottomSheet(
      {Key? key, required this.title, required this.widget})
      : super(key: key);
  final String title;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: app_colors.backgroundGrey,
      //Make the parent container same color as the grey background
      child: Container(
        //This os the real container we are building on
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16), topRight: Radius.circular(16)),
            color: app_colors.background),
        padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
        height: MediaQuery.of(context).size.height * 0.724,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            BottomSheetAppBar(title: title),
            const SizedBox(height: 20),
            Expanded(child: widget)
          ],
        ),
      ),
    );
  }
}

class BottomSheetAppBar extends StatelessWidget {
  const BottomSheetAppBar({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            fontFamily: 'Sora',
            fontWeight: FontWeight.w600,
            color: app_colors.primaryBlack,
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.close,
            size: 32,
          ),
          //iconSize: 32,
        )
      ],
    );
  }
}
