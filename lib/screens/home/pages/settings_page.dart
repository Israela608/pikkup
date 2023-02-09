import 'package:flutter/material.dart';
import 'package:pikkup/components/texts/body_text.dart';
import 'package:pikkup/config/themes/app_colors.dart' as app_colors;
import 'package:pikkup/config/themes/styles.dart';
import 'package:pikkup/screens/auth/change_password_one_screen.dart';
import 'package:pikkup/screens/auth/log_out_screen.dart';
import 'package:pikkup/screens/profile/my_profile_screen.dart';
import 'package:pikkup/screens/saved/payment_cards_list_screen.dart';
import 'package:pikkup/screens/saved/receiver_details_screen.dart';
import 'package:pikkup/screens/saved/shipping_addresses_screen.dart';
import 'package:pikkup/utils/dimensions.dart';
import 'package:pikkup/utils/ui_parameters.dart';
import 'package:pikkup/widgets/scaffolds/standard_scaffold.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StandardScaffold(
      title: 'Settings',
      isBackButtonPresent: false,
      isPaddingPresent: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SettingsHeader(text: 'Account settings'),
          SettingsTile(
            icon: 'profile.png',
            text: 'My Profile',
            onPressed: () => Navigator.pushNamed(context, MyProfileScreen.id),
          ),
          SettingsTile(
            icon: 'lock.png',
            text: 'Change Password',
            onPressed: () =>
                Navigator.pushNamed(context, ChangePasswordOneScreen.id),
          ),
          const SettingsHeader(text: 'Saved items'),
          SettingsTile(
            icon: 'card.png',
            text: 'Payment Cards',
            onPressed: () =>
                Navigator.pushNamed(context, PaymentCardsListScreen.id),
          ),
          SettingsTile(
            icon: 'location.png',
            text: 'Shipping Addresses',
            onPressed: () =>
                Navigator.pushNamed(context, ShippingAddressesScreen.id),
          ),
          SettingsTile(
            icon: 'details.png',
            text: 'Receiver\'s details',
            onPressed: () =>
                Navigator.pushNamed(context, ReceiverDetailsScreen.id),
          ),
          const SettingsHeader(text: 'Support'),
          SettingsTile(
              icon: 'notification.png',
              text: 'Notifications',
              onPressed: () {}),
          SettingsTile(
            icon: 'log_out.png',
            text: 'Log out',
            onPressed: () => Navigator.pushNamed(context, LogOutScreen.id),
          ),
          SettingsTile(icon: 'help.png', text: 'Help', onPressed: () {}),
        ],
      ),
    );
  }
}

class SettingsHeader extends StatelessWidget {
  const SettingsHeader({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: Dimensions.d50 + Dimensions.d1,
      padding: EdgeInsets.only(
          left: Dimensions.standardPaddingSize,
          bottom: Dimensions.smallPaddingSize),
      alignment: Alignment.bottomLeft,
      child: Text(
        text,
        style: interNormalText.copyWith(fontWeight: FontWeight.w500),
      ),
    );
  }
}

class SettingsTile extends StatelessWidget {
  const SettingsTile(
      {Key? key,
      required this.icon,
      required this.text,
      required this.onPressed})
      : super(key: key);
  final String icon;
  final String text;
  final dynamic onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: app_colors.tileBlue,
      child: InkWell(
        onTap: onPressed,
        //splashColor: Colors.blue,
        child: Container(
          color: Colors.transparent,
          height: Dimensions.d56,
          padding: UIParameters.screenHorizontalPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ImageIcon(AssetImage('images/$icon')),
                  SizedBox(width: Dimensions.standardPaddingSize),
                  BodyText(text: text)
                ],
              ),
              const ImageIcon(AssetImage('images/forward.png')),
            ],
          ),
        ),
      ),
    );
  }
}
