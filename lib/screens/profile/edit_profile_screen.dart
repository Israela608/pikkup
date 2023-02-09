import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:pikkup/components/buttons/wide_button.dart';
import 'package:pikkup/components/text_field_boxes/email_box.dart';
import 'package:pikkup/components/text_field_boxes/phone_number_box.dart';
import 'package:pikkup/components/text_field_boxes/text_box.dart';
import 'package:pikkup/config/themes/app_colors.dart' as app_colors;
import 'package:pikkup/config/themes/styles.dart';
import 'package:pikkup/screens/profile/my_profile_screen.dart';
import 'package:pikkup/utils/dimensions.dart';
import 'package:pikkup/utils/ui_parameters.dart';
import 'package:pikkup/view_models/settings_page_view_models/edit_profile_view_model.dart';
import 'package:pikkup/widgets/scaffolds/standard_scaffold.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({Key? key}) : super(key: key);

  static const String id = '/edit_profile_screen';

  //TextController to read text entered in text field
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String initialCountry = 'NG';
  PhoneNumber number = PhoneNumber(isoCode: 'NG'); //Initial Country code

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<EditProfileViewModel>(context);
    return StandardScaffold(
      title: 'Edit Profile',
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: Dimensions.d32),
            const ProfileImage(),
            SizedBox(height: Dimensions.d60 + Dimensions.d2),
            TextBox(
              text: 'Name',
              textController: _nameController,
              validatorCallback: (value) {
                return model.nameValidator(nameValue: value!);
              },
              onChangedCallback: (value) {
                //Logic
                //Do something with the user input.
                model.setName(name: value);
              },
            ),
            SizedBox(height: Dimensions.standardSpacing),
            EmailBox(
              emailController: _emailController,
              validatorCallback: (value) {
                return model.emailValidator(emailValue: value!);
              },
              onChangedCallback: (value) {
                //Logic
                //Do something with the user input.
                model.setEmail(email: value);
              },
            ),
            SizedBox(height: Dimensions.standardSpacing),
            PhoneNumberBox(
              numberController: _phoneNumberController,
              onValidatedCallback: (bool value) {
                debugPrint(value
                    .toString()); //true if input is validated, false if not
              },
              onChangedCallback: (PhoneNumber number) {
                debugPrint(number.phoneNumber);
                model.setPhoneNumber(
                    phoneNumber: number.phoneNumber
                        .toString()); //number.phoneNumber converts number to a nullable String. toString converts it to a normal String
              },
            ),
            SizedBox(height: Dimensions.d10),
            errorMessage(errorMessage: model.errorMessage),
            SizedBox(height: Dimensions.d70),
            WideButton(
              label: 'Save changes',
              onPressedCallback: () {
                if (_formKey.currentState!.validate()) {
                  debugPrint("Successful");
                  model.addErrorMessage();

                  //Now upload the data to database
                  Navigator.pushNamed(context, MyProfileScreen.id);

                  return;
                } else {
                  debugPrint("Unsuccessful");
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Container errorMessage({String? errorMessage}) {
    if (errorMessage == null) {
      return Container();
    } else {
      return Container(
        margin: EdgeInsets.symmetric(vertical: Dimensions.d10),
        padding: UIParameters.standardPadding,
        alignment: Alignment.center,
        child: Text(
          errorMessage.toString(), //Convert String? to String
          style: soraSubtitleText.copyWith(color: app_colors.white),
          //textAlign: TextAlign.center,
        ),
        decoration: BoxDecoration(
          color: app_colors.error,
          borderRadius: BorderRadius.circular(Dimensions.d5),
        ),
      );
    }
  }
}

class ProfileImage extends StatelessWidget {
  const ProfileImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          //Make the Profile picture fullscreen
        },
        child: Container(
          height: Dimensions.d120 + Dimensions.d2,
          width: Dimensions.d120 + Dimensions.d2,
          //width: MediaQuery.of(context).size.width * 0.313,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                image: AssetImage('images/mami.png'), fit: BoxFit.contain),
          ),
          child: Container(
            margin:
                EdgeInsets.only(right: Dimensions.d5, bottom: Dimensions.d5),
            alignment: Alignment.bottomRight,
            child: InkWell(
                splashColor: app_colors.iconAsh,
                onTap: () {
                  //Change the Profile picture
                },
                child: Image.asset(
                  'images/camera.png',
                  height: Dimensions.d32,
                  width: Dimensions.d32,
                )),
          ),
        ),
      ),
    );
  }
}
