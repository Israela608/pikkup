import 'package:flutter/material.dart';
import 'package:pikkup/components/buttons/view_all_button.dart';
import 'package:pikkup/components/texts/body_text.dart';
import 'package:pikkup/components/texts/money_text.dart';
import 'package:pikkup/components/texts/plain_text.dart';
import 'package:pikkup/config/themes/app_colors.dart' as app_colors;
import 'package:pikkup/screens/funding/fund_wallet_screen.dart';
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
        children: const [
          SizedBox(height: 40),
          FundBox(),
          SizedBox(height: 32),
          FundingHistory(history: true),
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
        borderRadius: BorderRadius.circular(8),
        color: app_colors.primaryBlue,
      ),
      child: Container(
          padding: const EdgeInsets.only(top: 32, bottom: 35),
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
                  SizedBox(height: 8),
                  MoneyText(amount: '1,700'),
                ],
              ),
              const SizedBox(height: 33),
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
      height: 41,
      child: OutlinedButton(
        child: const Text(
          'Fund wallet',
          style: TextStyle(
            fontSize: 13,
            fontFamily: 'Sora',
            color: app_colors.primaryWhite,
          ),
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
        children: const [
          SizedBox(height: 6),
          Text(
            'Funding History',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              fontFamily: 'Sora',
              color: app_colors.primaryBlack,
            ),
          ),
          SizedBox(height: 58),
          Image(
            height: 125,
            image: AssetImage('images/no_transactions.png'),
          ),
          SizedBox(height: 36),
          BodyText(
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
              const Text(
                'Funding History',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Sora',
                  color: app_colors.primaryBlack,
                ),
              ),
              ViewAllButton(
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 19),
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
      margin: const EdgeInsets.only(bottom: 16),
      child: Material(
        color: app_colors.tileBlue,
        child: InkWell(
          onTap: () {},
          child: Container(
            color: Colors.transparent,
            height: 74,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
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
                  padding: const EdgeInsets.symmetric(vertical: 17.33),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: const TextSpan(
                          children: [
                            WidgetSpan(
                              alignment: PlaceholderAlignment.middle,
                              child: Image(
                                image: AssetImage('images/naira_small.png'),
                                height: 18.04,
                              ),
                            ),
                            WidgetSpan(child: SizedBox(width: 2)),
                            WidgetSpan(
                              alignment: PlaceholderAlignment.middle,
                              child: Text(
                                '1,700',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Sora',
                                  color: app_colors.primaryBlack,
                                ),
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
