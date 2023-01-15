import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pikkup/components/buttons/back_circular.dart';
import 'package:pikkup/components/pin.dart';
import 'package:pikkup/utils/app_colors.dart' as app_colors;
import 'package:pikkup/widgets/dispatcher_panel.dart';

class TrackingMapScreen extends StatelessWidget {
  const TrackingMapScreen({Key? key}) : super(key: key);

  static const String id = 'tracking_map_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: app_colors.background,
      body: Stack(
        children: [
          const DispatcherPanel(
            body: MapWidget(),
          ),
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
