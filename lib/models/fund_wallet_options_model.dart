enum PaymentType { debitCard, bankTransfer }

class FundWalletOptions {
  FundWalletOptions({this.paymentType, this.label, this.icon});
  PaymentType? paymentType;
  String? label;
  String? icon;

  static List<FundWalletOptions> getOptions() {
    return <FundWalletOptions>[
      FundWalletOptions(
          paymentType: PaymentType.debitCard,
          label: 'Debit card',
          icon: 'images/debit_card.png'),
      FundWalletOptions(
          paymentType: PaymentType.bankTransfer,
          label: 'Bank Transfer',
          icon: 'images/bank.png'),
    ];
  }
}
