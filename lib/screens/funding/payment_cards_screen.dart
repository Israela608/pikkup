import 'package:flutter/material.dart';
import 'package:pikkup/components/buttons/wide_button.dart';
import 'package:pikkup/components/buttons/wide_button_ash.dart';
import 'package:pikkup/components/spacer.dart';
import 'package:pikkup/components/texts/body_text.dart';
import 'package:pikkup/components/texts/header_text.dart';
import 'package:pikkup/components/texts/plain_text.dart';
import 'package:pikkup/config/themes/app_colors.dart' as app_colors;
import 'package:pikkup/screens/funding/add_a_card_screen.dart';
import 'package:pikkup/utils/dimensions.dart';
import 'package:pikkup/utils/ui_parameters.dart';
import 'package:pikkup/view_models/wallet_page_view_models/enter_amount_view_model.dart';
import 'package:pikkup/view_models/wallet_page_view_models/payment_cards_view_model.dart';
import 'package:pikkup/widgets/payment_card_tile.dart';
import 'package:pikkup/widgets/scaffolds/standard_scaffold.dart';
import 'package:provider/provider.dart';

class PaymentCardsScreen extends StatefulWidget {
  const PaymentCardsScreen({Key? key}) : super(key: key);

  static const String id = '/payment_cards_screen';

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
        SizedBox(height: Dimensions.d72),
        Image(
          height: Dimensions.d180 + Dimensions.d7,
          image: const AssetImage('images/cards_image.png'),
        ),
        SizedBox(height: Dimensions.d41),
        const HeaderText(
          text: 'No cards have been added',
          headerTextSize: HeaderTextSize.small,
          isCentered: true,
        ),
        const TitleBodySpacer(),
        const BodyText(
          text: 'Add cards now for smooth and easy transaction ',
          color: app_colors.primaryBlack,
          isCentered: true,
        ),
        SizedBox(height: Dimensions.d36),
        const Spacer(),
        WideButton(
          label: 'Add a card',
          onPressedCallback: () {
            Navigator.pushNamed(context, AddACardScreen.id);
          },
        ),
        SizedBox(height: Dimensions.d50 + Dimensions.d2),
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
            margin: EdgeInsets.only(bottom: Dimensions.standardPaddingSize),
            child: Material(
              borderRadius: UIParameters.smallBorderRadius,
              color: model.isSelected(index: index)
                  ? app_colors.fillAsh
                  : app_colors.cardBlue,
              child: InkWell(
                onTap: () => model.setSelectedCard(index: index),
                child: Container(
                  padding: UIParameters.screenHorizontalPadding,
                  decoration: BoxDecoration(
                    borderRadius: UIParameters.smallBorderRadius,
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
            height: Dimensions.d40 + Dimensions.d3 + (Dimensions.d1 * 0.2),
            width: Dimensions.d40 + Dimensions.d3 + (Dimensions.d1 * 0.2),
            //padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(Dimensions.d7 + (Dimensions.d1 * 0.6)),
              color: Colors.transparent,
              border: Border.all(
                width: Dimensions.d1 + (Dimensions.d1 * 0.9),
                color: app_colors.cardAsh,
              ),
            ),
            child: const Icon(
              Icons.add,
              color: app_colors.primaryBlue,
            ),
          ),
          SizedBox(width: Dimensions.standardPaddingSize),
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
