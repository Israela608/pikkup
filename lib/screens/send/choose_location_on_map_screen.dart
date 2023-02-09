import 'package:flutter/material.dart';
import 'package:pikkup/components/buttons/back_circular.dart';
import 'package:pikkup/components/buttons/wide_button.dart';
import 'package:pikkup/components/location_ring.dart';
import 'package:pikkup/components/pin.dart';
import 'package:pikkup/components/spacer.dart';
import 'package:pikkup/config/themes/app_colors.dart' as app_colors;
import 'package:pikkup/config/themes/decorations.dart';
import 'package:pikkup/config/themes/styles.dart';
import 'package:pikkup/utils/dimensions.dart';
import 'package:pikkup/utils/ui_parameters.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ChooseLocationOnMapScreen extends StatelessWidget {
  ChooseLocationOnMapScreen({Key? key}) : super(key: key);

  static const String id = '/choose_location_on_map_screen';

  final panelController = PanelController();

  @override
  Widget build(BuildContext context) {
    double _panelHeightOpen = Dimensions.d200 + Dimensions.d75;
    double _panelHeightClosed = Dimensions.d200 + Dimensions.d75;

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
          SizedBox(height: Dimensions.d30 + Dimensions.d7),
          Text(
            'Destination',
            style: soraNormalText.copyWith(fontSize: Dimensions.d14),
          ),
          const StandardSpacer(),
          const AddressTextBox(),
          SizedBox(height: Dimensions.d48),
          WideButton(label: 'Confirm Location', onPressedCallback: () {})
          //const SizedBox(height: 19),
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

class AddressTextBox extends StatelessWidget {
  const AddressTextBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //controller: addressController,
      keyboardType: TextInputType.text,
      //validator: validatorCallback,
      validator: (value) {
        //return model.destinationAddressValidator(destinationAddress: value!);
      },
      cursorColor: app_colors.primaryBlack,
      style: const TextStyle(color: app_colors.primaryBlack),
      //onChanged: onChangedCallback,
      onChanged: (value) {
        // //Logic
        // //Do something with the user input.
        // model.setDestinationAddress(destinationAddress: value);
        // //model.destinationPageFormKey.currentState!.validate();
        // model.updateDestinationPageNextButton();
      },
      decoration: textFieldDecoration.copyWith(
        prefixIcon: const FittedBox(
          fit: BoxFit.none,
          child: LocationRing(
            locationRingType: LocationRingType.destination,
            locationRingSize: LocationRingSize.big,
          ),
        ),
      ),
      // .copyWith(
      //     hintText:
      //     'Enter your email'), //We use copyWith to overwrite the text in the hintText:
    );
  }
}
