import 'package:flutter/foundation.dart';

class EditProfileViewModel extends ChangeNotifier {
  late String _name, _email, _phoneNumber;

  String? _error;
  //String? _error = 'Email error';
  String? _errorMessage;

  String get name => _name;
  String get email => _email;
  String get phoneNumber => _phoneNumber;

  String? get errorMessage => _errorMessage;

  setName({required String name}){
    _name = name;
  }
  setEmail({required String email}){
    _email = email;
  }

  setPhoneNumber({required String phoneNumber}){
    _phoneNumber = phoneNumber;
  }

  void addErrorMessage() {
    if(_error == null){
      _errorMessage == null;
    }
    if(_error == 'Email error'){
      _errorMessage = 'This email is not registered. Check and try again';
    }
    if(_error == 'Password error'){
      _errorMessage = 'Incorrect Password. Check and try again';
    }
    notifyListeners();
  }

  String? nameValidator({required String? nameValue}){
    if (nameValue!.isEmpty) {
      return 'Please Enter Name';
    }
    return null;
  }

  String? emailValidator({required String? emailValue}) {
    if (emailValue!.isEmpty) {
      return 'Please Enter an Email';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
        .hasMatch(emailValue)) {
      return 'Please enter a valid Email';
    }
    return null;
  }


}