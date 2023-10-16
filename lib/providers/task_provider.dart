import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/task_model.dart';

class TaskProvider extends ChangeNotifier {
  late Box<Task> _taskBox;
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  TaskProvider() {
    _taskBox = Hive.box<Task>("TaskBox");
    _tasks = _taskBox.values.toList();
    notifyListeners();
  }
  void markAsCompleted(Task task) {
    task.isCompleted = 0;
    task.save();
    notifyListeners();
  }

  void markAsIncomplete(Task task) {
    task.isCompleted = 1;
    task.save();
    notifyListeners();
  }

  void addTask(Task task) {
    _taskBox.add(task);
    _tasks.add(task);
    task.save();
    notifyListeners();
  }

  void updateTask(Task task) {
    task.save();
    notifyListeners();
  }

  void deleteTask(Task task) {
    task.delete();
    _tasks.remove(task);
    notifyListeners();
  }

  void clearTasks() {
    _taskBox.clear();
    notifyListeners();
  }
}

// import 'package:flutter/foundation.dart';
// import 'package:hive/hive.dart';
// import '../models/task_model.dart';

// class TaskProvider extends ChangeNotifier {
//   final Box<Task> _taskBox = Hive.box<Task>("TaskBox");

//   List<Task> get tasks => _taskBox.values.toList();

//   void addTask(Task task) {
//     _taskBox.add(task);
//     notifyListeners();
//   }

//   void updateTask(Task task) {
//     task.save();
//     notifyListeners();
//   }

//   void deleteTask(Task task) {
//     task.delete();
//     notifyListeners();
//   }

//   void clearTasks() {
//     _taskBox.clear();
//     notifyListeners();
//   }
// }
