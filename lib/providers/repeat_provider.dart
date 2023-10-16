import 'package:flutter/material.dart';

class RepeatProvider extends ChangeNotifier {
  String _selecteItem = "None"; // Default selected option

  String get selectedOption => _selecteItem;

  void updateSelectedOption(String newOption) {
    _selecteItem = newOption;
    notifyListeners();
  }
}
