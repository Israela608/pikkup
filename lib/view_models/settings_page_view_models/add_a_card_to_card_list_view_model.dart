import 'package:credit_card_type_detector/credit_card_type_detector.dart';
import 'package:credit_card_validator/credit_card_validator.dart';
import 'package:flutter/material.dart';

class AddACardToCardListViewModel extends ChangeNotifier {
  late final _formKey = GlobalKey<FormState>();
  late String _cardName, _cardNumber, _expiryDate, _cvv;
  late CreditCardType _cardType;
  late final CreditCardValidator _ccValidator = CreditCardValidator();
  late bool _isCompleted;

  initialize() {
    _cardType = CreditCardType.unknown;
    _isCompleted = false;
  }

  GlobalKey<FormState> get formKey => _formKey;
  String get cardName => _cardName;
  String get cardNumber => _cardNumber;
  String get expiryDate => _expiryDate;
  String get cvv => _cvv;
  CreditCardType get cardType => _cardType;
  bool get isCompleted => _isCompleted;

  setCardName({required String cardName}) {
    _cardName = cardName;
  }

  setCardNumber({required String cardNumber}) {
    _cardNumber = cardNumber;

    setCardType(cardNumber: cardNumber);

    debugPrint('CARD NUMBER   $cardNumber');
    try {
      final numberList = _cardNumber.split(" ");

      int newNumber = int.parse(
          numberList[0] + numberList[1] + numberList[2] + numberList[3]);

      debugPrint('NEW CARD NUMBER   $newNumber');
    } catch (e) {
      debugPrint('Incomplete');
    }
  }

  setExpiryDate({required String expiryDate}) {
    _expiryDate = expiryDate;

    try {
      final dateList = _expiryDate.split("/");

      int month = int.parse(dateList[0]);
      int year = int.parse(dateList[1]);

      debugPrint('MONTH   $month');
      debugPrint('YEAR   $year');
    } catch (e) {
      debugPrint('Incomplete');
    }
  }

  setCvv({required String cvv}) {
    _cvv = cvv;
  }

  setCardType({required String cardNumber}) {
    //_cardType = _ccValidator.validateCCNum(cardNumber).ccType.name;
    _cardType = _ccValidator.validateCCNum(cardNumber).ccType;
  }

  setIsCompleted({required bool isCompleted}) {
    _isCompleted = isCompleted;
  }

  String? cardNameValidator({required String? cardNameValue}) {
    if (cardNameValue!.isEmpty) {
      return 'Please Enter Name';
    }
    return null;
  }

  String? cardNumberValidator({required String? cardNumberValue}) {
    String message =
        _ccValidator.validateCCNum(cardNumberValue.toString()).message;

    //debugPrint('VALIDATOR     $message');

    if (cardType != CreditCardType.unknown &&
        (cardType != CreditCardType.mastercard &&
            cardType != CreditCardType.visa)) {
      return 'Only mastercard and visa is supported';
    }

    if (message.isNotEmpty) {
      return message;
    }

    return null;
  }

  String? expiryDateValidator({required String? expiryDateValue}) {
    if (expiryDateValue == null || expiryDateValue.isEmpty) {
      return 'No date given';
    }

    if (expiryDateValue.length < 5) {
      return 'Date incomplete';
    }

    final components = expiryDateValue.split("/");

    if (components.length == 2) {
      final month = int.tryParse(components[0]);
      final year = int.tryParse(components[1]);

      if (month != null && year != null) {
        final date = DateTime(year, month);
        debugPrint('DATE   $date');

        if (date.year == year && date.month == month) {
          return null;
        }
      }
    }
    return 'Wrong date';
  }

  String? cvvValidator({required String? cvvValue}) {
    /* String message =
        _ccValidator.validateCVV(cvvValue.toString(), cardType).message;
    return message;*/

    if (cvvValue!.isEmpty) {
      //return 'No security code given';
      return 'No cvv given';
    }

    if (cvvValue.length < 3) {
      return 'Code is too short';
    }
    return null;
  }

  void updateAddToMyCardsButton() {
    setIsCompleted(
        isCompleted: formKey.currentState!.validate() ? true : false);

    notifyListeners();
  }
}
