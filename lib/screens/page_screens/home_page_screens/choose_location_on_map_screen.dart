import 'package:flutter/material.dart';
import 'package:pikkup/components/buttons/back_circular.dart';
import 'package:pikkup/components/buttons/wide_button.dart';
import 'package:pikkup/components/destination_ring_big.dart';
import 'package:pikkup/components/pin.dart';
import 'package:pikkup/utils/app_colors.dart' as app_colors;
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ChooseLocationOnMapScreen extends StatelessWidget {
  ChooseLocationOnMapScreen({Key? key}) : super(key: key);

  static const String id = 'choose_location_on_map_screen';

  final panelController = PanelController();

  @override
  Widget build(BuildContext context) {
    double _panelHeightOpen = 275;
    double _panelHeightClosed = 275;

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
        children: [
          const SizedBox(height: 37),
          const Text(
            'Destination',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              fontFamily: 'Sora',
              color: app_colors.primaryBlack,
            ),
          ),
          const SizedBox(height: 24),
          const AddressTextBox(),
          const SizedBox(height: 48),
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
      decoration: InputDecoration(
        prefixIcon:
            const FittedBox(fit: BoxFit.none, child: DestinationRingBig()),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(color: app_colors.primaryBlueDark, width: 1.0),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(color: app_colors.primaryBlueDark, width: 2.0),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      // .copyWith(
      //     hintText:
      //     'Enter your email'), //We use copyWith to overwrite the text in the hintText:
    );
  }
}
