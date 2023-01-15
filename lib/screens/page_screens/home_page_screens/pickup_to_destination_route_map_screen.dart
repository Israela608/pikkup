import 'package:flutter/material.dart';
import 'package:pikkup/components/address_progress_line_green_small.dart';
import 'package:pikkup/components/buttons/back_circular.dart';
import 'package:pikkup/components/destination_ring_small.dart';
import 'package:pikkup/components/pickup_ring_small.dart';
import 'package:pikkup/components/pin.dart';
import 'package:pikkup/utils/app_colors.dart' as app_colors;
import 'package:sliding_up_panel/sliding_up_panel.dart';

class PickupToDestinationRouteMapScreen extends StatelessWidget {
  PickupToDestinationRouteMapScreen({Key? key}) : super(key: key);

  static const String id = 'pickup_to_destination_route_map_screen';

  final panelController = PanelController();

  @override
  Widget build(BuildContext context) {
    double _panelHeightOpen = 284;
    double _panelHeightClosed = 284;

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
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0)),
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
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          SizedBox(height: 24),
          Text(
            'Locations',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              fontFamily: 'Sora',
              color: app_colors.primaryBlack,
            ),
          ),
          SizedBox(height: 23),
          AddressBox(),
          SizedBox(height: 8),
          DistanceBox(),
          SizedBox(height: 19),
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

class AddressBox extends StatelessWidget {
  const AddressBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 17),
      decoration: BoxDecoration(
        color: app_colors.cardBlue,
        border: Border.all(
            width: 1, color: app_colors.primaryBlue.withOpacity(0.15)),
      ),
      child: Column(
        children: [
          //Pickup Address Section
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: const [
                  PickupRingSmall(),
                  SizedBox(height: 2),
                  AddressProgressLineGreenSmall()
                ],
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Pickup address',
                      style: TextStyle(
                        fontSize: 8,
                        fontFamily: 'Sora',
                        color: app_colors.textGrey,
                      ),
                    ),
                    SizedBox(height: 6.79),
                    Text(
                      '36, Idris Jibowu Street, Ajah, Lagos State',
                      style: TextStyle(
                        fontSize: 10,
                        fontFamily: 'Inter',
                        color: app_colors.primaryBlack,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 2),

          //Destination Section
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DestinationRingSmall(),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Destination',
                      style: TextStyle(
                        fontSize: 8,
                        fontFamily: 'Sora',
                        color: app_colors.textGrey,
                      ),
                    ),
                    SizedBox(height: 6.79),
                    Text(
                      '93 Ofada Rd, Mowe 110113, Loburo',
                      style: TextStyle(
                        fontSize: 10,
                        fontFamily: 'Inter',
                        color: app_colors.primaryBlack,
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
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: app_colors.cardBlue,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Distance',
            style: TextStyle(
              fontSize: 10,
              fontFamily: 'Sora',
              color: app_colors.textGrey,
            ),
          ),
          SizedBox(height: 8),
          Text(
            '69km',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              fontFamily: 'Sora',
              color: app_colors.primaryBlack,
            ),
          ),
        ],
      ),
    );
  }
}
