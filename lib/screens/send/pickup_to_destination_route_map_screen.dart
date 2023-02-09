import 'package:flutter/material.dart';
import 'package:pikkup/components/address_progress_line.dart';
import 'package:pikkup/components/buttons/back_circular.dart';
import 'package:pikkup/components/location_ring.dart';
import 'package:pikkup/components/pin.dart';
import 'package:pikkup/components/spacer.dart';
import 'package:pikkup/config/themes/app_colors.dart' as app_colors;
import 'package:pikkup/config/themes/decorations.dart';
import 'package:pikkup/config/themes/styles.dart';
import 'package:pikkup/utils/dimensions.dart';
import 'package:pikkup/utils/ui_parameters.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class PickupToDestinationRouteMapScreen extends StatelessWidget {
  PickupToDestinationRouteMapScreen({Key? key}) : super(key: key);

  static const String id = '/pickup_to_destination_route_map_screen';

  final panelController = PanelController();

  @override
  Widget build(BuildContext context) {
    double _panelHeightOpen = Dimensions.d200 + Dimensions.d84;
    double _panelHeightClosed = Dimensions.d200 + Dimensions.d84;

    return Scaffold(
      backgroundColor: app_colors.background,
      body: Stack(
        children: [
          SlidingUpPanel(
            controller: panelController,
            maxHeight: _panelHeightOpen,
            minHeight: _panelHeightClosed,
            parallaxEnabled: true,
            parallaxOffset: 0.5,
            body: const MapWidget(),
            panel: PanelWidget(panelController: panelController),
            color: app_colors.background,
            borderRadius: UIParameters.bottomSheetBorderRadius,
            //onPanelSlide: (double pos) => setState(() {}),
          ),
          // const DispatcherPanel(
          //   body: MapWidget(),
          // ),
          BackCircular(
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Pin(
            onPressed: () {
              debugPrint('My Location');
            },
          ),
        ],
      ),
    );
  }
}

class MapWidget extends StatelessWidget {
  const MapWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: app_colors.primaryYellow,
            ),
            child: const Center(
              child: Text(
                'Map View',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PanelWidget extends StatelessWidget {
  const PanelWidget({Key? key, required this.panelController})
      : super(key: key);
  final PanelController panelController;

  // void togglePanel() => panelController.isPanelOpen
  //     ? panelController.close()
  //     : panelController.open();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: UIParameters.screenHorizontalPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const StandardSpacer(),
          Text(
            'Locations',
            style: soraNormalText.copyWith(fontSize: Dimensions.d14),
          ),
          SizedBox(height: Dimensions.d23),
          const AddressBox(),
          SizedBox(height: Dimensions.smallPaddingSize),
          const DistanceBox(),
          SizedBox(height: Dimensions.d10 + Dimensions.d9),
        ],
      ),
    );

    // return Column(
    //   children: [
    //     DragHandle(onPressed: () => togglePanel()),
    //     //const SizedBox(height: 32),
    //     Container(
    //       padding: EdgeInsets.symmetric(horizontal: _driverProfilePadding),
    //       //padding: EdgeInsets.symmetric(horizontal: 16),
    //       child: const DriverDetails(
    //         image: 'images/dispatcher_demo_image.png',
    //         driverName: 'Jacob Jones',
    //         rating: 4.5,
    //       ),
    //     ),
    //     Container(
    //       //padding: EdgeInsets.symmetric(horizontal: _driverProfilePadding),
    //       padding: const EdgeInsets.symmetric(horizontal: 16),
    //       child: Column(
    //         children: [
    //           const SizedBox(height: 36),
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               const DeliveryStatus(),
    //               CallDispatcherButton(onPressed: () {}),
    //             ],
    //           ),
    //           //const SizedBox(height: 26),
    //           const SizedBox(height: 52),
    //           const GotoHomeButton(),
    //           const SizedBox(height: 5),
    //         ],
    //       ),
    //     ),
    //   ],
    // );
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

class AddressBox extends StatelessWidget {
  const AddressBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.d27, vertical: Dimensions.d10 + Dimensions.d7),
      decoration: borderedCardDecoration.copyWith(
        color: app_colors.cardBlue,
        borderRadius: BorderRadius.circular(0),
      ),
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
                    locationRingSize: LocationRingSize.small,
                  ),
                  SizedBox(height: Dimensions.d2),
                  const AddressProgressLine(isSmall: true, isCompleted: true)
                ],
              ),
              SizedBox(width: Dimensions.d10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pickup address',
                      style: soraSmallSubtitleText.copyWith(
                          fontSize: Dimensions.d10 + Dimensions.d1 * 0.19,
                          color: app_colors.textGrey),
                    ),
                    SizedBox(height: Dimensions.d6 + Dimensions.d1 * 0.79),
                    Text(
                      '36, Idris Jibowu Street, Ajah, Lagos State',
                      style: interNormalText.copyWith(
                        fontSize: Dimensions.d13 + Dimensions.d1 * 0.59,
                      ),
                    ),
                  ],
                ),
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
                locationRingSize: LocationRingSize.small,
              ),
              SizedBox(width: Dimensions.d10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Destination',
                      style: soraSmallSubtitleText.copyWith(
                          fontSize: Dimensions.d10 + Dimensions.d1 * 0.19,
                          color: app_colors.textGrey),
                    ),
                    SizedBox(height: Dimensions.d6 + Dimensions.d1 * 0.79),
                    Text(
                      '93 Ofada Rd, Mowe 110113, Loburo',
                      style: interNormalText.copyWith(
                        fontSize: Dimensions.d13 + Dimensions.d1 * 0.59,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class DistanceBox extends StatelessWidget {
  const DistanceBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.standardPaddingSize,
        vertical: Dimensions.smallPaddingSize,
      ),
      decoration: BoxDecoration(
        color: app_colors.cardBlue,
        borderRadius: UIParameters.smallBorderRadius,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Distance',
            style: soraSmallSubtitleText.copyWith(color: app_colors.textGrey),
          ),
          SizedBox(height: Dimensions.smallPaddingSize),
          Text(
            '69km',
            style: soraSubtitleText.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
