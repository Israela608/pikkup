import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class SendAPackageViewModel extends ChangeNotifier {
  //GENERAL
  final int _totalPages = 4;
  late double _currentPosition;

  initialize() {
    resetPosition();
    initializeProductInformationPage();
    initializePickupInformationPage();
    initializeDestinationInformationPage();
    initializeReceiverInformationPage();
  }

  int get totalPages => _totalPages;
  double get currentPosition => _currentPosition;

  previousPage() {
    _currentPosition = _currentPosition - 1;
    debugPrint(currentPosition.toString());
    notifyListeners();
  }

  nextPage() {
    _currentPosition = _currentPosition + 1;
    notifyListeners();
  }

  resetPosition() {
    _currentPosition = 0;
  }

  setCurrentPosition({required double currentPosition}) {
    _currentPosition = currentPosition;
    notifyListeners();
  }

  //PRODUCT INFORMATION PAGE
  late GlobalKey<FormState> _productPageFormKey;
  late String _productName, _weight;
  int? _quantity;
  late bool _isProductPageCompleted;
  late bool _isProductNameValidated, _isWeightValidated, _isQuantityValidated;

  initializeProductInformationPage() {
    _productPageFormKey = GlobalKey<FormState>();
    _quantity = 0;
    _isProductNameValidated = false;
    _isWeightValidated = false;
    _isQuantityValidated = false;
    _isProductPageCompleted = false;
  }

  GlobalKey<FormState> get productPageFormKey => _productPageFormKey;
  String get productName => _productName;
  String get weight => _weight;
  int? get quantity => _quantity;
  bool get isProductPageCompleted => _isProductPageCompleted;

  setProductName({required String productName}) {
    _productName = productName;
  }

  setWeight({required String weight}) {
    _weight = weight;
  }

  setQuantity({required String quantity}) {
    _quantity = int.tryParse(quantity);
  }

  setIsProductPageCompleted({required bool isCompleted}) {
    _isProductPageCompleted = isCompleted;
  }

  String? productNameValidator({required String? nameValue}) {
    _isProductNameValidated = false;
    if (nameValue!.isEmpty) {
      return 'Please Enter Name';
    }

    _isProductNameValidated = true;
    updateProductPageNextButton();
    return null;
  }

  // String? weightValidator({required String? emailValue}) {
  //   if (emailValue!.isEmpty) {
  //     return 'Please Enter an Email';
  //   }
  //   if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
  //       .hasMatch(emailValue)) {
  //     return 'Please enter a valid Email';
  //   }
  //   return null;
  // }
  String? quantityValidator({required String quantityText}) {
    _isQuantityValidated = false;
    int? quantity = int.tryParse(quantityText);
    if (quantity == null || quantity < 1 || quantity > 100) {
      return 'Please Enter a valid number from 1 - 100';
    }

    _isQuantityValidated = true;
    updateProductPageNextButton();
    return null;
  }

  void updateProductPageNextButton() {
    if (_isProductNameValidated &&
        //_isWeightValidated &&
        _isQuantityValidated) {
      setIsProductPageCompleted(isCompleted: true);
    } else {
      setIsProductPageCompleted(isCompleted: false);
    }

    //Calls notify listener when the validating process is complete to prevent errors or interference
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      notifyListeners();
    });
  }

  //PICKUP ADDRESS PAGE
  late GlobalKey<FormState> _pickupPageFormKey;
  late String _pickupAddress;
  late bool _isPickupAddressSaveCheck, _isPickupPageCompleted;

  initializePickupInformationPage() {
    _pickupPageFormKey = GlobalKey<FormState>();
    _isPickupAddressSaveCheck = false;
    _isPickupPageCompleted = false;
  }

  GlobalKey<FormState> get pickupPageFormKey => _pickupPageFormKey;
  String get pickupAddress => _pickupAddress;
  bool get isPickupAddressSaveCheck => _isPickupAddressSaveCheck;
  bool get isPickupPageCompleted => _isPickupPageCompleted;

  setPickupAddress({required String pickupAddress}) {
    _pickupAddress = pickupAddress;
  }

  setIsPickupPageCompleted({required bool isCompleted}) {
    _isPickupPageCompleted = isCompleted;
  }

  void togglePickupAddressSaveCheck() {
    _isPickupAddressSaveCheck = !_isPickupAddressSaveCheck;
    notifyListeners();
  }

  String? pickupAddressValidator({required String? pickupAddress}) {
    if (pickupAddress!.isEmpty) {
      return 'Please Enter Address';
    }
    return null;
  }

  void updatePickupPageNextButton() {
    setIsPickupPageCompleted(
        isCompleted: pickupPageFormKey.currentState!.validate() ? true : false);

    notifyListeners();
  }

  //DESTINATION ADDRESS PAGE
  late GlobalKey<FormState> _destinationPageFormKey;
  late String _destinationAddress;
  late bool _isDestinationAddressSaveCheck, _isDestinationPageCompleted;

  initializeDestinationInformationPage() {
    _destinationPageFormKey = GlobalKey<FormState>();
    _isDestinationAddressSaveCheck = false;
    _isDestinationPageCompleted = false;
  }

  GlobalKey<FormState> get destinationPageFormKey => _destinationPageFormKey;
  String get destinationAddress => _destinationAddress;
  bool get isDestinationAddressSaveCheck => _isDestinationAddressSaveCheck;
  bool get isDestinationPageCompleted => _isDestinationPageCompleted;

  setDestinationAddress({required String destinationAddress}) {
    _destinationAddress = destinationAddress;
  }

  setIsDestinationPageCompleted({required bool isCompleted}) {
    _isDestinationPageCompleted = isCompleted;
  }

  void toggleDestinationAddressSaveCheck() {
    _isDestinationAddressSaveCheck = !_isDestinationAddressSaveCheck;
    notifyListeners();
  }

  String? destinationAddressValidator({required String? destinationAddress}) {
    if (destinationAddress!.isEmpty) {
      return 'Please Enter Address';
    }
    return null;
  }

  void updateDestinationPageNextButton() {
    setIsDestinationPageCompleted(
        isCompleted:
            destinationPageFormKey.currentState!.validate() ? true : false);

    notifyListeners();
  }

  //RECEIVER INFORMATION PAGE
  late GlobalKey<FormState> _receiverPageFormKey;
  late String _name, _phoneNumber;
  late bool _isReceiverDetailsSaveCheck, _isReceiverPageCompleted;
  late bool _isNameValidated, _isPhoneNumberValidated;

  initializeReceiverInformationPage() {
    _receiverPageFormKey = GlobalKey<FormState>();
    _phoneNumber = '';
    _isReceiverDetailsSaveCheck = false;
    _isNameValidated = false;
    _isPhoneNumberValidated = false;
    _isReceiverPageCompleted = false;
  }

  GlobalKey<FormState> get receiverPageFormKey => _receiverPageFormKey;
  String get name => _name;
  String get phoneNumber => _phoneNumber;
  bool get isReceiverDetailsSaveCheck => _isReceiverDetailsSaveCheck;
  bool get isReceiverPageCompleted => _isReceiverPageCompleted;

  setName({required String name}) {
    _name = name;
  }

  setPhoneNumber({required PhoneNumber number}) {
    //This is the standard phone number with the country dial code
    String internationalPhoneNumber = number.phoneNumber.toString();

    String ph;

    //Replace the dial code with zero
    ph = number.phoneNumber
        .toString()
        .replaceAll(number.dialCode.toString(), '0');

    //If the number starts with two zeros, replace with zero
    ph = ph.startsWith('00') ? ph.replaceFirst('00', '0') : ph;

    _phoneNumber = ph;
  }

  setIsReceiverPageCompleted({required bool isCompleted}) {
    _isReceiverPageCompleted = isCompleted;
  }

  void toggleReceiverDetailsSaveCheck() {
    _isReceiverDetailsSaveCheck = !_isReceiverDetailsSaveCheck;
    notifyListeners();
  }

  String? nameValidator({required String? nameValue}) {
    _isNameValidated = false;
    if (nameValue!.isEmpty) {
      return 'Please Enter Name';
    }

    _isNameValidated = true;
    updateReceiverPageNextButton();
    return null;
  }

  void phoneNumberValidator({required bool isPhoneNumberValidated}) {
    _isPhoneNumberValidated = isPhoneNumberValidated;
    updateReceiverPageNextButton();
  }

  void updateReceiverPageNextButton() {
    if (_isNameValidated && _isPhoneNumberValidated) {
      setIsReceiverPageCompleted(isCompleted: true);
    } else {
      setIsReceiverPageCompleted(isCompleted: false);
    }

    //Calls notify listener when the validating process is complete to prevent errors or interference
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      notifyListeners();
    });
  }
}
