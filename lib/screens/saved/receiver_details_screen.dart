import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:pikkup/components/buttons/wide_button.dart';
import 'package:pikkup/components/buttons/wide_button_ash.dart';
import 'package:pikkup/components/receiver_info_card.dart';
import 'package:pikkup/components/text_field_boxes/phone_number_box.dart';
import 'package:pikkup/components/text_field_boxes/text_box.dart';
import 'package:pikkup/config/themes/app_colors.dart' as app_colors;
import 'package:pikkup/view_models/settings_page_view_models/receiver_details_view_model.dart';
import 'package:pikkup/widgets/scaffolds/standard_scaffold.dart';
import 'package:pikkup/widgets/send_a_package_bottomsheet.dart';
import 'package:provider/provider.dart';

class ReceiverDetailsScreen extends StatefulWidget {
  const ReceiverDetailsScreen({Key? key}) : super(key: key);

  static const String id = 'receiver_details_screen';

  @override
  State<ReceiverDetailsScreen> createState() => _ReceiverDetailsScreenState();
}

class _ReceiverDetailsScreenState extends State<ReceiverDetailsScreen> {
  final ScrollController scrollController = ScrollController();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();

    //Provider.of<ReceiverDetailsViewModel>(context, listen: false).initialize();
  }

  @override
  Widget build(BuildContext context) {
    return StandardScaffold(
      title: "Receiver's details",
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 24),
          Consumer<ReceiverDetailsViewModel>(
            builder: (BuildContext context, model, Widget? child) {
              return ListView.builder(
                controller: scrollController,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      model.initialize(index: index);

                      _nameController.value = TextEditingValue(
                        text: model.name,
                        selection: TextSelection.fromPosition(
                          TextPosition(offset: model.name.length),
                        ),
                      );

                      _phoneNumberController.value = TextEditingValue(
                        text: model.textFieldPhoneNumber,
                        selection: TextSelection.fromPosition(
                          TextPosition(
                              offset: model.textFieldPhoneNumber.length),
                        ),
                      );

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
                            title: 'Edit details',
                            widget: Form(
                              key: model.formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  const SizedBox(height: 24),
                                  NameBoxWidget(
                                      textController: _nameController),
                                  const SizedBox(height: 24),
                                  PhoneNumberBoxWidget(
                                      textController: _phoneNumberController),
                                  const SizedBox(height: 116),
                                  const SaveChangesButton(),
                                  const SizedBox(height: 32),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: ReceiverInfoCard(
                        name: model.receiverDetails[index].name,
                        phoneNumber: model.receiverDetails[index].phoneNumber,
                        backgroundColor: app_colors.tileAsh,
                      ),
                    ),
                  );
                },
                itemCount: model.receiverDetailsCount,
              );
            },
          ),
          const SizedBox(height: 32),
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
    final model = Provider.of<ReceiverDetailsViewModel>(context);
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
        model.formKey.currentState!.validate(); // Use autoValidate instead
        model.updateSaveChangesButton();
      },
    );
  }
}

class PhoneNumberBoxWidget extends StatelessWidget {
  const PhoneNumberBoxWidget({Key? key, required this.textController})
      : super(key: key);
  final dynamic textController;

  //String initialCountry = 'NG';
  //PhoneNumber number = PhoneNumber(isoCode: 'NG'); //Initial Country code

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ReceiverDetailsViewModel>(context);
    return PhoneNumberBox(
      numberController: textController,
      onValidatedCallback: (bool value) {
        debugPrint(value.toString()); //true if input is validated, false if not
      },
      onChangedCallback: (PhoneNumber number) {
        model.setPhoneNumber(number: number);
        model.updateSaveChangesButton();
      },
    );
  }
}

class SaveChangesButton extends StatelessWidget {
  const SaveChangesButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ReceiverDetailsViewModel>(context);
    return !model.isCompleted
        ? const WideButtonAsh(label: 'Save changes')
        : WideButton(
            label: 'Save changes',
            onPressedCallback: () {
              model.replaceDetail();
              Navigator.pop(context);
            },
          );
  }
}
