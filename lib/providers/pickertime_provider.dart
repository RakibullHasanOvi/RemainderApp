import 'package:flutter/material.dart' show ChangeNotifier, TimeOfDay;

class TimeChangeProvider extends ChangeNotifier {
  TimeOfDay _startTime = TimeOfDay.now(); // Start time
  TimeOfDay _endTime = TimeOfDay.now(); // End time

  TimeOfDay get startTime => _startTime;
  TimeOfDay get endTime => _endTime;

  void updateStartTime(TimeOfDay newStartTime) {
    _startTime = newStartTime;
    notifyListeners();
  }

  void updateEndTime(TimeOfDay newEndTime) {
    _endTime = newEndTime;
    notifyListeners();
  }
}
