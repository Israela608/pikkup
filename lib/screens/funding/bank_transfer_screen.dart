import 'package:flutter/material.dart';
import 'package:pikkup/components/buttons/wide_button.dart';
import 'package:pikkup/components/spacer.dart';
import 'package:pikkup/components/texts/body_text.dart';
import 'package:pikkup/components/texts/header_text.dart';
import 'package:pikkup/config/themes/app_colors.dart' as app_colors;
import 'package:pikkup/config/themes/decorations.dart';
import 'package:pikkup/config/themes/styles.dart';
import 'package:pikkup/utils/dimensions.dart';
import 'package:pikkup/utils/ui_parameters.dart';
import 'package:pikkup/view_models/wallet_page_view_models/enter_amount_view_model.dart';
import 'package:pikkup/widgets/scaffolds/standard_scaffold.dart';
import 'package:provider/provider.dart';

class BankTransferScreen extends StatelessWidget {
  const BankTransferScreen({Key? key}) : super(key: key);

  static const String id = '/bank_transfer_screen';

  @override
  Widget build(BuildContext context) {
    return StandardScaffold(
      title: 'Payment',
      isScrollable: false,
      isBlueAppBar: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: Dimensions.d32),
          const PaymentDescriptionCard(),
          const StandardSpacer(),
          const BankDetailsCard(),
          const Spacer(),
          WideButton(
            label: 'I’ve sent the money',
            onPressedCallback: () {},
            isOutlined: true,
          ),
          SizedBox(height: Dimensions.d60 + Dimensions.d2),
        ],
      ),
    );
  }
}

class PaymentDescriptionCard extends StatelessWidget {
  const PaymentDescriptionCard({Key? key}) : super(key: key);

  TextSpan cardText({required String text}) {
    return TextSpan(
      text: text,
      style: interNormalText.copyWith(fontWeight: FontWeight.w500),
    );
  }

  TextSpan cardTextBold({required String text}) {
    return TextSpan(
      text: text,
      style: soraSubtitleText.copyWith(fontWeight: FontWeight.w600),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: smallCardDecoration.copyWith(color: app_colors.fillAsh),
      child: Container(
          padding: EdgeInsets.symmetric(
              vertical: Dimensions.d7 + (Dimensions.d1 * 0.5),
              horizontal: Dimensions.d8),
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
              SizedBox(height: Dimensions.d10),
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
      decoration: smallCardDecoration.copyWith(color: app_colors.primaryBlue),
      child: Container(
          padding: UIParameters.standardPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const BodyText(
                text: 'FIRST BANK',
                isSmall: true,
                color: app_colors.white,
              ),
              SizedBox(height: Dimensions.d12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const HeaderText(
                    text: '4658603005',
                    color: app_colors.white,
                  ),
                  copyAccountNumber(),
                ],
              ),
              SizedBox(height: Dimensions.d12),
              const BodyText(
                text: 'DANIEL OSAKWE',
                isSmall: true,
                color: app_colors.white,
              ),
            ],
          )),
    );
  }

  Widget copyAccountNumber() {
    return Material(
      borderRadius: UIParameters.smallBorderRadius,
      color: app_colors.background,
      child: InkWell(
        onTap: () {},
        child: Container(
          decoration: smallCardDecoration.copyWith(color: Colors.transparent),
          child: Container(
            padding: UIParameters.smallPadding,
            child: Text(
              'COPY',
              style: soraSmallSubtitleText.copyWith(
                color: app_colors.primaryBlueDarker,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
