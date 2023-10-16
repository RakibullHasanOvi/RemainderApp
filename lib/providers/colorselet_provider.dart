import 'package:flutter/material.dart';

class SeletedClrProvider extends ChangeNotifier {
  int _selectedColor = 0; // Default selected color

  int get selectedColor => _selectedColor;

  void updateSelectedColor(int newColor) {
    _selectedColor = newColor;
    notifyListeners();
  }

  // Color? getColorFromString(String? colorString) {
  //   if (colorString != null && colorString.isNotEmpty) {
  //     // Use the parse method of the Color class to convert the string to Color object
  //     return Color(int.parse(colorString));
  //   }
  //   return null;
  // }
}
