import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pikkup/components/texts/body_text.dart';
import 'package:pikkup/components/texts/header_text.dart';
import 'package:pikkup/config/themes/app_colors.dart' as app_colors;
import 'package:pikkup/screens/page_screens/home_page_screens/delivery_option_screen.dart';
import 'package:pikkup/screens/page_screens/home_page_screens/promo_screen.dart';
import 'package:pikkup/screens/page_screens/wallet_page_screens/fund_wallet_screen.dart';
import 'package:pikkup/screens/tracking/track_shipment_screen.dart';
import 'package:pikkup/utils/ui_parameters.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: UIParameters.screenHorizontalPadding,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            SizedBox(height: 70),
            NameCard(),
            SizedBox(height: 24),
            SendPackageCard(),
            SizedBox(height: 24),
            Others(),
            SizedBox(height: 24),
          ],
        ),
      ),
    ));
  }
}

class NameCard extends StatelessWidget {
  const NameCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: app_colors.background,
            boxShadow: [
              BoxShadow(
                blurRadius: 2,
                offset: const Offset(0, 0),
                color: Colors.grey.withOpacity(0.6),
              )
            ]),
        child: Container(
            height: 87,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                HeaderText(
                  text: 'Hi Moses 🖐',
                  headerTextSize: HeaderTextSize.small,
                ),
                BodyText(text: 'What would you like to do today?'),
              ],
            )),
      ),
    );
  }
}

class SendPackageCard extends StatelessWidget {
  const SendPackageCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: app_colors.primaryBlue,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, DeliveryOptionScreen.id);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.transparent,
            image: const DecorationImage(
              image: AssetImage('images/send_a_package_vector.png'),
              alignment: Alignment.topCenter,
            ),
          ),
          child: Container(
              height: 172,
              padding: const EdgeInsets.symmetric(vertical: 27, horizontal: 19),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'images/delivery_bus.png',
                    width: 55,
                  ),
                  const HeaderText(
                    text: 'Send a package',
                    color: app_colors.white,
                  ),
                  const BodyText(
                    text:
                        'Deliver desired parcels to destination of your choice',
                    isSmall: true,
                    color: app_colors.white,
                  ),
                ],
              )),
        ),
      ),
    );
  }
}

class Others extends StatelessWidget {
  const Others({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StaggeredGrid.count(
      crossAxisCount: 2,
      mainAxisSpacing: 24,
      crossAxisSpacing: 24,
      children: [
        //StaggeredGridTile.count() - If you want the child to have equal height and width
        //StaggeredGridTile.fit() - If you want the child to fit it's own height
        //StaggeredGridTile.extent() - If you want to set custom height for the child
        StaggeredGridTile.fit(
          crossAxisCellCount: 1,
          child: OthersCard(
            icon: 'track_location.png',
            label: 'Track delivery',
            description: 'Know where your deliveries are at any point in time',
            onPressed: () {
              Navigator.pushNamed(context, TrackShipmentScreen.id);
            },
          ),
        ),
        StaggeredGridTile.fit(
          crossAxisCellCount: 1,
          child: OthersCard(
            icon: 'wallet_card.png',
            label: 'Fund wallet',
            description: 'Fund your wallet directly from your bank account',
            onPressed: () {
              Navigator.pushNamed(context, FundWalletScreen.id);
            },
          ),
        ),
        StaggeredGridTile.fit(
          crossAxisCellCount: 1,
          child: OthersCard(
            icon: 'discount.png',
            label: 'Promos & Special offers',
            description: 'Check out special offers just for you',
            onPressed: () {
              Navigator.pushNamed(context, PromoScreen.id);
            },
          ),
        ),
      ],
    );
  }
}

class OthersCard extends StatelessWidget {
  const OthersCard(
      {Key? key,
      required this.icon,
      required this.label,
      required this.description,
      required this.onPressed})
      : super(key: key);
  final String icon;
  final String label;
  final String description;
  final dynamic onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      //We need container because of it's BoxShadow property
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(8), boxShadow: [
        BoxShadow(
          blurRadius: 3,
          offset: const Offset(0, 0),
          color: Colors.grey.withOpacity(0.4),
        )
      ]),
      child: Material(
        //We need Material because it brings out the ripple effect in InkWell
        color: app_colors.background,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          onTap: onPressed,
          child: Container(
              height: 193,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'images/$icon',
                    width: 24,
                  ),
                  const SizedBox(height: 16),
                  HeaderText(
                    text: label,
                    headerTextSize: HeaderTextSize.small,
                    color: app_colors.primaryBlue,
                  ),
                  const SizedBox(height: 8),
                  BodyText(text: description, isSmall: true),
                ],
              )),
        ),
      ),
    );
  }
}
