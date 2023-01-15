import 'package:flutter/material.dart';
import 'package:pikkup/components/address_card.dart';
import 'package:pikkup/components/app_check_box.dart';
import 'package:pikkup/components/buttons/view_all_button.dart';
import 'package:pikkup/components/text_field_boxes/destination_address_box.dart';
import 'package:pikkup/components/texts/description_text_blue.dart';
import 'package:pikkup/components/texts/header_text_very_small.dart';
import 'package:pikkup/screens/page_screens/home_page_screens/schedule_delivery_pages_and_widgets/page_next_button.dart';
import 'package:pikkup/utils/app_colors.dart' as app_colors;
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
    return SingleChildScrollView(
      child: Form(
        key: model.destinationPageFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const HeaderTextVerySmall(text: 'Address Information'),
            const SizedBox(height: 32),
            DestinationAddressBoxWidget(
                textController: _destinationAddressController),
            const SizedBox(height: 24),
            const SaveDestinationAddressBox(),
            const SizedBox(height: 48),
            DestinationPageSavedAddressBox(
              address: true,
              textController: _destinationAddressController,
            ),
            const SizedBox(height: 69),
            NextButton(isCompleted: model.isDestinationPageCompleted),
            const SizedBox(height: 52),
          ],
        ),
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
        const SizedBox(width: 10),
        const DescriptionTextBlue(text: 'Save address')
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
      return SizedBox(height: 0.421 * MediaQuery.of(context).size.height);
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Saved Address',
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Sora',
                  color: app_colors.primaryBlack,
                ),
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
          const SizedBox(height: 13),
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
