import 'dart:collection';

import 'package:flutter/foundation.dart';

class ShippingAddressesViewModel extends ChangeNotifier {
  final List<String> _shippingAddresses = [
    '36, Idris Jibowu Street, Ajah , Lagos State',
    '41, Idris Jibowu Street, Ajah , Lagos State',
    '09, Idris Jibowu Street, Ajah , Lagos State',
    '16, Idris Jibowu Street, Ajah , Lagos State',
  ];

  UnmodifiableListView<String> get shippingAddresses =>
      UnmodifiableListView(_shippingAddresses);

  int get shippingAddressesCount => _shippingAddresses.length;

/*

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
*/

}
