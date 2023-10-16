import 'package:flutter/material.dart';

class RemainderProvider extends ChangeNotifier {
  int _selectedOption = 5; // Default selected option

  int get selectedOption => _selectedOption;

  void updateSelectedOption(int newOption) {
    _selectedOption = newOption;
    notifyListeners();
  }
}
