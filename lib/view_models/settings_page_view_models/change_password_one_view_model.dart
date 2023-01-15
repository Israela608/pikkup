import 'package:flutter/material.dart';

class ChangePasswordOneViewModel extends ChangeNotifier {
  late final _formKey = GlobalKey<FormState>();
  bool _hasError = false;
  late String _oldPassword;
  bool _isOldPasswordObscure = true;
  late bool _isCompleted;

  initialize() {
    _isCompleted = false;
  }

  GlobalKey<FormState> get formKey => _formKey;
  bool get hasError => _hasError;
  bool get isCompleted => _isCompleted;

  String get oldPassword => _oldPassword;
  bool get isOldPasswordObscure => _isOldPasswordObscure;

  bool get isCorrectPassword => oldPassword == 'pikkup' ? true : false;
  String? get errorMessage => hasError ? 'Incorrect password' : null;

  setHasError({required bool hasError}) {
    _hasError = hasError;
    notifyListeners();
  }

  setIsCompleted({required bool isCompleted}) {
    _isCompleted = isCompleted;
  }

  setOldPassword({required String oldPassword}) {
    _oldPassword = oldPassword;
  }

  void toggleOldPasswordObscure() {
    _isOldPasswordObscure = !_isOldPasswordObscure;
    notifyListeners();
  }

  String? oldPasswordValidator({required String? passwordValue}) {
    if (passwordValue!.isEmpty) {
      return 'Please Enter a Password';
    }
    return null;
  }

  void updateButton() {
    setIsCompleted(
        isCompleted: formKey.currentState!.validate() ? true : false);

    notifyListeners();
  }

  // void addErrorMessage() {
  //   if(_error == null){
  //     _errorMessage == null;
  //   }
  //   if(_error == 'Email error'){
  //     _errorMessage = 'This email is not registered. Check and try again';
  //   }
  //   if(_error == 'Password error'){
  //     _errorMessage = 'Incorrect Password. Check and try again';
  //   }
  //   notifyListeners();
  // }
}
