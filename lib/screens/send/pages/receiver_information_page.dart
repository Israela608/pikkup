import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:pikkup/components/app_check_box.dart';
import 'package:pikkup/components/buttons/view_all_button.dart';
import 'package:pikkup/components/receiver_info_card.dart';
import 'package:pikkup/components/spacer.dart';
import 'package:pikkup/components/text_field_boxes/phone_number_box.dart';
import 'package:pikkup/components/text_field_boxes/text_box.dart';
import 'package:pikkup/components/texts/header_text.dart';
import 'package:pikkup/components/texts/plain_text.dart';
import 'package:pikkup/config/themes/app_colors.dart' as app_colors;
import 'package:pikkup/config/themes/styles.dart';
import 'package:pikkup/screens/send/pages/page_next_button.dart';
import 'package:pikkup/utils/dimensions.dart';
import 'package:pikkup/view_models/home_page_view_models/send_a_package_view_model.dart';
import 'package:pikkup/widgets/send_a_package_bottomsheet.dart';
import 'package:provider/provider.dart';

class ReceiverInformationPage extends StatelessWidget {
  ReceiverInformationPage({Key? key}) : super(key: key);

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<SendAPackageViewModel>(context);
    return Form(
      key: model.receiverPageFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const HeaderText(
            text: 'Receiver’s Information',
            headerTextSize: HeaderTextSize.verySmall,
          ),
          StandardSpacer(),
          NameBoxWidget(textController: _nameController),
          StandardSpacer(),
          PhoneNumberBoxWidget(textController: _phoneNumberController),
          SizedBox(height: Dimensions.d30),
          const SaveReceiverDetailsBox(),
          SizedBox(height: Dimensions.d25),
          SavedDetailsBox(
            details: true,
            nameController: _nameController,
            phoneNumberController: _phoneNumberController,
          ),
          SizedBox(height: Dimensions.d4),
          NextButton(isCompleted: model.isReceiverPageCompleted),
          SizedBox(height: Dimensions.d52),
        ],
      ),
    );
  }
}

class NameBoxWidget extends StatelessWidget {
  const NameBoxWidget({Key? key, required this.textController})
      : super(key: key);
  final dynamic textController;

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<SendAPackageViewModel>(context);
    return TextBox(
      text: 'Name',
      textController: textController,
      validatorCallback: (value) {
        return model.nameValidator(nameValue: value!);
      },
      onChangedCallback: (value) {
        //Logic
        //Do something with the user input.
        model.setName(name: value);
        //model.receiverPageFormKey.currentState!.validate();
        model.updateReceiverPageNextButton();
      },
    );
  }
}

class PhoneNumberBoxWidget extends StatelessWidget {
  const PhoneNumberBoxWidget({Key? key, required this.textController})
      : super(key: key);
  final dynamic textController;

  @override
  Widget build(BuildContext context) {
    return Consumer<SendAPackageViewModel>(
        builder: (BuildContext context, model, Widget? child) {
      return PhoneNumberBox(
        numberController: textController,
        onValidatedCallback: (bool value) {
          debugPrint(
              value.toString()); //true if input is validated, false if not
          model.phoneNumberValidator(isPhoneNumberValidated: value);
        },
        onChangedCallback: (PhoneNumber number) {
          //This phone number is the international phone number, e.g +2348148596894
          debugPrint(number.phoneNumber);
          model.setPhoneNumber(number: number);
        },
      );
    });
  }
}

class SaveReceiverDetailsBox extends StatelessWidget {
  const SaveReceiverDetailsBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<SendAPackageViewModel>(context);
    return Row(
      children: [
        AppCheckBox(
          isChecked: model.isReceiverDetailsSaveCheck,
          onChangedCallback: (newValue) {
            //Note that the checkboxCallback must have a value (In this case 'newValue'), even if you don't need it. So that your code can run
            //taskData.toggleTask(index: index);//Pass the index of the task you want to toggle into the toggleTask method of taskData
            model.toggleReceiverDetailsSaveCheck();
          },
        ),
        SizedBox(width: Dimensions.d10),
        const PlainText(
          text: 'Save details',
          isBlackColor: true,
        ),
      ],
    );
  }
}

