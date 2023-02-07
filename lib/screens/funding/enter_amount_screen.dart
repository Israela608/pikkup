import 'package:flutter/material.dart';
import 'package:pikkup/components/buttons/wide_button.dart';
import 'package:pikkup/components/buttons/wide_button_ash.dart';
import 'package:pikkup/config/themes/app_colors.dart' as app_colors;
import 'package:pikkup/config/themes/decorations.dart';
import 'package:pikkup/models/fund_wallet_options_model.dart';
import 'package:pikkup/screens/funding/bank_transfer_screen.dart';
import 'package:pikkup/screens/funding/payment_cards_screen.dart';
import 'package:pikkup/view_models/wallet_page_view_models/enter_amount_view_model.dart';
import 'package:pikkup/widgets/scaffolds/standard_scaffold.dart';
import 'package:provider/provider.dart';

class EnterAmountScreen extends StatefulWidget {
  EnterAmountScreen({Key? key}) : super(key: key);

  static const String id = 'enter_amount_screen';

  final TextEditingController _textController = TextEditingController();

  @override
  State<EnterAmountScreen> createState() => _EnterAmountScreenState();
}

class _EnterAmountScreenState extends State<EnterAmountScreen> {
  @override
  void initState() {
    Provider.of<EnterAmountViewModel>(context, listen: false).instantiate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StandardScaffold(
      title: 'Wallet',
      isBlueAppBar: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 32),
          const DescriptionBox(),
          const SizedBox(height: 32),
          AmountBox(
            textController: widget._textController,
          ),
          const SizedBox(height: 158),
          const ContinueButton(),
        ],
      ),
    );
  }
}

class DescriptionBox extends StatelessWidget {
  const DescriptionBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: app_colors.fillAsh,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 13),
        child: const Text(
          'Enter the amount you want to fund wallet in your wallet',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
            fontFamily: 'Inter',
            color: app_colors.primaryBlack,
          ),
        ),
      ),
    );
  }
}

class AmountBox extends StatelessWidget {
  const AmountBox({Key? key, required this.textController}) : super(key: key);
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<EnterAmountViewModel>(context);

    return Center(
      child: IntrinsicWidth(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            minWidth: 216,
          ),
          child: MoneyTextField(
            textController: textController,
            validatorCallback: (value) {
              //return model.productNameValidator(nameValue: value!);
            },
            onChangedCallback: (value) {
              model.updateContinueButton(value);
              //Logic
              //Do something with the user input.
              //model.setProductName(productName: value);
              //model.productPageFormKey.currentState!.validate();
              //model.updateProductPageNextButton();
            },
          ),
        ),
      ),
    );
  }
}

class MoneyTextField extends StatelessWidget {
  const MoneyTextField({
    Key? key,
    required this.textController,
    required this.validatorCallback,
    required this.onChangedCallback,
  }) : super(key: key);
  final TextEditingController textController;
  final dynamic validatorCallback;
  final dynamic onChangedCallback;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      autofocus: false,
      keyboardType: TextInputType.phone,
      validator: validatorCallback,
      cursorColor: app_colors.primaryBlack,
      cursorWidth: 1,
      //cursorHeight: 23,
      maxLength: 8,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 27,
        fontWeight: FontWeight.bold,
        fontFamily: 'Inter',
        color: app_colors.primaryBlue,
      ),
      inputFormatters: [
        /*MoneyInputFormatter(
          mantissaLength: 2,
          maxTextLength: 12,
          //leadingSymbol: getCurrency(),
          leadingSymbol: '\u{20A6}',
          //useSymbolPadding: true
          //trailingSymbol: MoneySymbols.BITCOIN_SIGN,
          //thousandSeparator: ThousandSeparator.Period,
        )*/
        /*CurrencyTextInputFormatter(
          decimalDigits: 0,
          symbol: '\u{20A6}',
          //symbol: 'KRW(원) ',
        ),*/
        Provider.of<EnterAmountViewModel>(context).formatter,
      ],
      onChanged: onChangedCallback,
      decoration: moneyTextFieldDecoration,
    );
  }
}

class ContinueButton extends StatelessWidget {
  const ContinueButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<EnterAmountViewModel>(context);
    return !model.isCompleted
        ? const WideButtonAsh(label: 'Continue')
        : WideButton(
            label: 'Continue',
            onPressedCallback: () {
              if (model.paymentType == PaymentType.debitCard) {
                Navigator.pushNamed(context, PaymentCardsScreen.id);
              } else if (model.paymentType == PaymentType.bankTransfer) {
                Navigator.pushNamed(context, BankTransferScreen.id);
              }
              model.instantiate();
              //model.notifyListener();
            },
          );
  }
}
