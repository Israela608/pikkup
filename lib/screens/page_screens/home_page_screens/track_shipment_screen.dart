import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:flutter_multi_formatter/utils/unfocuser.dart';
import 'package:pikkup/components/buttons/wide_button.dart';
import 'package:pikkup/components/buttons/wide_button_ash.dart';
import 'package:pikkup/components/text_field_boxes/parcel_id_box.dart';
import 'package:pikkup/components/texts/header_text.dart';
import 'package:pikkup/components/texts/plain_text.dart';
import 'package:pikkup/config/themes/app_colors.dart' as app_colors;
import 'package:pikkup/config/themes/decorations.dart';
import 'package:pikkup/screens/page_screens/home_page_screens/tracking_screen.dart';
import 'package:pikkup/view_models/home_page_view_models/track_shipment_view_model.dart';
import 'package:pikkup/widgets/error_message.dart';
import 'package:pikkup/widgets/standard_app_bar.dart';
import 'package:provider/provider.dart';

class TrackShipmentScreen extends StatefulWidget {
  const TrackShipmentScreen({Key? key}) : super(key: key);

  static const String id = 'track_shipment_screen';

  @override
  State<TrackShipmentScreen> createState() => _TrackShipmentScreenState();
}

class _TrackShipmentScreenState extends State<TrackShipmentScreen> {
  final TextEditingController _parcelIdController = TextEditingController();

  @override
  void initState() {
    Provider.of<TrackShipmentViewModel>(context, listen: false).initialize();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _parcelIdController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Unfocuser(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: app_colors.background,
          appBar: StandardAppBar(
            label: 'Track Shipment',
          ),
          body: Container(
            padding: kScreenHorizontalPadding,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 32),
                  const HeaderText(
                    text: 'Enter your Parcel ID',
                    headerTextSize: HeaderTextSize.verySmall,
                  ),
                  const SizedBox(height: 8),
                  const PlainText(
                    text:
                        'Input the parcel ID of the shipment you wish to track',
                    isBlackColor: true,
                  ),
                  const SizedBox(height: 26),
                  ParcelIDBoxWidget(textController: _parcelIdController),
                  const SizedBox(height: 10),
                  Consumer<TrackShipmentViewModel>(
                      builder: (BuildContext context, model, Widget? child) {
                    return ErrorMessage(errorMessage: model.errorMessage);
                  }),
                  const SizedBox(height: 129),
                  const TrackShipmentButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ParcelIDBoxWidget extends StatelessWidget {
  const ParcelIDBoxWidget({Key? key, required this.textController})
      : super(key: key);
  final dynamic textController;

  @override
  Widget build(BuildContext context) {
    return Consumer<TrackShipmentViewModel>(
        builder: (BuildContext context, model, Widget? child) {
      return Form(
        key: model.formKey,
        child: ParcelIdBox(
          text: 'Parcel ID',
          textController: textController,
          validatorCallback: (value) {
            return model.parcelIdValidator(parcelIdValue: value!);
          },
          onChangedCallback: (value) {
            //Logic
            //Do something with the user input.
            model.setParcelId(parcelId: value);
            model.changeButton();
          },
        ),
      );
    });
  }
}

class TrackShipmentButton extends StatelessWidget {
  const TrackShipmentButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<TrackShipmentViewModel>(context);
    return !model.isCompleted
        ? const WideButtonAsh(label: 'Track Shipment')
        : WideButton(
            label: 'Track Shipment',
            onPressedCallback: () {
              if (model.idIsCorrect) {
                debugPrint("Successful");
                model.setHasError(hasError: false);

                //Now upload the data to database
                Navigator.pushNamed(context, TrackingScreen.id);
                return;
              } else {
                debugPrint("Unsuccessful");
                model.setHasError(hasError: true);
              }
            },
          );
  }
}
