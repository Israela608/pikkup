import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:pikkup/models/receiver_details_model.dart';

class ReceiverDetailsViewModel extends ChangeNotifier {
  late final _formKey = GlobalKey<FormState>();
  late int _currentIndex;
  //Name and Phone number of the current selected item
  late String _name, _phoneNumber = '';

  final List<ReceiverDetails> _receiverDetails = [
    ReceiverDetails(name: 'Moses', phoneNumber: '09061870986'),
    ReceiverDetails(name: 'Idris John', phoneNumber: '09034797308'),
    ReceiverDetails(name: 'Samuel Akpan', phoneNumber: '09061870986'),
    ReceiverDetails(name: 'Lupita Nyogo', phoneNumber: '09034797308'),
    ReceiverDetails(name: 'Buhari', phoneNumber: '09061870986'),
  ];
  late bool _isCompleted;

  initialize({index}) {
    _currentIndex = index;
    _name = receiverDetails[index].name;
    _phoneNumber = receiverDetails[index].phoneNumber;
    _isCompleted = false;
  }

  GlobalKey<FormState> get formKey => _formKey;
  UnmodifiableListView<ReceiverDetails> get receiverDetails =>
      UnmodifiableListView(_receiverDetails);
  int get currentIndex => _currentIndex;
  String get name => _name;
  String get phoneNumber => _phoneNumber;
  String get textFieldPhoneNumber => phoneNumber.startsWith('0')
      ? phoneNumber.replaceFirst('0', '')
      : phoneNumber;

  int get receiverDetailsCount => _receiverDetails.length;
  bool get isCompleted => _isCompleted;

  setName({required String name}) {
    _name = name;
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

  setIsCompleted({required bool isCompleted}) {
    _isCompleted = isCompleted;
  }

  String? nameValidator({required String? nameValue}) {
    if (nameValue!.isEmpty) {
      return 'Please Enter Name';
    }
    return null;
  }

  void replaceDetail() {
    _receiverDetails[currentIndex] =
        ReceiverDetails(name: name, phoneNumber: phoneNumber);
    notifyListeners();
  }

  void deleteDetail({required int index}) {
    _receiverDetails.remove(_receiverDetails[index]);
    //_receiverDetails.
    notifyListeners();
  }

  void updateSaveChangesButton() {
    setIsCompleted(
        isCompleted: formKey.currentState!.validate() ? true : false);

    notifyListeners();
  }
}
