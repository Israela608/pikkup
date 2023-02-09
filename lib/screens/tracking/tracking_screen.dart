import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pikkup/components/spacer.dart';
import 'package:pikkup/components/texts/header_text.dart';
import 'package:pikkup/components/time_date_circle.dart';
import 'package:pikkup/components/tracking_progress_line.dart';
import 'package:pikkup/config/themes/app_colors.dart' as app_colors;
import 'package:pikkup/config/themes/decorations.dart';
import 'package:pikkup/config/themes/styles.dart';
import 'package:pikkup/screens/tracking/dispatcher_panel.dart';
import 'package:pikkup/screens/tracking/tracking_map_screen.dart';
import 'package:pikkup/utils/dimensions.dart';
import 'package:pikkup/utils/ui_parameters.dart';
import 'package:pikkup/view_models/home_page_view_models/tracking_view_model.dart';
import 'package:pikkup/widgets/standard_app_bar.dart';
import 'package:provider/provider.dart';

class TrackingScreen extends StatelessWidget {
  const TrackingScreen({Key? key}) : super(key: key);

  static const String id = '/tracking_screen';

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
      padding: UIParameters.screenHorizontalPadding,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const BigSpacer(),
            const TrackingIdText(text: 'Tracking ID'),
            const TitleBodySpacer(),
            const IdBox(),
            SizedBox(height: Dimensions.d48),
            const LiveUpdatesHeaderWidget(),
            const StandardSpacer(),
            const LiveUpdatesCard(),
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
      style: interNormalText.copyWith(fontWeight: FontWeight.w500),
    );
  }
}

class IdBox extends StatelessWidget {
  const IdBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: smallCardDecoration.copyWith(color: app_colors.primaryBlue),
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: Dimensions.d27 + Dimensions.d1 * 0.5),
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
        backgroundColor: app_colors.primaryBlue.withOpacity(0.05),
        shape: RoundedRectangleBorder(
            borderRadius: UIParameters.smallBorderRadius),
        side: BorderSide(color: app_colors.primaryBlue, width: Dimensions.d1),
        minimumSize: Size.zero,
        elevation: 0,
        padding: UIParameters.smallPadding,
      ),
      child: Text('view on map',
          style: interNormalText.copyWith(
            fontSize: Dimensions.d14,
            color: app_colors.primaryBlue,
          )),
    );
  }
}

class LiveUpdatesCard extends StatelessWidget {
  const LiveUpdatesCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<TrackingViewModel>(context);
    return Container(
      decoration: cardDecoration.copyWith(color: app_colors.cardAsh),
      padding: EdgeInsets.symmetric(
        vertical: Dimensions.bigSpacing,
        horizontal: Dimensions.standardPaddingSize,
      ),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(bottom: Dimensions.smallPaddingSize),
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
            Image(
              image: AssetImage('images/success_checkbox.png'),
              width: Dimensions.d26 + Dimensions.d1 * 0.67,
              height: Dimensions.d26 + Dimensions.d1 * 0.67,
            ),
            SizedBox(height: Dimensions.d2 + Dimensions.d1 * 0.67),
            isPresentTile ? Container() : const TrackingProgressLine(),
          ],
        ),
        SizedBox(width: Dimensions.d14 + Dimensions.d1 * 0.67),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: interNormalText.copyWith(fontWeight: FontWeight.w500),
              ),
              TitleBodySpacer(),
              RichText(
                text: TextSpan(children: [
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: Image(
                      image:
                          const AssetImage('images/alarm_clock_outlined.png'),
                      width: Dimensions.d20 + Dimensions.d1,
                      height: Dimensions.d20 + Dimensions.d1,
                      color: isPresentTile
                          ? app_colors.description
                          : app_colors.textAsh,
                    ),
                  ),
                  WidgetSpan(
                      child: SizedBox(width: Dimensions.smallPaddingSize)),
                  WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: Text(
                        time,
                        style: interNormalText.copyWith(
                          fontSize: Dimensions.d14 + Dimensions.d1 * 0.17,
                          fontWeight: FontWeight.w500,
                          color: isPresentTile
                              ? app_colors.description
                              : app_colors.textAsh,
                        ),
                      )),
                  WidgetSpan(child: SizedBox(width: Dimensions.d4)),
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: TimeDateCircle(
                        color: isPresentTile
                            ? app_colors.description
                            : app_colors.textAsh),
                  ),
                  WidgetSpan(child: SizedBox(width: Dimensions.d4)),
                  WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: Text(
                        date,
                        style: interNormalText.copyWith(
                          fontSize: Dimensions.d14 + Dimensions.d1 * 0.17,
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
