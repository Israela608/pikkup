import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:pikkup/models/payment_cards_model.dart';

class PaymentCardsViewModel extends ChangeNotifier {
  //late double _amount;
  late List<PaymentCards> _paymentCards;
  late PaymentCards _selectedCard;
  late bool _isPayButtonActivated;

  //double get amount => _amount;
  UnmodifiableListView<PaymentCards> get paymentCards =>
      UnmodifiableListView(_paymentCards);
  PaymentCards get selectedCard => _selectedCard;
  bool get isPayButtonActivated => _isPayButtonActivated;

  instantiate() {
    _paymentCards = PaymentCards.getCards();
    _selectedCard = PaymentCards();
    _isPayButtonActivated = false;
  }

  // setAmount({required double amount}){
  //   _amount = amount;
  // }

  setSelectedCard({index}) {
    if (isSelected(index: index)) {
      //If This option has already been set, then there's no need to set it again
      return;
    } else {
      _selectedCard = paymentCards[index];
      _isPayButtonActivated = true;
      debugPrint('Current Card ${paymentCards[index].cardNumber}');
    }
    notifyListeners();
  }

  bool isSelected({index}) =>
      selectedCard == paymentCards[index] ? true : false;

  int get cardCount => _paymentCards.length;

  bool get isCardPresent => cardCount == 0 ? false : true;

  notifyListener() {
    notifyListeners();
  }
}
