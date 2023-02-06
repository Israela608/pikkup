import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pikkup/components/texts/header_text.dart';
import 'package:pikkup/components/time_date_circle.dart';
import 'package:pikkup/components/tracking_progress_line.dart';
import 'package:pikkup/config/themes/app_colors.dart' as app_colors;
import 'package:pikkup/config/themes/decorations.dart';
import 'package:pikkup/screens/tracking/dispatcher_panel.dart';
import 'package:pikkup/screens/tracking/tracking_map_screen.dart';
import 'package:pikkup/view_models/home_page_view_models/tracking_view_model.dart';
import 'package:pikkup/widgets/standard_app_bar.dart';
import 'package:provider/provider.dart';

class TrackingScreen extends StatelessWidget {
  const TrackingScreen({Key? key}) : super(key: key);

  static const String id = 'tracking_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: app_colors.background,
      appBar: StandardAppBar(title: 'Track Shipment'),
      body: const DispatcherPanel(
        body: BodyWidget(),
      ),
    );
  }
}

class BodyWidget extends StatelessWidget {
  const BodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: kStandardPaddingSize),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            SizedBox(height: 32),
            TrackingIdText(text: 'Tracking ID'),
            SizedBox(height: 8),
            IdBox(),
            SizedBox(height: 48),
            LiveUpdatesHeaderWidget(),
            SizedBox(height: 24),
            LiveUpdatesCard(),
          ],
        ),
      ),
    );
  }
}

class TrackingIdText extends StatelessWidget {
  const TrackingIdText({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 12,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w500,
        color: app_colors.primaryBlack,
      ),
    );
  }
}

class IdBox extends StatelessWidget {
  const IdBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: app_colors.primaryBlue,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 27.5),
        child: const Center(
          child: HeaderText(
            text: '458748500AF',
            color: app_colors.white,
          ),
        ),
      ),
    );
  }
}

class LiveUpdatesHeaderWidget extends StatelessWidget {
  const LiveUpdatesHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const HeaderText(
          text: 'Live updates',
          headerTextSize: HeaderTextSize.verySmall,
        ),
        ViewOnMapButton(
          onPressed: () {
            Navigator.pushNamed(context, TrackingMapScreen.id);
          },
        ),
      ],
    );
  }
}

class ViewOnMapButton extends StatelessWidget {
  const ViewOnMapButton({Key? key, required this.onPressed}) : super(key: key);
  final dynamic onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: app_colors.primaryBlue.withOpacity(0.05),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        side: const BorderSide(color: app_colors.primaryBlue, width: 1),
        minimumSize: Size.zero,
        elevation: 0,
        padding: const EdgeInsets.all(8),
      ),
      child: const Text(
        'view on map',
        style: TextStyle(
          fontSize: 10,
          fontFamily: 'Inter',
          color: app_colors.primaryBlue,
        ),
      ),
    );
  }
}

class LiveUpdatesCard extends StatelessWidget {
  const LiveUpdatesCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<TrackingViewModel>(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: app_colors.cardAsh,
      ),
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 8),
            child: UpdateTile(
              label: model.trackingStage[index].label,
              time: model.trackingStage[index].time,
              date: model.trackingStage[index].date,
              isPresentTile:
                  index == model.trackingStageCount - 1 ? true : false,
            ),
          );
        },
        itemCount: model.trackingStageCount,
      ),
    );
  }
}

class UpdateTile extends StatelessWidget {
  const UpdateTile(
      {Key? key,
      required this.label,
      required this.time,
      required this.date,
      required this.isPresentTile})
      : super(key: key);

  final String label;
  final String time;
  final String date;
  final bool isPresentTile;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            const Image(
              image: AssetImage('images/success_checkbox.png'),
              width: 26.67,
              height: 26.67,
            ),
            const SizedBox(height: 2.67),
            isPresentTile ? Container() : const TrackingProgressLine(),
          ],
        ),
        const SizedBox(width: 14.67),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  color: app_colors.primaryBlack,
                ),
              ),
              const SizedBox(height: 8),
              RichText(
                text: TextSpan(children: [
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: Image(
                      image:
                          const AssetImage('images/alarm_clock_outlined.png'),
                      width: 21,
                      height: 21,
                      color: isPresentTile
                          ? app_colors.description
                          : app_colors.textAsh,
                    ),
                  ),
                  const WidgetSpan(child: SizedBox(width: 8)),
                  WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: Text(
                        time,
                        style: TextStyle(
                          fontSize: 11,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          color: isPresentTile
                              ? app_colors.description
                              : app_colors.textAsh,
                        ),
                      )),
                  const WidgetSpan(child: SizedBox(width: 4)),
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: TimeDateCircle(
                        color: isPresentTile
                            ? app_colors.description
                            : app_colors.textAsh),
                  ),
                  const WidgetSpan(child: SizedBox(width: 4)),
                  WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: Text(
                        date,
                        style: TextStyle(
                          fontSize: 11,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          color: isPresentTile
                              ? app_colors.description
                              : app_colors.textAsh,
                        ),
                      )),
                ]),
              ),
            ],
          ),
        )
      ],
    );
  }
}
