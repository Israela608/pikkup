enum TrackingStage {
  requestPlaces,
  dispatcherAssigned,
  packagePickedUp,
  packageOnRoute,
  arrivedAtDestination
}

class TrackingModel {
  TrackingModel({
    required this.stage,
    required this.label,
    required this.time,
    required this.date,
    required this.isDone,
  });

  late final TrackingStage stage;
  late final String label;
  late final String time;
  late final String date;
  late final bool isDone;
}
