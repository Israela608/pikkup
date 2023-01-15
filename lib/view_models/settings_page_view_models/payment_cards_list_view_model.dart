import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:pikkup/models/payment_cards_model.dart';

class PaymentCardsListViewModel extends ChangeNotifier {
  late List<PaymentCards> _paymentCards;

  UnmodifiableListView<PaymentCards> get paymentCards =>
      UnmodifiableListView(_paymentCards);

  instantiate() {
    _paymentCards = PaymentCards.getCards();
  }

  int get cardCount => _paymentCards.length;

  bool get isCardPresent => cardCount == 0 ? false : true;
}
