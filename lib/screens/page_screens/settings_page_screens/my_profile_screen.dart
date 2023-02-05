import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pikkup/components/texts/body_text.dart';
import 'package:pikkup/components/texts/plain_text.dart';
import 'package:pikkup/config/themes/app_colors.dart' as app_colors;
import 'package:pikkup/screens/page_screens/settings_page_screens/edit_profile_screen.dart';
import 'package:pikkup/widgets/standard_app_bar.dart';

File? imageFile;

class MyProfileScreen extends StatelessWidget {
  MyProfileScreen({Key? key}) : super(key: key);

  static const String id = 'my_profile_screen';

  @override
  Widget build(BuildContext context) {
    //final model = Provider.of<ForgotPasswordViewModel>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: app_colors.background,
        appBar: StandardAppBar(
          label: 'My Profile',
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          //we reduced 8 from the left padding, because all the components of the Column below have left padding of 8
          child: SingleChildScrollView(
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: const [
                SizedBox(height: 32),
                ProfileImage(),
                SizedBox(height: 32),
                ProfileName(),
                SizedBox(height: 48),
                EditProfileButton(),
                SizedBox(height: 16),
                DetailsBox(),
                SizedBox(height: 32),
              ],
            ),
          ),
        ),
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
          height: 150,
          width: 150,
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
            margin: const EdgeInsets.only(right: 5, bottom: 5),
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
                  height: 38,
                  width: 38,
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
    return const Text(
      'Moses John',
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        fontFamily: 'Sora',
        color: app_colors.primaryBlack,
      ),
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
          primary: app_colors.primaryBlue,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)),
          minimumSize: Size.zero,
          //tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        ),
        child: const Text(
          'Edit profile',
          style: TextStyle(
            fontSize: 11,
            fontFamily: 'Inter',
            color: Colors.white,
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
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            blurRadius: 3,
            offset: const Offset(0, 0),
            color: Colors.grey.withOpacity(0.4),
          )
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 53, horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          DetailsTile(title: 'Name', value: 'Moses Johnson'),
          SizedBox(height: 24),
          DetailsTile(title: 'Email', value: 'mosesjhnson123@gmail.com'),
          SizedBox(height: 24),
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
        const SizedBox(height: 8),
        PlainText(text: value, isBlackColor: true, isBold: true),
      ],
    );
  }
}
