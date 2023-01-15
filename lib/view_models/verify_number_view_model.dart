import 'package:flutter/material.dart';

class VerifyNumberViewModel extends ChangeNotifier {
  late bool _hasError;
  late bool _isCompleted;
  late String _codeText; //the Inputted code

  initialize() {
    _hasError = false;
    _isCompleted = false;
  }

  bool get hasError => _hasError;
  bool get isCompleted => _isCompleted;
  String get codeText => _codeText;
  String? get errorMessage => hasError ? 'Enter the code correctly' : null;

  //Check if the Inputted code matches the real code sent to the email
  bool get codeIsCorrect => codeText == '123456' ? true : false;

  setHasError({required bool hasError}) {
    _hasError = hasError;
    notifyListeners();
  }

  setIsCompleted({required bool isCompleted}) {
    _isCompleted = isCompleted;
  }

  setCodeText({required String codeInput}) {
    _codeText = codeInput;
  }

  void changeButton() {
    if (codeText.length < 6) {
      //Blur the button
      setIsCompleted(isCompleted: false);
    } else {
      setIsCompleted(isCompleted: true);
    }
    notifyListeners();
  }
}
