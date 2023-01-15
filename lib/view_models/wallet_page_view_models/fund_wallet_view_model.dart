import 'package:flutter/foundation.dart';
import 'package:pikkup/models/fund_wallet_options_model.dart';

class FundWalletViewModel extends ChangeNotifier {
  late List<FundWalletOptions> _fundingOptions;
  late FundWalletOptions _selectedOption;
  late bool _isContinueButtonActivated;

  List<FundWalletOptions> get fundingOptions => _fundingOptions;
  FundWalletOptions get selectedOption => _selectedOption;
  bool get isContinueButtonActivated => _isContinueButtonActivated;

  instantiate() {
    _fundingOptions = FundWalletOptions.getOptions();
    _selectedOption = FundWalletOptions();
    _isContinueButtonActivated = false;
  }

  setSelectedOption({index}) {
    if (isSelected(index: index)) {
      //If This option has already been set, then there's no need to set it again
      return;
    } else {
      _selectedOption = fundingOptions[index];
      _isContinueButtonActivated = true;
      debugPrint('Current User ${fundingOptions[index].label}');
    }
    notifyListeners();
  }

  bool isSelected({index}) {
    late bool isSelected;
    selectedOption == fundingOptions[index]
        ? isSelected = true
        : isSelected = false;
    return isSelected;
  }

  int get optionCount {
    return _fundingOptions.length;
  }

  notifyListener() {
    notifyListeners();
  }
}
