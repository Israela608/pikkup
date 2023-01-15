import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pikkup/components/buttons/wide_button.dart';
import 'package:pikkup/components/buttons/wide_button_ash.dart';
import 'package:pikkup/components/texts/header_text_small.dart';
import 'package:pikkup/components/texts/header_text_small_white.dart';
import 'package:pikkup/screens/page_screens/home_page_screens/schedule_delivery_screen.dart';
import 'package:pikkup/screens/page_screens/home_page_screens/send_a_package_screen.dart';
import 'package:pikkup/utils/app_colors.dart' as app_colors;
import 'package:pikkup/utils/constants.dart';
import 'package:pikkup/view_models/home_page_view_models/delivery_option_view_model.dart';
import 'package:pikkup/widgets/standard_app_bar.dart';
import 'package:provider/provider.dart';

class DeliveryOptionScreen extends StatefulWidget {
  const DeliveryOptionScreen({Key? key}) : super(key: key);

  static const String id = 'delivery_option_screen';

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
    return Scaffold(
      backgroundColor: app_colors.background,
      appBar: StandardAppBar(label: 'Send a package'),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: kStandardPaddingSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 32),
              const Text(
                'Delivery option',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Sora',
                  color: app_colors.primaryBlack,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Choose the option that best fits what you need to deliver your package',
                style: TextStyle(
                  fontSize: 11,
                  fontFamily: 'Inter',
                  color: app_colors.description,
                ),
              ),
              const SizedBox(height: 21),
              const InstantDelivery(),
              const SizedBox(height: 21),
              const ScheduledDelivery(),
              SizedBox(height: 0.249 * MediaQuery.of(context).size.height),
              const NextButton(),
              const SizedBox(height: 31),
            ],
          ),
        ),
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
                        ? HeaderTextSmallWhite(text: label)
                        : HeaderTextSmall(text: label),
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
