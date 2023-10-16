// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// class DateProvider extends ChangeNotifier {
//   late DateTime _selectedDate =
//       DateFormat.yMd().format(DateTime.now()) as DateTime; // Selected date

//   DateTime get selectedDate => _selectedDate;

//   void updateSelectedDate(DateTime newData) {
//     _selectedDate = newData;
//     notifyListeners();
//   }
// }

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateProvider extends ChangeNotifier {
  late DateTime _selectedDate;

  DateProvider() {
    _selectedDate = DateTime.now();
  }

  DateTime get selectedDate => _selectedDate;

  void updateSelectedDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }

  String getFormattedDate() {
    return DateFormat.yMd().format(_selectedDate);
  }
}
