import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pikkup/components/spacer.dart';
import 'package:pikkup/components/texts/body_text.dart';
import 'package:pikkup/config/themes/app_colors.dart' as app_colors;
import 'package:pikkup/config/themes/styles.dart';
import 'package:pikkup/screens/profile/edit_profile_screen.dart';
import 'package:pikkup/utils/dimensions.dart';
import 'package:pikkup/utils/ui_parameters.dart';
import 'package:pikkup/widgets/scaffolds/standard_scaffold.dart';

File? imageFile;

class MyProfileScreen extends StatelessWidget {
  MyProfileScreen({Key? key}) : super(key: key);

  static const String id = '/my_profile_screen';

  @override
  Widget build(BuildContext context) {
    //final model = Provider.of<ForgotPasswordViewModel>(context);
    return StandardScaffold(
      title: 'My Profile',
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: Dimensions.d32),
          const ProfileImage(),
          SizedBox(height: Dimensions.d32),
          const ProfileName(),
          SizedBox(height: Dimensions.d48),
          const EditProfileButton(),
          SizedBox(height: Dimensions.standardPaddingSize),
          const DetailsBox(),
          SizedBox(height: Dimensions.d32),
        ],
      ),
    );
  }
}

class ProfileImage extends StatefulWidget {
  const ProfileImage({Key? key}) : super(key: key);

  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          //Make the Profile picture fullscreen
        },
        child: Container(
          height: Dimensions.d150,
          width: Dimensions.d150,
          //width: MediaQuery.of(context).size.width * 0.313,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              //image: AssetImage('images/mami.png'),
              image: imageFile != null
                  ? FileImage(imageFile!)
                  : const AssetImage('images/mami.png') as ImageProvider,
              fit: BoxFit.contain,
            ),
          ),
          child: Container(
            margin:
                EdgeInsets.only(right: Dimensions.d5, bottom: Dimensions.d5),
            alignment: Alignment.bottomRight,
            child: InkWell(
                splashColor: app_colors.iconAsh,
                onTap: () async {
                  //Change the Profile picture
                  //
                  // chooseImage() async {
                  //   final getImage = await ImagePicker().pickImage(
                  //     source: ImageSource.gallery,
                  //   );
                  // }

                  final getImage = await ImagePicker().pickImage(
                    source: ImageSource.gallery,
                  );

                  setState(() {
                    if (getImage != null) {
                      imageFile = File(getImage.path);
                    }
                  });
                },
                child: Image.asset(
                  'images/camera.png',
                  height: Dimensions.d30 + Dimensions.d8,
                  width: Dimensions.d30 + Dimensions.d8,
                )),
          ),
        ),
      ),
    );
  }
}

class ProfileName extends StatelessWidget {
  const ProfileName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Moses John',
      style: soraSubtitleText.copyWith(fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    );
  }
}

class EditProfileButton extends StatelessWidget {
  const EditProfileButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, EditProfileScreen.id);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: app_colors.primaryBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimensions.d26),
          ),
          minimumSize: Size.zero,
          //tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          padding: EdgeInsets.symmetric(
            vertical: Dimensions.smallPaddingSize,
            horizontal: Dimensions.standardPaddingSize,
          ),
        ),
        child: Text(
          'Edit profile',
          style: interNormalText.copyWith(
            fontSize: Dimensions.d14,
            color: app_colors.white,
          ),
        ),
      ),
    );
  }
}

class DetailsBox extends StatelessWidget {
  const DetailsBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: app_colors.tileBlue,
        borderRadius: UIParameters.standardBorderRadius,
        boxShadow: [
          BoxShadow(
            blurRadius: Dimensions.d3,
            offset: const Offset(0, 0),
            color: Colors.grey.withOpacity(0.4),
          )
        ],
      ),
      padding: EdgeInsets.symmetric(
          vertical: Dimensions.d50 + Dimensions.d3,
          horizontal: Dimensions.standardSpacing),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          DetailsTile(title: 'Name', value: 'Moses Johnson'),
          StandardSpacer(),
          DetailsTile(title: 'Email', value: 'mosesjhnson123@gmail.com'),
          StandardSpacer(),
          DetailsTile(title: 'Phone number', value: '+234 79950 85960'),
        ],
      ),
    );
  }
}

class DetailsTile extends StatelessWidget {
  const DetailsTile({Key? key, required this.title, required this.value})
      : super(key: key);
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BodyText(text: title, isSmall: true),
        SizedBox(height: Dimensions.smallPaddingSize),
        Text(
          value,
          style: interNormalText.copyWith(fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
