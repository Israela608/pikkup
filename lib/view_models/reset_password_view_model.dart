import 'package:flutter/material.dart';

class ResetPasswordViewModel extends ChangeNotifier {
  late GlobalKey<FormState> _formKey;
  late String _newPassword, _confirmPassword;
  late bool _isNewPasswordObscure, _isConfirmPasswordObscure;
  late bool _isCompleted;

  //IS_VALIDATED
  late bool _isNewPasswordValidated, _isConfirmPasswordValidated;

  initialize() {
    _formKey = GlobalKey<FormState>();

    _isNewPasswordObscure = true;
    _isConfirmPasswordObscure = true;

    _isNewPasswordValidated = false;
    _isConfirmPasswordValidated = false;

    _isCompleted = false;
  }

  GlobalKey<FormState> get formKey => _formKey;
  String get newPassword => _newPassword;
  String get confirmPassword => _confirmPassword;

  bool get isNewPasswordObscure => _isNewPasswordObscure;
  bool get isConfirmPasswordObscure => _isConfirmPasswordObscure;

  bool get isCompleted => _isCompleted;

  setNewPassword({required String newPassword}) {
    _newPassword = newPassword;
  }

  setConfirmPassword({required String confirmPassword}) {
    _confirmPassword = confirmPassword;
  }

  setIsCompleted({required bool isCompleted}) {
    _isCompleted = isCompleted;
  }

  void toggleNewPasswordObscure() {
    _isNewPasswordObscure = !_isNewPasswordObscure;
    notifyListeners();
  }

  void toggleConfirmPasswordObscure() {
    _isConfirmPasswordObscure = !_isConfirmPasswordObscure;
    notifyListeners();
  }

  String? newPasswordValidator({required String? passwordValue}) {
    _isNewPasswordValidated = false;
    if (passwordValue!.isEmpty) {
      return 'Please Enter a Password';
    }

    _isNewPasswordValidated = true;
    updateButton();
    return null;
  }

  String? confirmPasswordValidator({required String? passwordValue}) {
    _isConfirmPasswordValidated = false;
    if (passwordValue!.isEmpty) {
      return 'Please re-enter password';
    }
    if (newPassword != confirmPassword) {
      return "Password does not match";
    }

    _isConfirmPasswordValidated = true;
    updateButton();
    return null;
  }

  void updateButton() {
    /* setIsCompleted(
        isCompleted: formKey.currentState!.validate() ? true : false);*/

    if (_isNewPasswordValidated && _isConfirmPasswordValidated) {
      setIsCompleted(isCompleted: true);
    } else {
      setIsCompleted(isCompleted: false);
    }

    //Calls notify listener when the validating process is complete to prevent errors or interference
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      notifyListeners();
    });
  }
}
