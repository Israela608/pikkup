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
import 'package:provider/single_child_widget.dart';

class Providers {
  static List<SingleChildWidget> getProviders() => [
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
      ];
}
