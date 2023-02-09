import 'package:flutter/material.dart';
import 'package:pikkup/components/address_progress_line.dart';
import 'package:pikkup/components/buttons/wide_button.dart';
import 'package:pikkup/components/location_ring.dart';
import 'package:pikkup/components/receiver_info_card.dart';
import 'package:pikkup/components/spacer.dart';
import 'package:pikkup/components/texts/header_text.dart';
import 'package:pikkup/components/texts/plain_text.dart';
import 'package:pikkup/config/themes/app_colors.dart' as app_colors;
import 'package:pikkup/config/themes/decorations.dart';
import 'package:pikkup/config/themes/styles.dart';
import 'package:pikkup/screens/send/pickup_to_destination_route_map_screen.dart';
import 'package:pikkup/utils/dimensions.dart';
import 'package:pikkup/utils/ui_parameters.dart';
import 'package:pikkup/widgets/scaffolds/standard_scaffold.dart';

class SummaryInfoScreen extends StatelessWidget {
  const SummaryInfoScreen({Key? key}) : super(key: key);

  static const String id = '/summary_info_screen';

  @override
  Widget build(BuildContext context) {
    return StandardScaffold(
      title: 'Send a package',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const BigSpacer(),
          const HeaderText(
            text: 'Summary Information',
            headerTextSize: HeaderTextSize.verySmall,
          ),
          SizedBox(height: Dimensions.smallPaddingSize),
          const DeliveryTypeCard(),
          const StandardSpacer(),
          const AddressBox(),
          const BigSpacer(),
          const DeliveryPriceCard(),
          const BigSpacer(),
          const HistoryHeader(text: 'Product Info'),
          const ProductInfoCard(),
          const StandardSpacer(),
          const HistoryHeader(text: 'Receiver Info'),
          const ReceiverInfoCard(
              name: 'Adamu James', phoneNumber: '09061870986'),
          SizedBox(height: Dimensions.d48),
          WideButton(
            label: 'Proceed to payment',
            onPressedCallback: () {
              //Do stuffs
              //Navigator.pushNamed(context, PaymentOptionScreen.id);
            },
          ),
          SizedBox(height: Dimensions.d40 + Dimensions.d3),
        ],
      ),
    );
  }
}

class DeliveryTypeCard extends StatelessWidget {
  const DeliveryTypeCard({Key? key}) : super(key: key);
  final String deliveryType = 'Instant';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: Dimensions.d10 + Dimensions.d1 * 0.5,
        horizontal: Dimensions.standardPaddingSize,
      ),
      decoration: smallCardDecoration.copyWith(
        color: app_colors.primaryBlue.withOpacity(0.05),
      ),
      child: deliveryType == 'Instant'
          ? const DeliveryTypeText(text: 'Instant delivery')
          : const ScheduledDeliveryText(),
    );
  }
}

class DeliveryTypeText extends StatelessWidget {
  const DeliveryTypeText({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: soraSubtitleText.copyWith(
        fontSize: Dimensions.d14,
        color: app_colors.primaryBlue,
      ),
    );
  }
}

class ScheduledDeliveryText extends StatelessWidget {
  const ScheduledDeliveryText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          const WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: DeliveryTypeText(text: 'Scheduled delivery by '),
          ),
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: Text(
              '4 :30pm',
              style:
                  soraSubtitleBoldText.copyWith(color: app_colors.primaryBlue),
            ),
          ),
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
                  const AddressProgressLine(isCompleted: true)
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
                  SizedBox(height: Dimensions.smallPaddingSize),
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

// class ReceiverInfoCard extends StatelessWidget {
//   const ReceiverInfoCard({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(4),
//         color: app_colors.tileBlue,
//         border: Border.all(
//             width: 1, color: app_colors.primaryBlue.withOpacity(0.15)),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: const [
//           Text(
//             'Adamu James',
//             style: TextStyle(
//               fontSize: 13,
//               fontFamily: 'Inter',
//               fontWeight: FontWeight.w600,
//               color: app_colors.primaryBlack,
//             ),
//           ),
//           SizedBox(height: 8),
//           Text(
//             '09061870986',
//             style: TextStyle(
//               fontSize: 10,
//               fontFamily: 'Inter',
//               color: app_colors.primaryBlack,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

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
