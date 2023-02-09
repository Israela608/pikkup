import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pikkup/components/spacer.dart';
import 'package:pikkup/components/texts/header_text.dart';
import 'package:pikkup/components/texts/plain_text.dart';
import 'package:pikkup/config/themes/app_colors.dart' as app_colors;
import 'package:pikkup/config/themes/decorations.dart';
import 'package:pikkup/config/themes/styles.dart';
import 'package:pikkup/screens/home/home_screen.dart';
import 'package:pikkup/utils/dimensions.dart';
import 'package:pikkup/utils/ui_parameters.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

late double _driverProfilePadding;

class DispatcherPanel extends StatefulWidget {
  const DispatcherPanel({Key? key, required this.body}) : super(key: key);

  final Widget body;
  // final String driverName;
  // final String driverImage;
  // final String driverRating;
  // final String deliveryState;
  // final String deliveryStateContent;

  @override
  State<DispatcherPanel> createState() => _DispatcherPanelState();
}

class _DispatcherPanelState extends State<DispatcherPanel> {
  final panelController = PanelController();

  @override
  void initState() {
    _driverProfilePadding = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //double _panelHeightOpen = 236;
    //double _panelHeightClosed = 91;
    double _panelHeightOpen = Dimensions.d300 + Dimensions.d40 + Dimensions.d2;
    double _panelHeightClosed = Dimensions.d120 + Dimensions.d3;

    return SlidingUpPanel(
      controller: panelController,
      maxHeight: _panelHeightOpen,
      //maxHeight: _panelHeightClosed,
      minHeight: _panelHeightClosed,
      parallaxEnabled: true,
      parallaxOffset: 0.5,

      body: widget.body,
      panel: PanelWidget(panelController: panelController),
      borderRadius: UIParameters.bottomSheetBorderRadius,
      onPanelSlide: (double pos) => setState(() {
        _driverProfilePadding = pos * 16;
      }),
    );
  }
}

class PanelWidget extends StatelessWidget {
  const PanelWidget({Key? key, required this.panelController})
      : super(key: key);
  final PanelController panelController;

  void togglePanel() => panelController.isPanelOpen
      ? panelController.close()
      : panelController.open();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DragHandle(onPressed: () => togglePanel()),
        //const SizedBox(height: 32),
        Container(
          padding: EdgeInsets.symmetric(horizontal: _driverProfilePadding),
          //padding: EdgeInsets.symmetric(horizontal: 16),
          child: const DriverDetails(
            image: 'images/dispatcher_demo_image.png',
            driverName: 'Jacob Jones',
            rating: 4.5,
          ),
        ),
        Container(
          //padding: EdgeInsets.symmetric(horizontal: _driverProfilePadding),
          padding: UIParameters.screenHorizontalPadding,
          child: Column(
            children: [
              SizedBox(height: Dimensions.d36),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const DeliveryStatus(),
                  CallDispatcherButton(onPressed: () {}),
                ],
              ),
              //const SizedBox(height: 26),
              SizedBox(height: Dimensions.d52),
              const GotoHomeButton(),
              SizedBox(height: Dimensions.d5),
            ],
          ),
        ),
      ],
    );
  }
}

class DragHandle extends StatelessWidget {
  const DragHandle({Key? key, required this.onPressed}) : super(key: key);
  final dynamic onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: Dimensions.bigSpacing,
        width: double.infinity,
        padding: EdgeInsets.only(top: Dimensions.d12, bottom: Dimensions.d15),
        child: FittedBox(
          child: Container(
            width: Dimensions.d30,
            height: Dimensions.d5,
            decoration: BoxDecoration(
                color: Colors.grey[300],
                //color: app_colors.buttonAsh,
                borderRadius: BorderRadius.circular(Dimensions.d12)),
          ),
        ),
      ),
    );
  }
}

