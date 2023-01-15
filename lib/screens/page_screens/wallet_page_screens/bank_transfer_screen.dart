import 'package:flutter/material.dart';
import 'package:pikkup/components/buttons/wide_outlined_button.dart';
import 'package:pikkup/components/texts/description_text_small_white.dart';
import 'package:pikkup/components/texts/header_text_white.dart';
import 'package:pikkup/utils/app_colors.dart' as app_colors;
import 'package:pikkup/utils/constants.dart';
import 'package:pikkup/view_models/wallet_page_view_models/enter_amount_view_model.dart';
import 'package:pikkup/widgets/standard_app_bar_blue.dart';
import 'package:provider/provider.dart';

class BankTransferScreen extends StatelessWidget {
  const BankTransferScreen({Key? key}) : super(key: key);

  static const String id = 'bank_transfer_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: app_colors.background,
      appBar: StandardAppBarBlue(label: 'Payment'),
      body:
          //You can put a SingleChildScrollView here
          Container(
        padding: const EdgeInsets.symmetric(horizontal: kStandardPaddingSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 32),
            const PaymentDescriptionCard(),
            const SizedBox(height: 24),
            const BankDetailsCard(),
            const Spacer(),
            //SizedBox(height: 0.249 * MediaQuery.of(context).size.height),
            WideOutlinedButton(
              label: 'I’ve sent the money',
              onPressedCallback: () {},
            ),
            const SizedBox(height: 62),
          ],
        ),
      ),
    );
  }
}

class PaymentDescriptionCard extends StatelessWidget {
  const PaymentDescriptionCard({Key? key}) : super(key: key);

  TextSpan cardText({required String text}) {
    return TextSpan(
      text: text,
      style: const TextStyle(
        fontSize:
            16, //TextSpan fontSize is different from normal text fontSize, since it does not follow the device textSize configuration
        fontFamily: 'Inter',
        fontWeight: FontWeight.w500,
        color: app_colors.primaryBlack,
      ),
    );
  }

  TextSpan cardTextBold({required String text}) {
    return TextSpan(
      text: text,
      style: const TextStyle(
        fontSize:
            16, //TextSpan fontSize is different from normal text fontSize, since it does not follow the device textSize configuration
        fontWeight: FontWeight.bold,
        fontFamily: 'Sora',
        color: app_colors.primaryBlack,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: app_colors.fillAsh,
      ),
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 7.5, horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  cardText(text: 'Transfer '),
                  cardText(
                      text:
                          'N${Provider.of<EnterAmountViewModel>(context).amount.toString()}'),
                  cardText(text: ' to the account details below'),
                ]),
              ),
              const SizedBox(height: 10),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  cardText(text: 'Use '),
                  cardTextBold(text: '3A64FI9023'),
                  cardText(text: ' as description'),
                ]),
              ),
            ],
          )),
    );
  }
}

class BankDetailsCard extends StatelessWidget {
  const BankDetailsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: app_colors.primaryBlue,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const DescriptionTextSmallWhite(text: 'FIRST BANK'),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const HeaderTextWhite(text: '4658603005'),
                  copyAccountNumber(),
                ],
              ),
              const SizedBox(height: 12),
              const DescriptionTextSmallWhite(text: 'DANIEL OSAKWE'),
            ],
          )),
    );
  }

  Widget copyAccountNumber() {
    return Material(
      borderRadius: BorderRadius.circular(4),
      color: app_colors.background,
      child: InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Colors.transparent,
          ),
          child: Container(
            padding: const EdgeInsets.all(8),
            child: const Text(
              'COPY',
              style: TextStyle(
                fontSize: 10,
                fontFamily: 'Sora',
                fontWeight: FontWeight.bold,
                color: app_colors.primaryBlueDarker,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
