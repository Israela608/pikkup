import 'package:flutter/material.dart';
import 'package:pikkup/config/themes/app_colors.dart' as app_colors;

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({Key? key, this.errorMessage}) : super(key: key);
  final String? errorMessage;

  @override
  Widget build(BuildContext context) {
    if (errorMessage == null) {
      return Container();
    } else {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(15),
        alignment: Alignment.center,
        child: Text(
          errorMessage.toString(), //Convert String? to String
          style: const TextStyle(
            fontSize: 12,
            fontFamily: 'Sora',
            color: Colors.white,
          ),
          //textAlign: TextAlign.center,
        ),
        decoration: BoxDecoration(
          color: app_colors.error,
          borderRadius: BorderRadius.circular(5),
        ),
      );
    }
  }
}