class DriverDetails extends StatelessWidget {
  const DriverDetails(
      {Key? key,
      required this.image,
      required this.driverName,
      required this.rating})
      : super(key: key);
  final String image;
  final String driverName;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: UIParameters.screenHorizontalPadding,
      decoration: cardDecoration.copyWith(color: app_colors.primaryWhite),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              driverImageWidget(),
              SizedBox(
                width: Dimensions.standardSpacing,
              ),
              driverNameWidget(),
            ],
          ),
          ratingWidget(),
        ],
      ),
    );
  }

  Container driverImageWidget() {
    return Container(
      height: Dimensions.d58,
      width: Dimensions.d58,
      margin: EdgeInsets.symmetric(vertical: Dimensions.standardPaddingSize),
      decoration: BoxDecoration(
        color: Colors.transparent,
        shape: BoxShape.circle,
        border: Border.all(
            color: app_colors.primaryYellow, width: Dimensions.d1 * 0.83),
      ),
      child: Container(
        margin: EdgeInsets.all(Dimensions.d9 + Dimensions.d1 * 0.1),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.fill),
        ),
      ),
    );
  }

  Container driverNameWidget() {
    return Container(
      padding:
          EdgeInsets.symmetric(vertical: Dimensions.d23 + Dimensions.d1 * 0.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Dispatcher',
            style: interSmallText.copyWith(
              color: app_colors.textAsh,
            ),
          ),
          const TitleBodySpacer(),
          HeaderText(
            text: driverName,
            headerTextSize: HeaderTextSize.verySmall,
          )
        ],
      ),
    );
  }

  Container ratingWidget() {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: Dimensions.d20 + Dimensions.d2 + Dimensions.d1 * 0.8),
      child: Column(
        children: [
          RatingBarIndicator(
            rating: rating,
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: app_colors.star,
            ),
            itemCount: 5,
            itemSize: Dimensions.d16 + Dimensions.d1 * 0.4,
            unratedColor: app_colors.star.withAlpha(50),
            direction: Axis.horizontal,
          ),
          TitleBodySpacer(),
          Text('$rating/5', style: soraSubtitleText),
        ],
      ),
    );
  }
}

class DeliveryStatus extends StatelessWidget {
  const DeliveryStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ImageIcon(
          AssetImage('images/alarm_clock.png'),
          size: Dimensions.standardSpacing,
        ),
        SizedBox(width: Dimensions.d20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PlainText(text: 'Delivering in', isBlackColor: true),
            SizedBox(height: Dimensions.d4),
            HeaderText(
              text: '30 mins',
              headerTextSize: HeaderTextSize.verySmall,
            ),
          ],
        ),
      ],
    );
  }
}

class CallDispatcherButton extends StatelessWidget {
  const CallDispatcherButton({Key? key, required this.onPressed})
      : super(key: key);
  final dynamic onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: app_colors.primaryBlue,
        shape: RoundedRectangleBorder(
            borderRadius: UIParameters.smallBorderRadius),
        minimumSize: Size.zero,
        elevation: 0,
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.d12 + Dimensions.d1 * 0.5,
          vertical: Dimensions.smallPaddingSize,
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.call,
            size: Dimensions.standardSpacing,
            color: Colors.white,
          ),
          SizedBox(width: Dimensions.smallPaddingSize),
          Text(
            'Call Dispatcher',
            style: soraButtonText.copyWith(fontSize: Dimensions.smallTextSize),
          ),
        ],
      ),
    );
  }
}

class GotoHomeButton extends StatelessWidget {
  const GotoHomeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      child: Text(
        'Go to Home',
        style: soraButtonText.copyWith(color: app_colors.primaryBlue),
      ),
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
            borderRadius: UIParameters.smallBorderRadius),
        side: BorderSide(color: app_colors.primaryBlue, width: Dimensions.d1),
        padding: EdgeInsets.symmetric(
          vertical: Dimensions.d14,
          horizontal: Dimensions.d70 + Dimensions.d3 + Dimensions.d1 * 0.5,
        ),
      ),
      onPressed: () {
        Navigator.pushNamed(context, HomeScreen.id);
      },
    );
  }
}
