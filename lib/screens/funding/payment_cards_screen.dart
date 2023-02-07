import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pikkup/components/buttons/wide_button.dart';
import 'package:pikkup/components/buttons/wide_button_ash.dart';
import 'package:pikkup/components/texts/header_text.dart';
import 'package:pikkup/components/texts/plain_text.dart';
import 'package:pikkup/config/themes/app_colors.dart' as app_colors;
import 'package:pikkup/screens/funding/add_a_card_screen.dart';
import 'package:pikkup/view_models/wallet_page_view_models/enter_amount_view_model.dart';
import 'package:pikkup/view_models/wallet_page_view_models/payment_cards_view_model.dart';
import 'package:pikkup/widgets/payment_card_tile.dart';
import 'package:pikkup/widgets/scaffolds/standard_scaffold.dart';
import 'package:provider/provider.dart';

class PaymentCardsScreen extends StatefulWidget {
  const PaymentCardsScreen({Key? key}) : super(key: key);

  static const String id = 'payment_cards_screen';

  @override
  State<PaymentCardsScreen> createState() => _PaymentCardsScreenState();
}

class _PaymentCardsScreenState extends State<PaymentCardsScreen> {
  @override
  void initState() {
    Provider.of<PaymentCardsViewModel>(context, listen: false).instantiate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StandardScaffold(
      title: 'Payment',
      isBlueAppBar: true,
      child: PaymentCardsWidget(
          isCardPresent:
              Provider.of<PaymentCardsViewModel>(context, listen: false)
                  .isCardPresent),
    );
  }
}

class NoCardsWidget extends StatelessWidget {
  const NoCardsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 72),
        const Image(
          height: 187,
          image: AssetImage('images/cards_image.png'),
        ),
        const SizedBox(height: 41),
        const HeaderText(
          text: 'No cards have been added',
          headerTextSize: HeaderTextSize.small,
          isCentered: true,
        ),
        const SizedBox(height: 8),
        const Text(
          'Add cards now for smooth and easy transaction ',
          style: TextStyle(
            fontSize: 12,
            fontFamily: 'Inter',
            color: app_colors.primaryBlack,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 36),
        const Spacer(),
        WideButton(
          label: 'Add a card',
          onPressedCallback: () {
            Navigator.pushNamed(context, AddACardScreen.id);
          },
        ),
        const SizedBox(height: 52),
      ],
    );
  }
}

class PaymentCardsWidget extends StatelessWidget {
  const PaymentCardsWidget({Key? key, required this.isCardPresent})
      : super(key: key);
  final bool isCardPresent;

  @override
  Widget build(BuildContext context) {
    if (!isCardPresent) {
      return const NoCardsWidget();
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 29),
          const HeaderText(
            text: 'My cards',
            headerTextSize: HeaderTextSize.verySmall,
          ),
          const SizedBox(height: 22),
          ListView(
            shrinkWrap: true,
            children: const [
              CardList(),
              SizedBox(height: 6),
              AddNewCardWidget()
            ],
          ),
          // const SizedBox(height: 21),
          SizedBox(height: 0.4 * MediaQuery.of(context).size.height),
          const PayButton(),
          const SizedBox(height: 31),
        ],
      );
    }
  }
}

class CardList extends StatelessWidget {
  const CardList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PaymentCardsViewModel>(builder: (context, model, child) {
      return ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            child: Material(
              borderRadius: BorderRadius.circular(4),
              color: model.isSelected(index: index)
                  ? app_colors.fillAsh
                  : app_colors.cardBlue,
              child: InkWell(
                onTap: () => model.setSelectedCard(index: index),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.transparent,
                    border: Border.all(
                      width: 1.5,
                      color: model.isSelected(index: index)
                          ? app_colors.primaryBlue
                          : app_colors.cardAsh,
                    ),
                  ),
                  child: PaymentCardTile(
                      cardNumber:
                          model.paymentCards[index].cardNumber.toString(),
                      expiryDate:
                          '${model.paymentCards[index].expiryMonth.toString()}/${model.paymentCards[index].expiryYear.toString()}',
                      cardType: model.paymentCards[index].cardType.toString()),
                ),
              ),
            ),
          );
        },
        itemCount: model
            .cardCount, //Specify the number of contents that will be displayed in the ListView
      );
    });
  }
}

class AddNewCardWidget extends StatelessWidget {
  const AddNewCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, AddACardScreen.id),
      child: Row(
        children: [
          Container(
            height: 43.2,
            width: 43.2,
            //padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.6),
              color: Colors.transparent,
              border: Border.all(
                width: 1.9,
                color: app_colors.cardAsh,
              ),
            ),
            child: const Icon(
              Icons.add,
              color: app_colors.primaryBlue,
            ),
          ),
          const SizedBox(width: 16),
          const PlainText(
            text: 'Add new card',
            isBlackColor: true,
          ),
        ],
      ),
    );
  }
}

class PayButton extends StatelessWidget {
  const PayButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<PaymentCardsViewModel>(context);
    final String amount =
        Provider.of<EnterAmountViewModel>(context, listen: false)
            .amount
            .toString();
    return !model.isPayButtonActivated
        ? WideButtonAsh(label: 'Pay N$amount')
        : WideButton(
            label: 'Pay N$amount',
            onPressedCallback: () {
              /*if (model.selectedOption.paymentId == PaymentId.wallet) {
                //Navigator.pushNamed(context, SendAPackageScreen.id);
              } else if (model.selectedOption.paymentId ==
                  PaymentId.debitCard) {
                //Navigator.pushNamed(context, ScheduleDeliveryScreen.id);
              } else if (model.selectedOption.paymentId ==
                  PaymentId.bankTransfer) {
                //Navigator.pushNamed(context, PromoScreen.id);
              }
              model.instantiate();
              model.notifyListener();*/
            },
          );
  }
}
