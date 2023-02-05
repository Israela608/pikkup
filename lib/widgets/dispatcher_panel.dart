import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pikkup/components/texts/header_text.dart';
import 'package:pikkup/components/texts/plain_text.dart';
import 'package:pikkup/config/themes/app_colors.dart' as app_colors;
import 'package:pikkup/screens/home_screen.dart';
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
    double _panelHeightOpen = 342;
    double _panelHeightClosed = 123;

    return SlidingUpPanel(
      controller: panelController,
      maxHeight: _panelHeightOpen,
      //maxHeight: _panelHeightClosed,
      minHeight: _panelHeightClosed,
      parallaxEnabled: true,
      parallaxOffset: 0.5,

      body: widget.body,
      panel: PanelWidget(panelController: panelController),
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0)),
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
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 36),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const DeliveryStatus(),
                  CallDispatcherButton(onPressed: () {}),
                ],
              ),
              //const SizedBox(height: 26),
              const SizedBox(height: 52),
              const GotoHomeButton(),
              const SizedBox(height: 5),
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
        height: 32,
        width: double.infinity,
        padding: const EdgeInsets.only(top: 12, bottom: 15),
        child: FittedBox(
          child: Container(
            width: 30,
            height: 5,
            decoration: BoxDecoration(
                color: Colors.grey[300],
                //color: app_colors.buttonAsh,
                borderRadius: const BorderRadius.all(Radius.circular(12.0))),
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
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        //color: Colors.transparent,
        color: app_colors.primaryWhite,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              driverImageWidget(),
              const SizedBox(width: 24),
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
      height: 58,
      width: 58,
      margin: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.transparent,
        shape: BoxShape.circle,
        border: Border.all(color: app_colors.primaryYellow, width: 0.83),
      ),
      child: Container(
        margin: const EdgeInsets.all(9.1),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.fill),
        ),
      ),
    );
  }

  Container driverNameWidget() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 23.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Dispatcher',
            style: TextStyle(
              fontSize: 10,
              fontFamily: 'Inter',
              color: app_colors.textAsh,
            ),
          ),
          const SizedBox(height: 8),
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
      padding: const EdgeInsets.symmetric(vertical: 22.8),
      child: Column(
        children: [
          RatingBarIndicator(
            rating: rating,
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: app_colors.star,
            ),
            itemCount: 5,
            itemSize: 16.4,
            unratedColor: app_colors.star.withAlpha(50),
            direction: Axis.horizontal,
          ),
          const SizedBox(height: 8),
          Text(
            '$rating/5',
            style: const TextStyle(
              fontSize: 12,
              fontFamily: 'Sora',
              color: app_colors.primaryBlack,
            ),
          ),
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
        const ImageIcon(
          AssetImage('images/alarm_clock.png'),
          size: 24,
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            PlainText(text: 'Delivering in', isBlackColor: true),
            SizedBox(height: 4),
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
        primary: app_colors.primaryBlue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        minimumSize: Size.zero,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 12.5, vertical: 8),
      ),
      child: Row(
        children: const [
          Icon(
            Icons.call,
            size: 24,
            color: Colors.white,
          ),
          SizedBox(width: 8),
          Text(
            'Call Dispatcher',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              fontFamily: 'Sora',
              color: Colors.white,
            ),
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
      child: const Text(
        'Go to Home',
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          fontFamily: 'Sora',
          color: app_colors.primaryBlue,
        ),
      ),
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        side: const BorderSide(color: app_colors.primaryBlue, width: 1),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 73.5),
      ),
      onPressed: () {
        Navigator.pushNamed(context, HomeScreen.id);
      },
    );
  }
}
