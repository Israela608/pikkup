import 'package:flutter/material.dart';
import 'package:pikkup/components/spacer.dart';
import 'package:pikkup/components/text_field_boxes/number_box.dart';
import 'package:pikkup/components/text_field_boxes/text_box.dart';
import 'package:pikkup/components/texts/body_text.dart';
import 'package:pikkup/components/texts/header_text.dart';
import 'package:pikkup/config/themes/app_colors.dart' as app_colors;
import 'package:pikkup/screens/send/pages/page_next_button.dart';
import 'package:pikkup/utils/dimensions.dart';
import 'package:pikkup/view_models/home_page_view_models/send_a_package_view_model.dart';
import 'package:provider/provider.dart';

class ProductInformationPage extends StatelessWidget {
  ProductInformationPage({Key? key}) : super(key: key);
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<SendAPackageViewModel>(context);
    return Form(
      //key: _formKey,
      key: model.productPageFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const HeaderText(
            text: 'Product Information',
            headerTextSize: HeaderTextSize.verySmall,
          ),
          SizedBox(height: Dimensions.smallPaddingSize),
          const BodyText(
              text:
                  'Make sure the information you are providing is as accurate as possible'),
          const BigSpacer(),
          ProductBoxWidget(textController: _productNameController),
          const StandardSpacer(),
          Container(
            alignment: Alignment.centerLeft,
            height: Dimensions.d80 + Dimensions.d10 + Dimensions.d4,
            child: const HeaderText(
              text: 'WeightBox',
              color: app_colors.primaryBlue,
            ),
          ),
          const StandardSpacer(),
          QuantityBoxWidget(textController: _quantityController),
          SizedBox(height: 0.134 * Dimensions.screenHeight),
          NextButton(isCompleted: model.isProductPageCompleted),
          SizedBox(height: Dimensions.d52),
        ],
      ),
    );
  }
}

class ProductBoxWidget extends StatelessWidget {
  const ProductBoxWidget({Key? key, required this.textController})
      : super(key: key);
  final dynamic textController;

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<SendAPackageViewModel>(context);
    return TextBox(
      text: 'What are you sending?',
      textController: textController,
      validatorCallback: (value) {
        return model.productNameValidator(nameValue: value!);
      },
      onChangedCallback: (value) {
        //Logic
        //Do something with the user input.
        model.setProductName(productName: value);
      },
    );
  }
}

class QuantityBoxWidget extends StatelessWidget {
  const QuantityBoxWidget({Key? key, required this.textController})
      : super(key: key);
  final dynamic textController;

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<SendAPackageViewModel>(context);
    return NumberBox(
      text: 'Quantity',
      textController: textController,
      validatorCallback: (value) {
        return model.quantityValidator(quantityText: value!);
      },
      onChangedCallback: (value) {
        //Logic
        //Do something with the user input.
        model.setQuantity(quantity: value);
      },
    );
  }
}
