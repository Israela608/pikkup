import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:pikkup/models/tracking_model.dart';

class TrackingViewModel extends ChangeNotifier {
  //String? _selectedPromo;

  final List<TrackingModel> _trackingStage = [
    TrackingModel(
      stage: TrackingStage.requestPlaces,
      label: 'Pickup request placed',
      time: '4:30PM',
      date: 'Feb 5, 2022',
      isDone: true,
    ),
    TrackingModel(
      stage: TrackingStage.dispatcherAssigned,
      label: 'Dispatcher assigned for delivery',
      time: '4:33PM',
      date: 'Feb 5, 2022',
      isDone: true,
    ),
    TrackingModel(
      stage: TrackingStage.packagePickedUp,
      label: 'Package pickedup',
      time: '4:33PM',
      date: 'Feb 5, 2022',
      isDone: true,
    ),
    TrackingModel(
      stage: TrackingStage.packageOnRoute,
      label: 'Package on Route, 93 Ofada Rd, Mowe 110113, Loburo',
      time: '4:33PM',
      date: 'Feb 5, 2022',
      isDone: true,
    ),
  ];

  //String? get selectedPromo => _selectedPromo;

  UnmodifiableListView<TrackingModel> get trackingStage {
    return UnmodifiableListView(_trackingStage);
  }

  int get trackingStageCount {
    int trackingLength = 0;

    for (int i = 0; i < _trackingStage.length; i++) {
      if (trackingStage[i].isDone) {
        trackingLength += 1;
      } else {
        break;
      }
    }

    return trackingLength;
  }

  // setSelectedPromo({required String? selectedPromo}) {
  //   _selectedPromo = selectedPromo;
  //   notifyListeners();
  // }
  //
  // setSelectedPromoAsNull() {
  //   _selectedPromo = null;
  // }
}
