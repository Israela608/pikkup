import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pikkup/components/buttons/wide_button.dart';
import 'package:pikkup/components/buttons/wide_button_ash.dart';
import 'package:pikkup/components/spacer.dart';
import 'package:pikkup/components/texts/body_text.dart';
import 'package:pikkup/components/texts/header_text.dart';
import 'package:pikkup/config/themes/app_colors.dart' as app_colors;
import 'package:pikkup/utils/dimensions.dart';
import 'package:pikkup/view_models/home_page_view_models/delivery_option_view_model.dart';
import 'package:pikkup/widgets/scaffolds/standard_scaffold.dart';
import 'package:provider/provider.dart';

class ScheduleDeliveryScreen extends StatelessWidget {
  const ScheduleDeliveryScreen({Key? key}) : super(key: key);

  static const String id = '/schedule_delivery_screen';

  @override
  Widget build(BuildContext context) {
    return StandardScaffold(
      title: 'Schedule delivery',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          StandardSpacer(),
          BodyText(
              text:
                  'Choose the specific date and time your package will be picked up for delivery.'),
          SizedBox(height: Dimensions.d20 + Dimensions.d9),

          SizedBox(height: 32),

          SizedBox(height: 82),

          //SizedBox(height: 0.249 * MediaQuery.of(context).size.height),

          SizedBox(height: 31),
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
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          padding:
              const EdgeInsets.only(left: 16, right: 37, top: 34, bottom: 34),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.transparent,
            border: Border.all(
                width: 1, color: app_colors.primaryBlue.withOpacity(0.15)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                height: 32,
                width: 32,
                image: AssetImage('images/$image'),
                color: isSelected ? app_colors.white : app_colors.primaryBlack,
              ),
              const SizedBox(width: 16),
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
                    const SizedBox(height: 8),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 9,
                        fontFamily: 'Inter',
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
              //model.selectedDeliveryType == DeliveryType.instant ? Navigator.pushNamed(context, HomeScreen.id) : Navigator.pushNamed(context, HomeScreen.id);
            },
          );
  }
}
