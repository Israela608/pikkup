import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class CreateAccountViewModel extends ChangeNotifier {
  late GlobalKey<FormState> _formKey;
  late String _name, _email, _phoneNumber, _password, _confirmPassword;
  late bool _isPasswordObscure, _isConfirmPasswordObscure;
  String? _error;
  //String? _error = 'Email error';
  String? _errorMessage;
  late bool _isCompleted;

  //IS_VALIDATED
  late bool _isNameValidated,
      _isEmailValidated,
      _isPhoneNumberValidated,
      _isPasswordValidated,
      _isConfirmPasswordValidated;

  initialize() {
    _formKey = GlobalKey<FormState>();

    _isPasswordObscure = true;
    _isConfirmPasswordObscure = true;

    _isNameValidated = false;
    _isEmailValidated = false;
    _isPhoneNumberValidated = false;
    _isPasswordValidated = false;
    _isConfirmPasswordValidated = false;

    _isCompleted = false;
  }

  GlobalKey<FormState> get formKey => _formKey;
  String get name => _name;
  String get email => _email;
  String get phoneNumber => _phoneNumber;
  String get password => _password;
  String get confirmPassword => _confirmPassword;

  bool get isPasswordObscure => _isPasswordObscure;
  String? get errorMessage => _errorMessage;
  bool get isConfirmPasswordObscure => _isConfirmPasswordObscure;

  bool get isCompleted => _isCompleted;

  setName({required String name}) {
    _name = name;
  }

  setEmail({required String email}) {
    _email = email;
  }

  setPhoneNumber({required PhoneNumber number}) {
    //This is the standard phone number with the country dial code
    String internationalPhoneNumber = number.phoneNumber.toString();

    String ph;

    //Replace the dial code with zero
    ph = number.phoneNumber
        .toString()
        .replaceAll(number.dialCode.toString(), '0');

    //If the number starts with two zeros, replace with zero
    ph = ph.startsWith('00') ? ph.replaceFirst('00', '0') : ph;

    _phoneNumber = ph;
  }

  setPassword({required String password}) {
    _password = password;
  }

  setConfirmPassword({required String confirmPassword}) {
    _confirmPassword = confirmPassword;
  }

  setIsCompleted({required bool isCompleted}) {
    _isCompleted = isCompleted;
  }

  void addErrorMessage() {
    if (_error == null) {
      _errorMessage == null;
    }
    if (_error == 'Phone Number Error error') {
      _errorMessage = 'This phone is already registered. Check and try again';
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

  void toggleConfirmPasswordObscure() {
    _isConfirmPasswordObscure = !_isConfirmPasswordObscure;
    notifyListeners();
  }

  String? nameValidator({required String? nameValue}) {
    _isNameValidated = false;
    if (nameValue!.isEmpty) {
      return 'Please Enter Name';
    }

    _isNameValidated = true;
    updateButton();
    return null;
  }

  void phoneNumberValidator({required bool isPhoneNumberValidated}) {
    _isPhoneNumberValidated = isPhoneNumberValidated;
    updateButton();
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

  String? confirmPasswordValidator({required String? passwordValue}) {
    _isConfirmPasswordValidated = false;
    if (passwordValue!.isEmpty) {
      return 'Please re-enter password';
    }
    if (password != confirmPassword) {
      return "Password does not match";
    }

    _isConfirmPasswordValidated = true;
    updateButton();
    return null;
  }

  void updateButton() {
    /*setIsCompleted(
        isCompleted: formKey.currentState!.validate() ? true : false);*/
    //isNameValidated, isEmailValidated, isPhoneNumberValidated, isPasswordValidated, isConfirmPasswordValidated

    if (_isNameValidated &&
        _isEmailValidated &&
        _isPhoneNumberValidated &&
        _isPasswordValidated &&
        _isConfirmPasswordValidated) {
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
