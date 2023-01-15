import 'package:credit_card_type_detector/credit_card_type_detector.dart';
import 'package:credit_card_validator/credit_card_validator.dart';
import 'package:flutter/material.dart';
import 'package:pikkup/models/payment_cards_model.dart';

class AddACardViewModel extends ChangeNotifier {
  late final _formKey = GlobalKey<FormState>();
  late String _cardName, _cardNumber, _expiryDate, _cvv;
  late String _expiryMonth, _expiryYear;
  late CreditCardType _cardType;
  late final CreditCardValidator _ccValidator = CreditCardValidator();
  late bool _isCompleted;
  late List<PaymentCards> _paymentCards;

  initialize() {
    _paymentCards = PaymentCards.getCards();
    _cardType = CreditCardType.unknown;
    _isCompleted = false;
  }

  GlobalKey<FormState> get formKey => _formKey;
  String get cardName => _cardName;
  String get cardNumber => _cardNumber;
  String get expiryDate => _expiryDate;
  String get expiryMonth => _expiryMonth; //The 2 digit month of the expiry date
  String get expiryYear => _expiryYear; //The 4 digit year of the expiry date
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

      String stringMonth = dateList[0];
      String stringYear = dateList[1];

      if (stringMonth.length == 1) {
        stringMonth = '0' + stringMonth;
      }

      int year = toFourDigitYear(stringYear);
      stringYear = year.toString();

      _expiryMonth = stringMonth;
      _expiryYear = stringYear;

      //debugPrint('MONTH   $month');
      //debugPrint('YEAR   $year');
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
        if (isExpired(month: month, year: toFourDigitYear(year.toString()))) {
          return 'Card Expired';
        } else {
          return null;
        }
        // final date = DateTime(year, month);
        // debugPrint('DATE   $date');
        //
        // if (date.year == year && date.month == month) {
        //   return null;
        // }
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

  void addPaymentCard() {
    _paymentCards.add(PaymentCards(
      cardType: cardType.name,
      cardName: cardName,
      cardNumber: cardNumber,
      expiryMonth: expiryMonth,
      expiryYear: expiryYear,
      cvv: cvv,
    ));
    notifyListeners(); //Anytime this method is called, update the state to reflect the change

    for (var i = 0; i < _paymentCards.length; i++) {
      print(_paymentCards[i].cardName);
      //print(PaymentCards.getCards()[i].cardName);
    }
    //debugPrint(PaymentCards.getCards().toString());
  }
}

int toFourDigitYear(String stringYear) {
  //Takes in a 2 digit String year and returns a 4 digit year integer
  //Least year is 2000, highest year is 2099
  late int year;

  if (stringYear.length == 1) {
    stringYear = '0' + stringYear;
  }
  if (stringYear.length == 2) {
    int currentYear = DateTime.now()
        .year; //Assign the current year of your device to the integer currentYear, e.g 2022
    String firstTwoDigitsOfCurrentYear = currentYear.toString().substring(0,
        2); //Select the first 2 digits of the currentYear integer and assign to String firstTwoDigitsOfCurrentYear, e.g 20
    year = int.parse(firstTwoDigitsOfCurrentYear +
        stringYear); //Combine firstTwoDigitsOfCurrentYear and the inputted stringYear

    //if (year < currentYear) year = year + 100;
  }
  return year;
}

bool isExpired({required int month, required int year}) {
  //Return false if not expired, true if expired
  //year must be 4 digit
  int currentYear = DateTime.now().year;
  int currentMonth = DateTime.now().month;

  if (year > currentYear) {
    return false;
  } else if (year == currentYear && month >= currentMonth) {
    return false;
  }
  return true;
}
