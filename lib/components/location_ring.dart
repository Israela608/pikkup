import 'package:flutter/material.dart';
import 'package:pikkup/config/themes/app_colors.dart' as app_colors;
import 'package:pikkup/utils/dimensions.dart';

enum LocationRingType { pickup, destination }

enum LocationRingSize { small, normal, big }

class LocationRing extends StatelessWidget {
  const LocationRing({
    Key? key,
    required this.locationRingType,
    required this.locationRingSize,
  }) : super(key: key);

  final LocationRingType locationRingType;
  final LocationRingSize locationRingSize;

  @override
  Widget build(BuildContext context) {
    late Color ringColor;
    late double ringSize;
    late double paddingSize;
    late double ringThickness;

    switch (locationRingType) {
      case LocationRingType.pickup:
        ringColor = app_colors.successDark;
        break;

      case LocationRingType.destination:
        ringColor = app_colors.pending;
        break;
    }

    switch (locationRingSize) {
      case LocationRingSize.small:
        ringSize = Dimensions.d13 + (Dimensions.d1 * 0.59);
        paddingSize = Dimensions.d1 + (Dimensions.d1 * 0.13);
        ringThickness = Dimensions.d3 + (Dimensions.d1 * 0.5);
        break;

      case LocationRingSize.normal:
        ringSize = Dimensions.d16;
        paddingSize = Dimensions.d1 + (Dimensions.d1 * 0.33);
        ringThickness = Dimensions.d4;
        break;

      case LocationRingSize.big:
        ringSize = Dimensions.d24;
        paddingSize = Dimensions.d2;
        ringThickness = Dimensions.d6;
        break;
    }

    return Container(
      height: ringSize,
      width: ringSize,
      padding: EdgeInsets.all(paddingSize),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: ringColor, width: ringThickness),
        ),
      ),
    );
  }
}
