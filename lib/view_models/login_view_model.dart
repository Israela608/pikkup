import 'package:flutter/widgets.dart';

class LoginViewModel extends ChangeNotifier {
  late GlobalKey<FormState> _formKey;
  late String _email, _password;
  bool _isPasswordObscure = true;
  //String? _error = 'Email error';
  String? _error = null;
  String? _errorMessage;
  late bool _isCompleted;

  //IS_VALIDATED
  late bool _isEmailValidated, _isPasswordValidated;

  initialize() {
    _formKey = GlobalKey<FormState>();

    _isPasswordObscure = true;

    _isEmailValidated = false;
    _isPasswordValidated = false;

    _isCompleted = false;
  }

  GlobalKey<FormState> get formKey => _formKey;
  String get email => _email;
  String get password => _password;

  bool get isPasswordObscure => _isPasswordObscure;
  String? get errorMessage => _errorMessage;

  bool get isCompleted => _isCompleted;

  setEmail({required String email}) {
    _email = email;
  }

  setPassword({required String password}) {
    _password = password;
  }

  setIsCompleted({required bool isCompleted}) {
    _isCompleted = isCompleted;
  }

  void addErrorMessage() {
    if (_error == null) {
      _errorMessage == null;
    }
    if (_error == 'Email error') {
      _errorMessage = 'This email is not registered. Check and try again';
    }
    if (_error == 'Password error') {
      _errorMessage = 'Incorrect Password. Check and try again';
    }
    notifyListeners();
  }

  void togglePasswordObscure() {
    _isPasswordObscure = !_isPasswordObscure;
    notifyListeners();
  }

  String? emailValidator({required String? emailValue}) {
    _isEmailValidated = false;
    if (emailValue!.isEmpty) {
      return 'Please Enter an Email';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}').hasMatch(emailValue)) {
      return 'Please enter a valid Email';
    }

    _isEmailValidated = true;
    updateButton();
    return null;
  }

  String? passwordValidator({required String? passwordValue}) {
    _isPasswordValidated = false;
    if (passwordValue!.isEmpty) {
      return 'Please Enter a Password';
    }

    _isPasswordValidated = true;
    updateButton();
    return null;
  }

  void updateButton() {
    /* setIsCompleted(
        isCompleted: formKey.currentState!.validate() ? true : false);*/

    if (_isEmailValidated && _isPasswordValidated) {
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
