import 'package:flutter/material.dart';

class TrackShipmentViewModel extends ChangeNotifier {
  late GlobalKey<FormState> _formKey;
  late String _parcelId;
  late bool _hasError = false;
  late bool _isCompleted = false;

  initialize() {
    _formKey = GlobalKey<FormState>();
    _hasError = false;
    _isCompleted = false;
  }

  GlobalKey<FormState> get formKey => _formKey;
  String get parcelId => _parcelId;
  bool get hasError => _hasError;
  bool get isCompleted => _isCompleted;
  String? get errorMessage =>
      hasError ? 'Please Enter a valid Parcel ID' : null;

  //Check if the Inputted parcelID matches any ParcelID of your goods that are currently being delivered.
  //This code is not complete yet. It is meant to search and match Live ParcelIDs of a list, not just a single item
  bool get idIsCorrect => parcelId == '458748500AF' ? true : false;

  setParcelId({required String parcelId}) {
    _parcelId = parcelId;
  }

  setHasError({required bool hasError}) {
    _hasError = hasError;
    notifyListeners();
  }

  setIsCompleted({required bool isCompleted}) {
    _isCompleted = isCompleted;
  }

  String? parcelIdValidator({required String? parcelIdValue}) {
    final alphanumeric = RegExp(r'^[a-zA-Z0-9]+$');

    if (parcelIdValue!.isEmpty) {
      return 'Please Enter an Parcel ID';
    }
    if (!alphanumeric.hasMatch(parcelIdValue)) {
      return 'Contains non alphanumeric characters';
    }
    if (parcelIdValue.length < 11) {
      return 'Please Enter a valid Parcel ID';
    }

    // if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}').hasMatch(parcelIdValue)) {
    //   return 'Please enter a valid Email';
    // }

    return null;
  }

  void changeButton() {
    setIsCompleted(
        isCompleted: formKey.currentState!.validate() ? true : false);

    notifyListeners();
  }
}
