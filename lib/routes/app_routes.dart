import 'package:flutter/widgets.dart';
import 'package:pikkup/screens/auth/change_password_one_screen.dart';
import 'package:pikkup/screens/auth/change_password_two_screen.dart';
import 'package:pikkup/screens/auth/create_account_screen.dart';
import 'package:pikkup/screens/auth/forgot_password_screen.dart';
import 'package:pikkup/screens/auth/log_out_screen.dart';
import 'package:pikkup/screens/auth/login_screen.dart';
import 'package:pikkup/screens/auth/reset_password_screen.dart';
import 'package:pikkup/screens/auth/verify_number_screen.dart';
import 'package:pikkup/screens/auth/welcome_screen.dart';
import 'package:pikkup/screens/dialog/change_password_successful_dialog_screen.dart';
import 'package:pikkup/screens/dialog/open_mail_dialog_screen.dart';
import 'package:pikkup/screens/dialog/reset_password_successful_dialog_screen.dart';
import 'package:pikkup/screens/funding/add_a_card_screen.dart';
import 'package:pikkup/screens/funding/bank_transfer_screen.dart';
import 'package:pikkup/screens/funding/enter_amount_screen.dart';
import 'package:pikkup/screens/funding/fund_wallet_screen.dart';
import 'package:pikkup/screens/funding/payment_cards_screen.dart';
import 'package:pikkup/screens/history/full_history_card_screen.dart';
import 'package:pikkup/screens/home/home_screen.dart';
import 'package:pikkup/screens/onboarding_screen.dart';
import 'package:pikkup/screens/profile/edit_profile_screen.dart';
import 'package:pikkup/screens/profile/my_profile_screen.dart';
import 'package:pikkup/screens/promos/promo_screen.dart';
import 'package:pikkup/screens/saved/add_a_card_to_card_list_screen.dart';
import 'package:pikkup/screens/saved/payment_cards_list_screen.dart';
import 'package:pikkup/screens/saved/receiver_details_screen.dart';
import 'package:pikkup/screens/saved/shipping_addresses_screen.dart';
import 'package:pikkup/screens/send/choose_location_on_map_screen.dart';
import 'package:pikkup/screens/send/delivery_option_screen.dart';
import 'package:pikkup/screens/send/pickup_to_destination_route_map_screen.dart';
import 'package:pikkup/screens/send/schedule_delivery_screen.dart';
import 'package:pikkup/screens/send/send_a_package_screen.dart';
import 'package:pikkup/screens/send/summary_info_screen.dart';
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
        HomeScreen.id: (context) => const HomeScreen(),

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
