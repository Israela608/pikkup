import 'package:flutter/material.dart';
import 'package:pikkup/components/texts/description_text.dart';
import 'package:pikkup/components/texts/header_text_small.dart';
import 'package:pikkup/screens/page_screens/settings_page_screens/change_password_one_screen.dart';
import 'package:pikkup/screens/page_screens/settings_page_screens/log_out_screen.dart';
import 'package:pikkup/screens/page_screens/settings_page_screens/my_profile_screen.dart';
import 'package:pikkup/screens/page_screens/settings_page_screens/payment_cards_list_screen.dart';
import 'package:pikkup/screens/page_screens/settings_page_screens/receiver_details_screen.dart';
import 'package:pikkup/screens/page_screens/settings_page_screens/shipping_addresses_screen.dart';
import 'package:pikkup/utils/app_colors.dart' as app_colors;

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: app_colors.background,
      appBar: AppBar(
        title: const HeaderTextSmall(text: 'Settings'),
        centerTitle: true,
        toolbarHeight: 68,
        backgroundColor: app_colors.background,
        elevation: 2,
      ),
      body: SingleChildScrollView(
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
      height: 51,
      padding: const EdgeInsets.only(left: 16, bottom: 8),
      alignment: Alignment.bottomLeft,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          fontFamily: 'Inter',
          color: app_colors.primaryBlack,
        ),
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
          height: 56,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ImageIcon(AssetImage('images/$icon')),
                  const SizedBox(width: 16),
                  DescriptionText(text: text)
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
