class PaymentCards {
  PaymentCards({
    this.cardType,
    this.cardName,
    this.cardNumber,
    this.expiryMonth,
    this.expiryYear,
    this.cvv,
  });

  final String? cardType;
  final String? cardName;
  final String? cardNumber;
  final String? expiryMonth;
  final String? expiryYear;
  final String? cvv;

  static List<PaymentCards> getCards() => [
        PaymentCards(
          cardType: 'mastercard',
          cardName: 'OSAKWE DANIEL',
          cardNumber: '5104483937483948',
          expiryMonth: '11',
          expiryYear: '2024',
          cvv: '343',
        ),
        PaymentCards(
          cardType: 'visa',
          cardName: 'EMEFIELE MARVELLOUS',
          cardNumber: '4839394837470448',
          expiryMonth: '03',
          expiryYear: '2025',
          cvv: '455',
        ),
      ];
}

// enum PaymentId { wallet, debitCard, bankTransfer }
//
// class PaymentCard {
//   PaymentCard({this.paymentId, this.label, this.icon});
//   PaymentId? paymentId;
//   String? label;
//   String? icon;
//
//   static List<PaymentCard> getCards() {
//     return <PaymentCard>[
//       PaymentCard(
//           paymentId: PaymentId.wallet,
//           label: 'Wallet',
//           icon: 'images/wallet_card.png'),
//       PaymentCard(
//           paymentId: PaymentId.debitCard,
//           label: 'Debit card',
//           icon: 'images/debit_card.png'),
//       PaymentCard(
//           paymentId: PaymentId.bankTransfer,
//           label: 'Bank Transfer',
//           icon: 'images/bank.png'),
//     ];
//   }
// }
