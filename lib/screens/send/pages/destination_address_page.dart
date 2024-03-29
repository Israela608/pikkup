import 'package:flutter/material.dart';
import 'package:pikkup/components/address_card.dart';
import 'package:pikkup/components/app_check_box.dart';
import 'package:pikkup/components/buttons/view_all_button.dart';
import 'package:pikkup/components/spacer.dart';
import 'package:pikkup/components/text_field_boxes/destination_address_box.dart';
import 'package:pikkup/components/texts/body_text.dart';
import 'package:pikkup/components/texts/header_text.dart';
import 'package:pikkup/config/themes/app_colors.dart' as app_colors;
import 'package:pikkup/config/themes/styles.dart';
import 'package:pikkup/screens/send/pages/page_next_button.dart';
import 'package:pikkup/utils/dimensions.dart';
import 'package:pikkup/view_models/home_page_view_models/send_a_package_view_model.dart';
import 'package:pikkup/widgets/send_a_package_bottomsheet.dart';
import 'package:provider/provider.dart';

class DestinationAddressPage extends StatelessWidget {
  DestinationAddressPage({Key? key}) : super(key: key);

  final TextEditingController _destinationAddressController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<SendAPackageViewModel>(context);
    return Form(
      key: model.destinationPageFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const HeaderText(
            text: 'Address Information',
            headerTextSize: HeaderTextSize.verySmall,
          ),
          const BigSpacer(),
          DestinationAddressBoxWidget(
              textController: _destinationAddressController),
          StandardSpacer(),
          const SaveDestinationAddressBox(),
          SizedBox(height: Dimensions.d48),
          DestinationPageSavedAddressBox(
            address: true,
            textController: _destinationAddressController,
          ),
          SizedBox(height: Dimensions.d60 + Dimensions.d9),
          NextButton(isCompleted: model.isDestinationPageCompleted),
          SizedBox(height: Dimensions.d50 + Dimensions.d2),
        ],
      ),
    );
  }
}

class DestinationAddressBoxWidget extends StatelessWidget {
  const DestinationAddressBoxWidget({Key? key, required this.textController})
      : super(key: key);
  final dynamic textController;

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<SendAPackageViewModel>(context);
    return DestinationAddressBox(
      text: 'Destination',
      addressController: textController,
      validatorCallback: (value) {
        return model.destinationAddressValidator(destinationAddress: value!);
      },
      onPressedCallback: null,
      onChangedCallback: (value) {
        //Logic
        //Do something with the user input.
        model.setDestinationAddress(destinationAddress: value);
        model.updateDestinationPageNextButton();
      },
    );
  }
}

class SaveDestinationAddressBox extends StatelessWidget {
  const SaveDestinationAddressBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<SendAPackageViewModel>(context);
    return Row(
      children: [
        AppCheckBox(
          isChecked: model.isDestinationAddressSaveCheck,
          onChangedCallback: (newValue) {
            //Note that the checkboxCallback must have a value (In this case 'newValue'), even if you don't need it. So that your code can run
            //taskData.toggleTask(index: index);//Pass the index of the task you want to toggle into the toggleTask method of taskData
            model.toggleDestinationAddressSaveCheck();
          },
        ),
        SizedBox(width: Dimensions.d10),
        const BodyText(
          text: 'Save address',
          color: app_colors.primaryBlue,
        ),
      ],
    );
  }
}

class DestinationPageSavedAddressBox extends StatelessWidget {
  const DestinationPageSavedAddressBox(
      {Key? key, required this.address, required this.textController})
      : super(key: key);
  final bool address;
  final dynamic textController;

  @override
  Widget build(BuildContext context) {
    if (!address) {
      return SizedBox(height: 0.421 * Dimensions.screenHeight);
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Saved Address',
                style: soraSubtitleText,
              ),
              ViewAllButton(
                onPressed: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) => DraggableScrollableSheet(
                      maxChildSize: 0.724,
                      initialChildSize: 0.724,
                      minChildSize: 0.5,
                      expand: false,
                      builder: (context, scrollController) =>
                          StandardBottomSheet(
                        title: 'Saved address',
                        widget: DestinationBottomSheetListView(
                          scrollController: scrollController,
                          textController: textController,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          SizedBox(height: Dimensions.d13),
          DestinationPageListView(textController: textController),
        ],
      );
    }
  }
}

class DestinationPageListView extends StatelessWidget {
  const DestinationPageListView({Key? key, required this.textController})
      : super(key: key);
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<SendAPackageViewModel>(context);
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        String address = '36, Idris Jibowu Street, Ajah , Lagos State';
        return AddressCard(
          text: address,
          onPressed: () {
            textController.value = TextEditingValue(
              text: address,
              selection: TextSelection.fromPosition(
                TextPosition(offset: address.length),
              ),
            );
            model.setDestinationAddress(destinationAddress: address);
            model.updateDestinationPageNextButton();
          },
        );
      },
      itemCount: 3,
    );
  }
}

class DestinationBottomSheetListView extends StatelessWidget {
  const DestinationBottomSheetListView(
      {Key? key, required this.scrollController, required this.textController})
      : super(key: key);
  final ScrollController scrollController;
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<SendAPackageViewModel>(context);
    return ListView.builder(
      controller: scrollController,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        String address = '36, Idris Jibowu Street, Ajah , Lagos State';
        return AddressCard(
          text: address,
          onPressed: () {
            //_pickupAddressController.text = address;
            textController.value = TextEditingValue(
              text: address,
              selection: TextSelection.fromPosition(
                TextPosition(offset: address.length),
              ),
            );
            model.setDestinationAddress(destinationAddress: address);
            model.updateDestinationPageNextButton();
            Navigator.pop(context);
          },
        );
      },
      itemCount: 12,
    );
  }
}
