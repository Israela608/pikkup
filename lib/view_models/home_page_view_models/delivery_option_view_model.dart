import 'package:flutter/foundation.dart';

enum DeliveryType { instant, scheduled }

class DeliveryOptionViewModel extends ChangeNotifier {
  DeliveryType? _selectedDeliveryType;

  DeliveryType? get selectedDeliveryType => _selectedDeliveryType;

  setDeliveryTypeAsInstant(){
    _selectedDeliveryType = DeliveryType.instant;
    notifyListeners();
  }

  setDeliveryTypeAsScheduled(){
    _selectedDeliveryType = DeliveryType.scheduled;
    notifyListeners();
  }

  setDeliveryTypeAsNull(){
    _selectedDeliveryType = null;
  }
}