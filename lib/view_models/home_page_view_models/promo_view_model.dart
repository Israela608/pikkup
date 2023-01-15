import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:pikkup/models/promo_model.dart';

class PromoViewModel extends ChangeNotifier {
  late PromoModel _selectedPromo;
  late bool _isApplyButtonActivated;

  final List<PromoModel> _promos = [
    PromoModel(
        label: 'Loyal customer',
        description: 'Orders up to 20% off on your next 4 deliveries',
        isUnlocked: true),
    PromoModel(
        label: 'Golden customer',
        description: 'Orders up to 35% off on your next 4 deliveries',
        isUnlocked: true),
    PromoModel(
        label: 'Diamond customer',
        description: 'Unlock after completing a minimum of 10 delivery orders',
        isUnlocked: false),
  ];

  PromoModel get selectedPromo => _selectedPromo;
  UnmodifiableListView<PromoModel> get promos => UnmodifiableListView(_promos);
  int get promoCount => _promos.length;
  bool get isApplyButtonActivated => _isApplyButtonActivated;

  instantiate() {
    _selectedPromo = PromoModel(label: '', description: '', isUnlocked: false);
    _isApplyButtonActivated = false;
  }

  setSelectedPromo({required index}) {
    if (isSelected(index: index)) {
      //If This option has already been set, then there's no need to set it again
      return;
    } else {
      if (!promos[index].isUnlocked) {
        _selectedPromo =
            PromoModel(label: '', description: '', isUnlocked: false);
        _isApplyButtonActivated = false;
      } else {
        _selectedPromo = promos[index];
        _isApplyButtonActivated = true;
      }
    }

    //debugPrint(promos[index].label);
    notifyListeners();
  }

  bool isSelected({index}) {
    return !promos[index].isUnlocked
        ? false
        : selectedPromo == promos[index]
            ? true
            : false;
  }
}
