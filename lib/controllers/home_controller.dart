import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  int index = 0;
  int get getIndex => index;

  changeIndex(int i) {
    index = i;
    notifyListeners();
  }
}
