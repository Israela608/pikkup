import 'package:flutter/material.dart';

class ChangePasswordTwoViewModel extends ChangeNotifier {
  late final _formKey = GlobalKey<FormState>();
  bool _hasError = false;
  late bool _isCompleted;
  late String _newPassword, _confirmPassword = '';
  bool _isNewPasswordObscure = true, _isConfirmPasswordObscure = true;

  initialize() {
    _isCompleted = false;
  }

  GlobalKey<FormState> get formKey => _formKey;
  bool get hasError => _hasError;
  bool get isCompleted => _isCompleted;

  String get newPassword => _newPassword;
  String get confirmPassword => _confirmPassword;

  bool get isNewPasswordObscure => _isNewPasswordObscure;
  bool get isConfirmPasswordObscure => _isConfirmPasswordObscure;

  String? get errorMessage => hasError ? 'Incorrect password' : null;

  setHasError({required bool hasError}) {
    _hasError = hasError;
    notifyListeners();
  }

  setIsCompleted({required bool isCompleted}) {
    _isCompleted = isCompleted;
  }

  setNewPassword({required String newPassword}) {
    _newPassword = newPassword;
  }

  setConfirmPassword({required String confirmPassword}) {
    _confirmPassword = confirmPassword;
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
    if (passwordValue!.isEmpty) {
      return 'Please Enter a Password';
    }
    return null;
  }

  String? confirmPasswordValidator({required String? passwordValue}) {
    if (passwordValue!.isEmpty) {
      return 'Please re-enter password';
    }
    if (newPassword != confirmPassword) {
      return "Password does not match";
    }
    return null;
  }

  void updateButton() {
    if (formKey.currentState!.validate()) {
      setIsCompleted(isCompleted: true);
      setHasError(hasError: false);
    } else {
      setIsCompleted(isCompleted: false);
      setHasError(hasError: true);
    }

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
