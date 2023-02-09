import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pikkup/components/address_progress_line.dart';
import 'package:pikkup/components/location_ring.dart';
import 'package:pikkup/components/product_status_box.dart';
import 'package:pikkup/components/receiver_info_card.dart';
import 'package:pikkup/components/spacer.dart';
import 'package:pikkup/components/texts/plain_text.dart';
import 'package:pikkup/config/themes/app_colors.dart' as app_colors;
import 'package:pikkup/config/themes/decorations.dart';
import 'package:pikkup/config/themes/styles.dart';
import 'package:pikkup/screens/send/pickup_to_destination_route_map_screen.dart';
import 'package:pikkup/utils/dimensions.dart';
import 'package:pikkup/utils/ui_parameters.dart';
import 'package:pikkup/widgets/scaffolds/standard_scaffold.dart';

class FullHistoryCardScreen extends StatelessWidget {
  const FullHistoryCardScreen({Key? key}) : super(key: key);

  static const String id = 'full_history_card_screen';

  @override
  Widget build(BuildContext context) {
    return StandardScaffold(
      title: 'History',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const StandardSpacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              TitleValueBox(title: 'Tracking ID', value: '458748500AF'),
              ProductStatusBox(),
            ],
          ),
          const StandardSpacer(),
          const AddressBox(),
          const StandardSpacer(),
          const HistoryHeader(text: 'Product Info'),
          const ProductInfoCard(),
          const StandardSpacer(),
          const HistoryHeader(text: 'Receiver Info'),
          const ReceiverInfoCard(
              name: 'Adamu James', phoneNumber: '09061870986'),
          const StandardSpacer(),
          const DeliveryPriceCard(),
          const StandardSpacer(),
        ],
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
                children: [
                  const LocationRing(
                    locationRingType: LocationRingType.pickup,
                    locationRingSize: LocationRingSize.normal,
                  ),
                  SizedBox(height: Dimensions.d2),
                  const AddressProgressLine()
                ],
              ),
              SizedBox(width: Dimensions.d12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pickup address',
                    style: soraSmallSubtitleText.copyWith(
                      color: app_colors.textGrey,
                    ),
                  ),
                  const TitleBodySpacer(),
                  const PlainText(
                    text: '36, Idris Jibowu Street, Ajah',
                    isBlackColor: true,
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: Dimensions.d2),

          //Destination Section
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LocationRing(
                locationRingType: LocationRingType.destination,
                locationRingSize: LocationRingSize.normal,
              ),
              SizedBox(width: Dimensions.d12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Destination',
                    style: soraSmallSubtitleText.copyWith(
                      color: app_colors.textGrey,
                    ),
                  ),
                  const TitleBodySpacer(),
                  const PlainText(
                    text: '93 Ofada Rd, Mowe 110113, Loburo',
                    isBlackColor: true,
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
      padding: UIParameters.standardPadding,
      decoration: smallBorderedCardDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleValueBox(title: 'Sending?', value: 'Samsung TV'),
          SizedBox(height: Dimensions.d20 + Dimensions.d1),
          const TitleValueBox(title: 'Weight', value: '0.5 - 1kg'),
          SizedBox(height: Dimensions.d20 + Dimensions.d1),
          const TitleValueBox(title: 'Quantity', value: '2 (Two)')
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
          style: soraSmallSubtitleText.copyWith(color: app_colors.textGrey),
        ),
        const TitleBodySpacer(),
        Text(
          value,
          style: interNormalText.copyWith(fontWeight: FontWeight.w500),
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
      padding: EdgeInsets.only(bottom: Dimensions.smallPaddingSize),
      alignment: Alignment.bottomLeft,
      child: Text(
        text,
        style: soraNormalText.copyWith(fontSize: Dimensions.d14),
      ),
    );
  }
}

class DeliveryPriceCard extends StatelessWidget {
  const DeliveryPriceCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: Dimensions.smallPaddingSize,
        horizontal: Dimensions.standardPaddingSize,
      ),
      decoration: smallCardDecoration.copyWith(
          color: app_colors.primaryBlue.withOpacity(0.05)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Delivery Price',
            style: soraSmallSubtitleText.copyWith(color: app_colors.textGrey),
          ),
          const TitleBodySpacer(),
          RichText(
            text: TextSpan(
              children: [
                WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: Text(
                    '₦',
                    style: currencySmallText,
                  ),
                ),
                WidgetSpan(
                    child: SizedBox(
                        width: Dimensions.d2 + (Dimensions.d1 * 0.31))),
                WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: Text(
                    '2,300',
                    style: moneySmallText,
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
