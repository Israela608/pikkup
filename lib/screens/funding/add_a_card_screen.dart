import 'package:flutter/material.dart';
import 'package:pikkup/components/buttons/wide_button.dart';
import 'package:pikkup/components/buttons/wide_button_ash.dart';
import 'package:pikkup/components/spacer.dart';
import 'package:pikkup/components/text_field_boxes/card_cvv_box.dart';
import 'package:pikkup/components/text_field_boxes/card_expiry_date_box.dart';
import 'package:pikkup/components/text_field_boxes/card_number_box.dart';
import 'package:pikkup/components/text_field_boxes/text_box.dart';
import 'package:pikkup/components/texts/header_text.dart';
import 'package:pikkup/screens/funding/payment_cards_screen.dart';
import 'package:pikkup/utils/dimensions.dart';
import 'package:pikkup/view_models/wallet_page_view_models/add_a_card_view_model.dart';
import 'package:pikkup/widgets/scaffolds/standard_scaffold.dart';
import 'package:provider/provider.dart';

class AddACardScreen extends StatefulWidget {
  const AddACardScreen({Key? key}) : super(key: key);

  static const String id = '/add_a_card_screen';

  @override
  State<AddACardScreen> createState() => _AddACardScreenState();
}

class _AddACardScreenState extends State<AddACardScreen> {
  //TextController to read text entered in text field
  final TextEditingController _cardNameController = TextEditingController();

  final TextEditingController _cardNumberController = TextEditingController();

  final TextEditingController _expiryDateController = TextEditingController();

  final TextEditingController _cvvController = TextEditingController();

  //final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    Provider.of<AddACardViewModel>(context, listen: false).initialize();
    super.initState();
  }

  /*@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Provider.of<AddACardViewModel>(context, listen: false).dis();
  }
*/
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<AddACardViewModel>(context);
    return StandardScaffold(
      title: 'Payment',
      isBlueAppBar: true,
      child: Form(
        key: model.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: Dimensions.d20 + Dimensions.d9),
            const HeaderText(
              text: 'Add card',
              headerTextSize: HeaderTextSize.verySmall,
            ),
            SizedBox(height: Dimensions.d32),
            CardNameBoxWidget(textController: _cardNameController),
            const StandardSpacer(),
            CardNumberBoxWidget(textController: _cardNumberController),
            const StandardSpacer(),
            Row(
              children: [
                Expanded(
                  child: ExpiryDateBoxWidget(
                      textController: _expiryDateController),
                ),
                SizedBox(width: Dimensions.d32),
                Expanded(child: CvvBoxWidget(textController: _cvvController)),
              ],
            ),
            SizedBox(height: Dimensions.d10),
            //ErrorMessage(errorMessage: model.errorMessage),
            SizedBox(height: Dimensions.d200 + Dimensions.d5),
            AddToMyCardsButton(isCompleted: model.isCompleted),
            SizedBox(height: Dimensions.d20),
          ],
        ),
      ),
    );
  }
}

class CardNameBoxWidget extends StatelessWidget {
  const CardNameBoxWidget({Key? key, required this.textController})
      : super(key: key);
  final dynamic textController;

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<AddACardViewModel>(context);
    return TextBox(
      text: 'Card Name',
      textController: textController,
      validatorCallback: (value) {
        return model.cardNameValidator(cardNameValue: value!);
      },
      onChangedCallback: (value) {
        //Logic
        //Do something with the user input.
        model.setCardName(cardName: value);
        model.updateAddToMyCardsButton();
      },
    );
  }
}

class CardNumberBoxWidget extends StatelessWidget {
  const CardNumberBoxWidget({Key? key, required this.textController})
      : super(key: key);
  final dynamic textController;

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<AddACardViewModel>(context);

    return CardNumberBox(
      cardType: model.cardType,
      textController: textController,
      validatorCallback: (value) {
        return model.cardNumberValidator(cardNumberValue: value!);
      },
      onChangedCallback: (value) {
        //Logic
        //Do something with the user input.
        model.setCardNumber(cardNumber: value);
        model.updateAddToMyCardsButton();
      },
    );
  }
}

class ExpiryDateBoxWidget extends StatelessWidget {
  const ExpiryDateBoxWidget({Key? key, required this.textController})
      : super(key: key);
  final dynamic textController;

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<AddACardViewModel>(context);
    return CardExpiryDateBox(
      textController: textController,
      validatorCallback: (value) {
        return model.expiryDateValidator(expiryDateValue: value!);
      },
      onChangedCallback: (value) {
        //Logic
        //Do something with the user input.
        model.setExpiryDate(expiryDate: value);
        model.updateAddToMyCardsButton();

        debugPrint(value);
      },
    );
  }
}

class CvvBoxWidget extends StatelessWidget {
  const CvvBoxWidget({Key? key, required this.textController})
      : super(key: key);
  final dynamic textController;

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<AddACardViewModel>(context);
    return CardCvvBox(
      textController: textController,
      validatorCallback: (value) {
        return model.cvvValidator(cvvValue: value!);
      },
      onChangedCallback: (value) {
        //Logic
        //Do something with the user input.
        model.setCvv(cvv: value);
        model.updateAddToMyCardsButton();
      },
    );
  }
}

class AddToMyCardsButton extends StatelessWidget {
  const AddToMyCardsButton({Key? key, required this.isCompleted})
      : super(key: key);
  final bool isCompleted;

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<AddACardViewModel>(context);
    return !isCompleted
        ? const WideButtonAsh(label: 'Add to my cards')
        : WideButton(
            label: 'Add to my cards',
            onPressedCallback: () {
              model.addPaymentCard();
              //Navigator.popAndPushNamed(context, PaymentCardsScreen.id);
              Navigator.pushReplacementNamed(context, PaymentCardsScreen.id);
              /* if (Card is valid){
          // Navigator.pushNamed(
          //     context, Screen.id); ///////////////

          // Save card details
        }else{
          //Card is not valid
        }*/
            },
          );
  }
}
