import 'package:flutter/material.dart';
import 'package:pikkup/components/buttons/wide_button.dart';
import 'package:pikkup/components/buttons/wide_button_ash.dart';
import 'package:pikkup/components/spacer.dart';
import 'package:pikkup/components/texts/header_text.dart';
import 'package:pikkup/config/themes/app_colors.dart' as app_colors;
import 'package:pikkup/config/themes/decorations.dart';
import 'package:pikkup/config/themes/styles.dart';
import 'package:pikkup/screens/send/schedule_delivery_screen.dart';
import 'package:pikkup/screens/send/send_a_package_screen.dart';
import 'package:pikkup/utils/dimensions.dart';
import 'package:pikkup/utils/ui_parameters.dart';
import 'package:pikkup/view_models/home_page_view_models/delivery_option_view_model.dart';
import 'package:pikkup/widgets/scaffolds/standard_scaffold.dart';
import 'package:provider/provider.dart';

class DeliveryOptionScreen extends StatefulWidget {
  const DeliveryOptionScreen({Key? key}) : super(key: key);

  static const String id = '/delivery_option_screen';

  @override
  State<DeliveryOptionScreen> createState() => _DeliveryOptionScreenState();
}

class _DeliveryOptionScreenState extends State<DeliveryOptionScreen> {
  @override
  void initState() {
    Provider.of<DeliveryOptionViewModel>(context, listen: false)
        .setDeliveryTypeAsNull();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StandardScaffold(
      title: 'Send a package',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const BigSpacer(),
          Text(
            'Delivery option',
            style: soraSubtitleText.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: Dimensions.smallPaddingSize),
          Text(
            'Choose the option that best fits what you need to deliver your package',
            style: interNormalText.copyWith(
              fontSize: Dimensions.d14,
              color: app_colors.description,
            ),
          ),
          SizedBox(height: Dimensions.d20 + Dimensions.d1),
          const InstantDelivery(),
          SizedBox(height: Dimensions.d20 + Dimensions.d1),
          const ScheduledDelivery(),
          SizedBox(height: 0.249 * Dimensions.screenHeight),
          const NextButton(),
          SizedBox(height: Dimensions.d30 + Dimensions.d1),
        ],
      ),
    );
  }
}

class InstantDelivery extends StatelessWidget {
  const InstantDelivery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<DeliveryOptionViewModel>(context);
    return DeliveryCard(
      onPressed: () {
        model.setDeliveryTypeAsInstant();
      },
      image: 'clock.png',
      isSelected:
          model.selectedDeliveryType == DeliveryType.instant ? true : false,
      label: 'Instant delivery',
      description:
          'Your order will be processed, and your parcel will be picked up shortly after payment',
    );
  }
}

class ScheduledDelivery extends StatelessWidget {
  const ScheduledDelivery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<DeliveryOptionViewModel>(context);
    return DeliveryCard(
      onPressed: () {
        model.setDeliveryTypeAsScheduled();
      },
      image: 'calendar.png',
      isSelected:
          model.selectedDeliveryType == DeliveryType.scheduled ? true : false,
      label: 'Schedule delivery',
      description:
          'Set the time period your parcel will be picked up for delivery',
    );
  }
}

class DeliveryCard extends StatelessWidget {
  const DeliveryCard(
      {Key? key,
      required this.onPressed,
      required this.image,
      required this.isSelected,
      required this.label,
      required this.description})
      : super(key: key);
  final dynamic onPressed;
  final String image;
  final bool isSelected;
  final String label;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isSelected ? app_colors.primaryBlue : app_colors.primaryWhite,
      borderRadius: UIParameters.standardBorderRadius,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          padding: EdgeInsets.only(
            left: Dimensions.standardPaddingSize,
            right: Dimensions.d30 + Dimensions.d7,
            top: Dimensions.d30 + Dimensions.d4,
            bottom: Dimensions.d30 + Dimensions.d4,
          ),
          decoration:
              borderedCardDecoration.copyWith(color: Colors.transparent),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                height: Dimensions.bigSpacing,
                width: Dimensions.bigSpacing,
                image: AssetImage('images/$image'),
                color: isSelected ? app_colors.white : app_colors.primaryBlack,
              ),
              SizedBox(width: Dimensions.standardPaddingSize),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    isSelected
                        ? HeaderText(
                            text: label,
                            headerTextSize: HeaderTextSize.small,
                            color: app_colors.white,
                          )
                        : HeaderText(
                            text: label,
                            headerTextSize: HeaderTextSize.small,
                          ),
                    SizedBox(height: Dimensions.smallPaddingSize),
                    Text(
                      description,
                      style: interSmallText.copyWith(
                        color: isSelected
                            ? app_colors.white
                            : app_colors.primaryBlack,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NextButton extends StatelessWidget {
  const NextButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<DeliveryOptionViewModel>(context);
    return model.selectedDeliveryType == null
        ? const WideButtonAsh(label: 'Next')
        : WideButton(
            label: 'Next',
            onPressedCallback: () {
              model.selectedDeliveryType == DeliveryType.instant
                  ? Navigator.pushNamed(context, SendAPackageScreen.id)
                  : Navigator.pushNamed(context, ScheduleDeliveryScreen.id);
              //model.selectedDeliveryType == DeliveryType.scheduled ? Navigator.pushNamed(context, ScheduleDeliveryScreen.id) : null;
              model.setDeliveryTypeAsNull();
              model.notifyListeners();
            },
          );
  }
}
