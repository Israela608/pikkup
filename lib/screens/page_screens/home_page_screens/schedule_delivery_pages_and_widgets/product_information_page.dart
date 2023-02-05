import 'package:flutter/material.dart';
import 'package:pikkup/components/text_field_boxes/number_box.dart';
import 'package:pikkup/components/text_field_boxes/text_box.dart';
import 'package:pikkup/components/texts/body_text.dart';
import 'package:pikkup/components/texts/header_text.dart';
import 'package:pikkup/config/themes/app_colors.dart' as app_colors;
import 'package:pikkup/screens/page_screens/home_page_screens/schedule_delivery_pages_and_widgets/page_next_button.dart';
import 'package:pikkup/view_models/home_page_view_models/send_a_package_view_model.dart';
import 'package:provider/provider.dart';

class ProductInformationPage extends StatelessWidget {
  ProductInformationPage({Key? key}) : super(key: key);
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<SendAPackageViewModel>(context);
    return SingleChildScrollView(
      child: Form(
        //key: _formKey,
        key: model.productPageFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const HeaderText(
              text: 'Product Information',
              headerTextSize: HeaderTextSize.verySmall,
            ),
            const SizedBox(height: 8),
            const BodyText(
                text:
                    'Make sure the information you are providing is as accurate as possible'),
            const SizedBox(height: 32),
            ProductBoxWidget(textController: _productNameController),
            const SizedBox(height: 24),
            Container(
              alignment: Alignment.centerLeft,
              height: 94,
              child: const HeaderText(
                text: 'WeightBox',
                color: app_colors.primaryBlue,
              ),
            ),
            const SizedBox(height: 24),
            QuantityBoxWidget(textController: _quantityController),
            SizedBox(height: 0.134 * MediaQuery.of(context).size.height),
            NextButton(isCompleted: model.isProductPageCompleted),
            const SizedBox(height: 52),
          ],
        ),
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