class SavedDetailsBox extends StatelessWidget {
  const SavedDetailsBox(
      {Key? key,
      required this.details,
      required this.nameController,
      required this.phoneNumberController})
      : super(key: key);
  final bool details;
  final TextEditingController nameController;
  final TextEditingController phoneNumberController;

  @override
  Widget build(BuildContext context) {
    if (!details) {
      return SizedBox(height: 0.421 * Dimensions.screenHeight);
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Saved Details',
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
                        title: 'Saved details',
                        widget: ReceiverBottomSheetListView(
                          scrollController: scrollController,
                          nameController: nameController,
                          phoneNumberController: phoneNumberController,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          SizedBox(height: Dimensions.d13),
          ReceiverPageListView(
            nameController: nameController,
            phoneNumberController: phoneNumberController,
          ),
        ],
      );
    }
  }
}

class ReceiverPageListView extends StatelessWidget {
  const ReceiverPageListView(
      {Key? key,
      required this.nameController,
      required this.phoneNumberController})
      : super(key: key);
  final TextEditingController nameController;
  final TextEditingController phoneNumberController;

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<SendAPackageViewModel>(context);
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        String name = 'Moses';
        String phoneNumber = '09061870986';

        String textFieldPhoneNumber =
            model.textFieldPhoneNumber(phoneNumber: phoneNumber);

        return InkWell(
          onTap: () async {
            nameController.value = TextEditingValue(
              text: name,
              selection: TextSelection.fromPosition(
                TextPosition(offset: name.length),
              ),
            );
            phoneNumberController.value = TextEditingValue(
              text: textFieldPhoneNumber,
              selection: TextSelection.fromPosition(
                TextPosition(offset: textFieldPhoneNumber.length),
              ),
            );

            model.setName(name: name);

            PhoneNumber number = PhoneNumber(
              phoneNumber: phoneNumber,
              isoCode: 'NG',
            );

            model.setPhoneNumber(number: number);

            //model.setPhoneNumber(phoneNumber: phoneNumber);
            model.updateReceiverPageNextButton();
          },
          child: Container(
            margin: EdgeInsets.only(bottom: Dimensions.standardPaddingSize),
            child: ReceiverInfoCard(
              name: name,
              phoneNumber: phoneNumber,
              backgroundColor: app_colors.tileAsh,
            ),
          ),
        );
      },
      itemCount: 2,
    );
  }
}

class ReceiverBottomSheetListView extends StatelessWidget {
  const ReceiverBottomSheetListView(
      {Key? key,
      required this.scrollController,
      required this.nameController,
      required this.phoneNumberController})
      : super(key: key);
  final ScrollController scrollController;
  final TextEditingController nameController;
  final TextEditingController phoneNumberController;

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<SendAPackageViewModel>(context);
    return ListView.builder(
      controller: scrollController,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        String name = 'Moses';
        String phoneNumber = '09061870986';

        String textFieldPhoneNumber =
            model.textFieldPhoneNumber(phoneNumber: phoneNumber);

        return InkWell(
          onTap: () {
            nameController.value = TextEditingValue(
              text: name,
              selection: TextSelection.fromPosition(
                TextPosition(offset: name.length),
              ),
            );
            phoneNumberController.value = TextEditingValue(
              text: textFieldPhoneNumber,
              selection: TextSelection.fromPosition(
                TextPosition(offset: textFieldPhoneNumber.length),
              ),
            );

            model.setName(name: name);

            PhoneNumber number = PhoneNumber(
              phoneNumber: phoneNumber,
              isoCode: 'NG',
            );

            model.setPhoneNumber(number: number);
            model.updateReceiverPageNextButton();
            Navigator.pop(context);
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: Dimensions.smallPaddingSize),
            child: ReceiverInfoCard(
              name: name,
              phoneNumber: phoneNumber,
              backgroundColor: app_colors.tileAsh,
            ),
          ),
        );
      },
      itemCount: 12,
    );
  }
}
