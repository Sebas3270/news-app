import 'package:flutter/material.dart';

class ScreenProvider extends ChangeNotifier{

  int _currentIndex = 0;

  int get currentIndex{
    return _currentIndex;
  }

  set currentIndex(int i){
    _currentIndex = i;
    notifyListeners();
  }

}