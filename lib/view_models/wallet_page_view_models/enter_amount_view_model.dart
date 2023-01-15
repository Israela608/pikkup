import 'dart:io';

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:pikkup/models/fund_wallet_options_model.dart';

class EnterAmountViewModel extends ChangeNotifier {
  final CurrencyTextInputFormatter _formatter = CurrencyTextInputFormatter(
    decimalDigits: 0,
    symbol: '\u{20A6}',
  );
  late PaymentType _paymentType;
  //late double _amount;

  late bool _isCompleted;
  final double leastAmount = 100;

  PaymentType get paymentType => _paymentType;
  double get amount => formatter.getUnformattedValue().toDouble();
  CurrencyTextInputFormatter get formatter => _formatter;
  bool get isCompleted => _isCompleted;

  instantiate() {
    _isCompleted = false;
  }

  setPaymentType({required PaymentType paymentType}) {
    _paymentType = paymentType;
  }

  setIsCompleted({required bool isCompleted}) {
    _isCompleted = isCompleted;
  }

  void updateContinueButton(value) {
    amount >= leastAmount
        ? setIsCompleted(isCompleted: true)
        : setIsCompleted(isCompleted: false);

    notifyListeners();
  }

  String getCurrency() {
    var format =
        NumberFormat.simpleCurrency(locale: Platform.localeName, name: 'NGN');
    return format.currencySymbol;
  }
}
