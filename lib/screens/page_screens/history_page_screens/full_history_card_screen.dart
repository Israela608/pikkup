import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pikkup/components/address_progress_line.dart';
import 'package:pikkup/components/location_ring.dart';
import 'package:pikkup/components/product_status_box.dart';
import 'package:pikkup/components/receiver_info_card.dart';
import 'package:pikkup/config/themes/app_colors.dart' as app_colors;
import 'package:pikkup/config/themes/decorations.dart';
import 'package:pikkup/screens/page_screens/home_page_screens/pickup_to_destination_route_map_screen.dart';
import 'package:pikkup/widgets/standard_app_bar.dart';

class FullHistoryCardScreen extends StatelessWidget {
  const FullHistoryCardScreen({Key? key}) : super(key: key);

  static const String id = 'full_history_card_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: app_colors.background,
      appBar: StandardAppBar(label: 'History'),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: kStandardPaddingSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  TitleValueBox(title: 'Tracking ID', value: '458748500AF'),
                  ProductStatusBox(),
                ],
              ),
              const SizedBox(height: 24),
              const AddressBox(),
              const SizedBox(height: 24),
              const HistoryHeader(text: 'Product Info'),
              const ProductInfoCard(),
              const SizedBox(height: 24),
              const HistoryHeader(text: 'Receiver Info'),
              const ReceiverInfoCard(
                  name: 'Adamu James', phoneNumber: '09061870986'),
              const SizedBox(height: 24),
              const DeliveryPriceCard(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class AddressBox extends StatelessWidget {
  const AddressBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, PickupToDestinationRouteMapScreen.id);
      },
      child: Column(
        children: [
          //Pickup Address Section
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: const [
                  LocationRing(
                    locationRingType: LocationRingType.pickup,
                    locationRingSize: LocationRingSize.normal,
                  ),
                  SizedBox(height: 2),
                  AddressProgressLine()
                ],
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Pickup address',
                    style: TextStyle(
                      fontSize: 10,
                      fontFamily: 'Sora',
                      color: app_colors.textGrey,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '36, Idris Jibowu Street, Ajah',
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'Inter',
                      color: app_colors.primaryBlack,
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 2),

          //Destination Section
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LocationRing(
                locationRingType: LocationRingType.destination,
                locationRingSize: LocationRingSize.normal,
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Destination',
                    style: TextStyle(
                      fontSize: 10,
                      fontFamily: 'Sora',
                      color: app_colors.textGrey,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '93 Ofada Rd, Mowe 110113, Loburo',
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'Inter',
                      color: app_colors.primaryBlack,
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

class ProductInfoCard extends StatelessWidget {
  const ProductInfoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: app_colors.tileBlue,
        border: Border.all(
            width: 1, color: app_colors.primaryBlue.withOpacity(0.15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          TitleValueBox(title: 'Sending?', value: 'Samsung TV'),
          SizedBox(height: 21),
          TitleValueBox(title: 'Weight', value: '0.5 - 1kg'),
          SizedBox(height: 21),
          TitleValueBox(title: 'Quantity', value: '2 (Two)')
        ],
      ),
    );
  }
}

class TitleValueBox extends StatelessWidget {
  const TitleValueBox({Key? key, required this.title, required this.value})
      : super(key: key);
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 10,
            fontFamily: 'Sora',
            color: app_colors.textGrey,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            fontSize: 13,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
            color: app_colors.primaryBlack,
          ),
        ),
      ],
    );
  }
}

class HistoryHeader extends StatelessWidget {
  const HistoryHeader({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.only(bottom: 8),
      alignment: Alignment.bottomLeft,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.bold,
          fontFamily: 'Sora',
          color: app_colors.primaryBlack,
        ),
      ),
    );
  }
}

class DeliveryPriceCard extends StatelessWidget {
  const DeliveryPriceCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: app_colors.primaryBlue.withOpacity(0.05),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Delivery Price',
            style: TextStyle(
              fontSize: 10,
              fontFamily: 'Sora',
              color: app_colors.textGrey,
            ),
          ),
          const SizedBox(height: 8),
          RichText(
            text: const TextSpan(
              children: [
                WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: Text(
                    '₦',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      //fontFamily: 'Inter',
                      color: app_colors.primaryBlue,
                    ),
                  ),
                ),
                WidgetSpan(child: SizedBox(width: 2.31)),
                WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: Text(
                    '2,300',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Sora',
                      color: app_colors.primaryBlue,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
