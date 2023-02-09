import 'package:flutter/material.dart';
import 'package:pikkup/components/buttons/view_all_button.dart';
import 'package:pikkup/components/texts/body_text.dart';
import 'package:pikkup/components/texts/money_text.dart';
import 'package:pikkup/components/texts/plain_text.dart';
import 'package:pikkup/config/themes/app_colors.dart' as app_colors;
import 'package:pikkup/config/themes/styles.dart';
import 'package:pikkup/screens/funding/fund_wallet_screen.dart';
import 'package:pikkup/utils/dimensions.dart';
import 'package:pikkup/utils/ui_parameters.dart';
import 'package:pikkup/widgets/scaffolds/standard_scaffold.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StandardScaffold(
      isBackButtonPresent: false,
      isBlueAppBar: true,
      title: 'Wallet',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: Dimensions.d40),
          const FundBox(),
          SizedBox(height: Dimensions.d32),
          const FundingHistory(history: true),
        ],
      ),
    );
  }
}

class FundBox extends StatelessWidget {
  const FundBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: UIParameters.standardBorderRadius,
        color: app_colors.primaryBlue,
      ),
      child: Container(
          padding: EdgeInsets.only(
            top: Dimensions.d32,
            bottom: Dimensions.d30 + Dimensions.d5,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const BodyText(
                    text: 'Balance',
                    isSmall: true,
                    color: app_colors.white,
                  ),
                  SizedBox(height: Dimensions.smallPaddingSize),
                  const MoneyText(amount: '1,700'),
                ],
              ),
              SizedBox(height: Dimensions.d30 + Dimensions.d3),
              const FundWalletButton(),
            ],
          )),
    );
  }
}

class FundWalletButton extends StatelessWidget {
  const FundWalletButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimensions.d41,
      child: OutlinedButton(
        child: Text(
          'Fund wallet',
          style: soraSubtitleText.copyWith(color: app_colors.primaryWhite),
        ),
        style: OutlinedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            side: const BorderSide(color: app_colors.primaryWhite, width: 1),
            padding: const EdgeInsets.symmetric(horizontal: 26.5)),
        onPressed: () {
          Navigator.pushNamed(context, FundWalletScreen.id);
        },
      ),
    );
  }
}

class FundingHistory extends StatelessWidget {
  const FundingHistory({Key? key, required this.history}) : super(key: key);
  final bool history;

  @override
  Widget build(BuildContext context) {
    if (!history) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: Dimensions.d6),
          Text(
            'Funding History',
            style:
                soraNormalText.copyWith(fontSize: Dimensions.standardTextSize),
          ),
          SizedBox(height: Dimensions.d50 + Dimensions.d8),
          Image(
            height: Dimensions.d120 + Dimensions.d5,
            image: const AssetImage('images/no_transactions.png'),
          ),
          SizedBox(height: Dimensions.d36),
          const BodyText(
            text: 'You haven’t made any transactions yet',
            isCentered: true,
          ),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Funding History',
                style: soraNormalText.copyWith(
                    fontSize: Dimensions.standardTextSize),
              ),
              ViewAllButton(
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(height: Dimensions.d10 + Dimensions.d9),
          const FundingHistoryTile(),
          const FundingHistoryTile(),
          const FundingHistoryTile(),
          const FundingHistoryTile(),
          const FundingHistoryTile(),
        ],
      );
    }
  }
}

class FundingHistoryTile extends StatelessWidget {
  const FundingHistoryTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: Dimensions.standardPaddingSize),
      child: Material(
        color: app_colors.tileBlue,
        child: InkWell(
          onTap: () {},
          child: Container(
            color: Colors.transparent,
            height: Dimensions.d70 + Dimensions.d4,
            padding: UIParameters.screenHorizontalPadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: Dimensions.standardPaddingSize),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      PlainText(
                        text: 'Debit Card',
                        isBlackColor: true,
                      ),
                      BodyText(
                        text: '5069 **** **** **63',
                        isSmall: true,
                        color: app_colors.textGrey,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical:
                        Dimensions.d10 + Dimensions.d7 + (Dimensions.d1 * 0.33),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            WidgetSpan(
                              alignment: PlaceholderAlignment.middle,
                              child: Image(
                                image:
                                    const AssetImage('images/naira_small.png'),
                                height: Dimensions.d18 + (Dimensions.d1 * 0.04),
                              ),
                            ),
                            WidgetSpan(child: SizedBox(width: Dimensions.d2)),
                            WidgetSpan(
                              alignment: PlaceholderAlignment.middle,
                              child: Text(
                                '1,700',
                                style: soraNormalText.copyWith(
                                    fontSize: Dimensions.standardTextSize),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const BodyText(
                        text: '12/01/2022',
                        isSmall: true,
                        color: app_colors.textGrey,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
