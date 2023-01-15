import 'package:flutter/foundation.dart';

class HomeViewModel extends ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  setCurrentIndex({required int currentIndex}){
    _currentIndex = currentIndex;
    notifyListeners();
  }
}
