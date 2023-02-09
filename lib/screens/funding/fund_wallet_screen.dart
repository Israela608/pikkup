import 'package:flutter/material.dart';
import 'package:pikkup/components/buttons/wide_button.dart';
import 'package:pikkup/components/buttons/wide_button_ash.dart';
import 'package:pikkup/components/spacer.dart';
import 'package:pikkup/components/texts/body_text.dart';
import 'package:pikkup/components/texts/header_text.dart';
import 'package:pikkup/components/texts/money_text.dart';
import 'package:pikkup/components/texts/plain_text.dart';
import 'package:pikkup/config/themes/app_colors.dart' as app_colors;
import 'package:pikkup/config/themes/decorations.dart';
import 'package:pikkup/models/fund_wallet_options_model.dart';
import 'package:pikkup/screens/funding/enter_amount_screen.dart';
import 'package:pikkup/utils/dimensions.dart';
import 'package:pikkup/utils/ui_parameters.dart';
import 'package:pikkup/view_models/wallet_page_view_models/enter_amount_view_model.dart';
import 'package:pikkup/view_models/wallet_page_view_models/fund_wallet_view_model.dart';
import 'package:pikkup/widgets/scaffolds/standard_scaffold.dart';
import 'package:provider/provider.dart';

class FundWalletScreen extends StatefulWidget {
  const FundWalletScreen({Key? key}) : super(key: key);

  static const String id = '/fund_wallet_screen';

  @override
  State<FundWalletScreen> createState() => _FundWalletScreenState();
}

class _FundWalletScreenState extends State<FundWalletScreen> {
  @override
  void initState() {
    Provider.of<FundWalletViewModel>(context, listen: false).instantiate();
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
          SizedBox(height: Dimensions.d40),
          const FundBalanceBox(),
          SizedBox(height: Dimensions.d40 + Dimensions.d4),
          const HeaderText(
            text: 'Fund wallet with',
            headerTextSize: HeaderTextSize.verySmall,
          ),
          SizedBox(height: Dimensions.d30 + Dimensions.d9),
          const FundingOptionList(),
          SizedBox(height: Dimensions.d160 + Dimensions.d9),
          const ContinueButton(),
          SizedBox(height: Dimensions.d30 + Dimensions.d1),
        ],
      ),
    );
  }
}

class FundBalanceBox extends StatelessWidget {
  const FundBalanceBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: cardDecoration.copyWith(color: app_colors.primaryBlue),
      child: Container(
          padding: EdgeInsets.only(
              top: Dimensions.d32, bottom: Dimensions.d30 + Dimensions.d5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: const [
                  BodyText(
                    text: 'Balance',
                    isSmall: true,
                    color: app_colors.white,
                  ),
                  TitleBodySpacer(),
                  MoneyText(amount: '1,700'),
                ],
              ),
            ],
          )),
    );
  }
}

class FundingOptionList extends StatelessWidget {
  const FundingOptionList({Key? key}) : super(key: key);

  Widget paymentOptionsList() {
    return Consumer<FundWalletViewModel>(builder: (context, model, child) {
      return ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(bottom: Dimensions.standardPaddingSize),
            child: Material(
              borderRadius: UIParameters.smallBorderRadius,
              color: model.isSelected(index: index)
                  ? app_colors.fillAsh
                  : app_colors.cardBlue,
              child: InkWell(
                onTap: () => model.setSelectedOption(index: index),
                child: Container(
                  padding: EdgeInsets.only(
                    left: Dimensions.d24,
                    right: Dimensions.d16,
                    top: Dimensions.d20,
                    bottom: Dimensions.d20,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: UIParameters.smallBorderRadius,
                    color: Colors.transparent,
                    border: Border.all(
                      width: 1.5,
                      color: model.isSelected(index: index)
                          ? app_colors.primaryBlue
                          : app_colors.primaryBlue.withOpacity(0.15),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      iconAndLabel(
                          label: model.fundingOptions[index].label.toString(),
                          iconImage:
                              model.fundingOptions[index].icon.toString()),
                      Visibility(
                        visible: model.isSelected(index: index),
                        child: const Icon(Icons.check_circle_rounded,
                            color: app_colors.success),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: model
            .optionCount, //Specify the number of contents that will be displayed in the ListView
      );
    });
  }

  Widget iconAndLabel({required String label, required String iconImage}) {
    return Row(
      children: [
        ImageIcon(
          AssetImage(iconImage),
          color: app_colors.primaryBlue,
        ),
        SizedBox(width: Dimensions.standardPaddingSize),
        PlainText(
          text: label,
          isBlackColor: true,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return paymentOptionsList();
  }
}

class ContinueButton extends StatelessWidget {
  const ContinueButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<FundWalletViewModel>(context);
    return !model.isContinueButtonActivated
        ? const WideButtonAsh(label: 'Continue')
        : WideButton(
            label: 'Continue',
            onPressedCallback: () {
              // if (model.selectedOption.paymentType == PaymentType.debitCard) {
              //   Navigator.pushNamed(context, PaymentCardsScreen.id);
              // } else if (model.selectedOption.paymentType ==
              //     PaymentType.bankTransfer) {
              //   Navigator.pushNamed(context, BankTransferScreen.id);
              // }
              Navigator.pushNamed(context, EnterAmountScreen.id);

              PaymentType? paymentType = model.selectedOption.paymentType;
              if (paymentType != null) {
                Provider.of<EnterAmountViewModel>(context, listen: false)
                    .setPaymentType(paymentType: paymentType);
              }

              model.instantiate();
              model.notifyListener();
            },
          );
  }
}
