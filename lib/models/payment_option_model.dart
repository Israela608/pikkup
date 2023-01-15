enum PaymentId { wallet, debitCard, bankTransfer }

class PaymentOptions {
  PaymentOptions({this.paymentId, this.label, this.icon});
  PaymentId? paymentId;
  String? label;
  String? icon;

  static List<PaymentOptions> getOptions() {
    return <PaymentOptions>[
      PaymentOptions(
          paymentId: PaymentId.wallet,
          label: 'Wallet',
          icon: 'images/wallet_card.png'),
      PaymentOptions(
          paymentId: PaymentId.debitCard,
          label: 'Debit card',
          icon: 'images/debit_card.png'),
      PaymentOptions(
          paymentId: PaymentId.bankTransfer,
          label: 'Bank Transfer',
          icon: 'images/bank.png'),
    ];
  }
}
