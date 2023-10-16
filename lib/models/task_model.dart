import 'package:hive/hive.dart';
part 'task_model.g.dart';

@HiveType(typeId: 0)
class Task extends HiveObject {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? title;

  @HiveField(2)
  String? note;

  @HiveField(3)
  int? isCompleted;

  @HiveField(4)
  DateTime? date;

  @HiveField(5)
  String? startTime;

  @HiveField(6)
  String? endTime;

  @HiveField(7)
  String? color;

  @HiveField(8)
  String? reminder;

  @HiveField(9)
  String? repeat;

  Task({
    this.id,
    this.title,
    this.note,
    this.isCompleted,
    this.date,
    this.startTime,
    this.endTime,
    this.color,
    this.reminder,
    this.repeat,
  });
}
