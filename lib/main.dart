import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pikkup/screens/create_account_screen.dart';
import 'package:pikkup/screens/dialog_screen/change_password_successful_dialog_screen.dart';
import 'package:pikkup/screens/dialog_screen/open_mail_dialog_screen.dart';
import 'package:pikkup/screens/dialog_screen/reset_password_successful_dialog_screen.dart';
import 'package:pikkup/screens/forgot_password_screen.dart';
import 'package:pikkup/screens/login_screen.dart';
import 'package:pikkup/screens/onboarding_screen.dart';
import 'package:pikkup/screens/page_screens/history_page_screens/full_history_card_screen.dart';
import 'package:pikkup/screens/page_screens/home_page_screens/choose_location_on_map_screen.dart';
import 'package:pikkup/screens/page_screens/home_page_screens/delivery_option_screen.dart';
import 'package:pikkup/screens/page_screens/home_page_screens/pickup_to_destination_route_map_screen.dart';
import 'package:pikkup/screens/page_screens/home_page_screens/promo_screen.dart';
import 'package:pikkup/screens/page_screens/home_page_screens/schedule_delivery_screen.dart';
import 'package:pikkup/screens/page_screens/home_page_screens/send_a_package_screen.dart';
import 'package:pikkup/screens/page_screens/home_page_screens/summary_info_screen.dart';
import 'package:pikkup/screens/page_screens/home_page_screens/track_shipment_screen.dart';
import 'package:pikkup/screens/page_screens/home_page_screens/tracking_map_screen.dart';
import 'package:pikkup/screens/page_screens/home_page_screens/tracking_screen.dart';
import 'package:pikkup/screens/page_screens/settings_page_screens/add_a_card_to_card_list_screen.dart';
import 'package:pikkup/screens/page_screens/settings_page_screens/change_password_one_screen.dart';
import 'package:pikkup/screens/page_screens/settings_page_screens/change_password_two_screen.dart';
import 'package:pikkup/screens/page_screens/settings_page_screens/edit_profile_screen.dart';
import 'package:pikkup/screens/page_screens/settings_page_screens/log_out_screen.dart';
import 'package:pikkup/screens/page_screens/settings_page_screens/my_profile_screen.dart';
import 'package:pikkup/screens/page_screens/settings_page_screens/payment_cards_list_screen.dart';
import 'package:pikkup/screens/page_screens/settings_page_screens/receiver_details_screen.dart';
import 'package:pikkup/screens/page_screens/settings_page_screens/shipping_addresses_screen.dart';
import 'package:pikkup/screens/page_screens/wallet_page_screens/add_a_card_screen.dart';
import 'package:pikkup/screens/page_screens/wallet_page_screens/bank_transfer_screen.dart';
import 'package:pikkup/screens/page_screens/wallet_page_screens/enter_amount_screen.dart';
import 'package:pikkup/screens/page_screens/wallet_page_screens/fund_wallet_screen.dart';
import 'package:pikkup/screens/page_screens/wallet_page_screens/payment_cards_screen.dart';
import 'package:pikkup/screens/reset_password_screen.dart';
import 'package:pikkup/screens/verify_number_screen.dart';
import 'package:pikkup/screens/welcome_screen.dart';
import 'package:pikkup/utils/app_colors.dart' as app_colors;
import 'package:pikkup/view_models/create_account_view_model.dart';
import 'package:pikkup/view_models/forgot_password_view_model.dart';
import 'package:pikkup/view_models/home_page_view_models/delivery_option_view_model.dart';
import 'package:pikkup/view_models/home_page_view_models/promo_view_model.dart';
import 'package:pikkup/view_models/home_page_view_models/send_a_package_view_model.dart';
import 'package:pikkup/view_models/home_page_view_models/track_shipment_view_model.dart';
import 'package:pikkup/view_models/home_page_view_models/tracking_view_model.dart';
import 'package:pikkup/view_models/home_view_model.dart';
import 'package:pikkup/view_models/login_view_model.dart';
import 'package:pikkup/view_models/reset_password_view_model.dart';
import 'package:pikkup/view_models/settings_page_view_models/add_a_card_to_card_list_view_model.dart';
import 'package:pikkup/view_models/settings_page_view_models/change_password_one_view_model.dart';
import 'package:pikkup/view_models/settings_page_view_models/change_password_two_view_model.dart';
import 'package:pikkup/view_models/settings_page_view_models/edit_profile_view_model.dart';
import 'package:pikkup/view_models/settings_page_view_models/payment_cards_list_view_model.dart';
import 'package:pikkup/view_models/settings_page_view_models/receiver_details_view_model.dart';
import 'package:pikkup/view_models/settings_page_view_models/shipping_addresses_view_model.dart';
import 'package:pikkup/view_models/verify_number_view_model.dart';
import 'package:pikkup/view_models/wallet_page_view_models/add_a_card_view_model.dart';
import 'package:pikkup/view_models/wallet_page_view_models/enter_amount_view_model.dart';
import 'package:pikkup/view_models/wallet_page_view_models/fund_wallet_view_model.dart';
import 'package:pikkup/view_models/wallet_page_view_models/payment_cards_view_model.dart';
import 'package:provider/provider.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: app_colors.background,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: app_colors.background,
        systemNavigationBarIconBrightness: Brightness.dark));

    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
    //     statusBarIconBrightness: Brightness.dark,
    //     statusBarBrightness: Brightness.dark
    // ));
    /*SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light));*/

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ResetPasswordViewModel()),
        ChangeNotifierProvider(create: (_) => ForgotPasswordViewModel()),
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => CreateAccountViewModel()),
        ChangeNotifierProvider(create: (_) => VerifyNumberViewModel()),
        ChangeNotifierProvider(create: (_) => HomeViewModel()),

        //Home Page
        ChangeNotifierProvider(create: (_) => DeliveryOptionViewModel()),
        ChangeNotifierProvider(create: (_) => SendAPackageViewModel()),
        ChangeNotifierProvider(create: (_) => PromoViewModel()),
        ChangeNotifierProvider(create: (_) => TrackShipmentViewModel()),
        ChangeNotifierProvider(create: (_) => TrackingViewModel()),

        //Settings Page
        ChangeNotifierProvider(create: (_) => EditProfileViewModel()),
        ChangeNotifierProvider(create: (_) => ChangePasswordOneViewModel()),
        ChangeNotifierProvider(create: (_) => ChangePasswordTwoViewModel()),
        ChangeNotifierProvider(create: (_) => PaymentCardsListViewModel()),
        ChangeNotifierProvider(create: (_) => AddACardToCardListViewModel()),
        ChangeNotifierProvider(create: (_) => ShippingAddressesViewModel()),
        ChangeNotifierProvider(create: (_) => ReceiverDetailsViewModel()),

        //Wallet Page
        ChangeNotifierProvider(create: (_) => FundWalletViewModel()),
        ChangeNotifierProvider(create: (_) => PaymentCardsViewModel()),
        ChangeNotifierProvider(create: (_) => AddACardViewModel()),
        ChangeNotifierProvider(create: (_) => EnterAmountViewModel()),
      ],
      child: MaterialApp(
        title: 'Pikkup',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),

        initialRoute: HomeScreen.id,
        //initialRoute: PaymentOptionScreen.id,
        //initialRoute: PromoScreen.id,
        //initialRoute: AddACardScreen.id,
        //initialRoute: EnterAmountScreen.id,
        //initialRoute: OnboardingScreen.id,
        //initialRoute: ResetPasswordScreen.id,
        //initialRoute: PaymentCardsScreen.id,
        //Because the id variable of WelcomeScreen is static, we can use it without creating an object of the screen, i.e WelcomeScreen().id, thereby making our code more efficient.

        routes: {
          OnboardingScreen.id: (context) => OnboardingScreen(),
          WelcomeScreen.id: (context) => const WelcomeScreen(),
          LoginScreen.id: (context) => const LoginScreen(),
          ResetPasswordScreen.id: (context) => const ResetPasswordScreen(),
          ResetPasswordSuccessfulDialogScreen.id: (context) =>
              const ResetPasswordSuccessfulDialogScreen(),
          ForgotPasswordScreen.id: (context) => const ForgotPasswordScreen(),
          OpenMailDialogScreen.id: (context) => const OpenMailDialogScreen(),
          CreateAccountScreen.id: (context) => const CreateAccountScreen(),
          VerifyNumberScreen.id: (context) => const VerifyNumberScreen(),
          HomeScreen.id: (context) => HomeScreen(),

          //Home Page
          DeliveryOptionScreen.id: (context) => const DeliveryOptionScreen(),
          ScheduleDeliveryScreen.id: (context) =>
              const ScheduleDeliveryScreen(),
          SendAPackageScreen.id: (context) => const SendAPackageScreen(),
          ChooseLocationOnMapScreen.id: (context) =>
              ChooseLocationOnMapScreen(),
          SummaryInfoScreen.id: (context) => const SummaryInfoScreen(),
          PickupToDestinationRouteMapScreen.id: (context) =>
              PickupToDestinationRouteMapScreen(),
          TrackShipmentScreen.id: (context) => const TrackShipmentScreen(),
          TrackingScreen.id: (context) => const TrackingScreen(),
          TrackingMapScreen.id: (context) => const TrackingMapScreen(),
          PromoScreen.id: (context) => const PromoScreen(),

          //History Page
          FullHistoryCardScreen.id: (context) => const FullHistoryCardScreen(),

          //Wallet Page
          FundWalletScreen.id: (context) => const FundWalletScreen(),
          BankTransferScreen.id: (context) => const BankTransferScreen(),
          PaymentCardsScreen.id: (context) => const PaymentCardsScreen(),
          AddACardScreen.id: (context) => const AddACardScreen(),
          EnterAmountScreen.id: (context) => EnterAmountScreen(),

          //Settings Page
          MyProfileScreen.id: (context) => MyProfileScreen(),
          EditProfileScreen.id: (context) => EditProfileScreen(),
          LogOutScreen.id: (context) => const LogOutScreen(),
          ChangePasswordOneScreen.id: (context) =>
              const ChangePasswordOneScreen(),
          ChangePasswordTwoScreen.id: (context) =>
              const ChangePasswordTwoScreen(),
          ChangePasswordSuccessfulDialogScreen.id: (context) =>
              const ChangePasswordSuccessfulDialogScreen(),
          PaymentCardsListScreen.id: (context) =>
              const PaymentCardsListScreen(),
          AddACardToCardListScreen.id: (context) =>
              const AddACardToCardListScreen(),
          ShippingAddressesScreen.id: (context) => ShippingAddressesScreen(),
          ReceiverDetailsScreen.id: (context) => const ReceiverDetailsScreen(),
        },
      ),
    );
  }
}
