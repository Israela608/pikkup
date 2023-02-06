import 'package:flutter/widgets.dart';
import 'package:pikkup/screens/auth/create_account_screen.dart';
import 'package:pikkup/screens/auth/forgot_password_screen.dart';
import 'package:pikkup/screens/auth/login_screen.dart';
import 'package:pikkup/screens/auth/reset_password_screen.dart';
import 'package:pikkup/screens/auth/verify_number_screen.dart';
import 'package:pikkup/screens/auth/welcome_screen.dart';
import 'package:pikkup/screens/dialog/change_password_successful_dialog_screen.dart';
import 'package:pikkup/screens/dialog/open_mail_dialog_screen.dart';
import 'package:pikkup/screens/dialog/reset_password_successful_dialog_screen.dart';
import 'package:pikkup/screens/home/home_screen.dart';
import 'package:pikkup/screens/onboarding_screen.dart';
import 'package:pikkup/screens/page_screens/history_page_screens/full_history_card_screen.dart';
import 'package:pikkup/screens/page_screens/home_page_screens/choose_location_on_map_screen.dart';
import 'package:pikkup/screens/page_screens/home_page_screens/delivery_option_screen.dart';
import 'package:pikkup/screens/page_screens/home_page_screens/pickup_to_destination_route_map_screen.dart';
import 'package:pikkup/screens/page_screens/home_page_screens/promo_screen.dart';
import 'package:pikkup/screens/page_screens/home_page_screens/schedule_delivery_screen.dart';
import 'package:pikkup/screens/page_screens/home_page_screens/send_a_package_screen.dart';
import 'package:pikkup/screens/page_screens/home_page_screens/summary_info_screen.dart';
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
import 'package:pikkup/screens/tracking/track_shipment_screen.dart';
import 'package:pikkup/screens/tracking/tracking_map_screen.dart';
import 'package:pikkup/screens/tracking/tracking_screen.dart';

class AppRoutes {
  // static const String onboarding = OnboardingScreen.id;
  // static const String welcome = WelcomeScreen.id;
  // static const String login = LoginScreen.id;

  static Map<String, WidgetBuilder> routes(BuildContext context) => {
        OnboardingScreen.id: (context) => const OnboardingScreen(),
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
        ScheduleDeliveryScreen.id: (context) => const ScheduleDeliveryScreen(),
        SendAPackageScreen.id: (context) => const SendAPackageScreen(),
        ChooseLocationOnMapScreen.id: (context) => ChooseLocationOnMapScreen(),
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
        PaymentCardsListScreen.id: (context) => const PaymentCardsListScreen(),
        AddACardToCardListScreen.id: (context) =>
            const AddACardToCardListScreen(),
        ShippingAddressesScreen.id: (context) => ShippingAddressesScreen(),
        ReceiverDetailsScreen.id: (context) => const ReceiverDetailsScreen(),
      };
}
