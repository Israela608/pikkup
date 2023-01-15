import 'package:flutter/widgets.dart';

class ForgotPasswordViewModel extends ChangeNotifier {
  late GlobalKey<FormState> _formKey;
  late String _email;
  late bool _isCompleted;

  initialize() {
    _formKey = GlobalKey<FormState>();
    _isCompleted = false;
  }

  GlobalKey<FormState> get formKey => _formKey;
  String get email => _email;
  bool get isCompleted => _isCompleted;

  setEmail({required String email}) {
    _email = email;
  }

  setIsCompleted({required bool isCompleted}) {
    _isCompleted = isCompleted;
  }

  String? emailValidator({required String? emailValue}) {
    if (emailValue!.isEmpty) {
      return 'Please Enter an Email';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}').hasMatch(emailValue)) {
      return 'Please enter a valid Email';
    }
    return null;
  }
  //"^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]"

  void updateButton() {
    setIsCompleted(
        isCompleted: formKey.currentState!.validate() ? true : false);

    notifyListeners();
  }
}
