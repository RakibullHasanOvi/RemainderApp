import 'package:daly_task_app/providers/pickertime_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../providers/themeprovider.dart';
import 'input_widgets.dart';

class TimePicker extends StatelessWidget {
  const TimePicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<TimeChangeProvider>(
        builder: (context, timeCangeProvider, child) {
      final startTime = timeCangeProvider.startTime;
      final endTime = timeCangeProvider.endTime;

      // ignore: no_leading_underscores_for_local_identifiers
      Future<void> _selectTime(BuildContext context, bool isStartTime) async {
        final TimeOfDay? pickedTime = await showTimePicker(
          context: context,
          initialTime: isStartTime ? startTime : endTime,
        );

        if (pickedTime != null) {
          if (isStartTime) {
            timeCangeProvider.updateStartTime(pickedTime);
          } else {
            timeCangeProvider.updateEndTime(pickedTime);
          }
        }
      }

      return Consumer<ThemeProvider>(
        builder: (context, value, child) {
          return Row(
            children: [
              Expanded(
                child: InputFeild(
                  title: 'Start Date',
                  // ignore: unnecessary_null_comparison
                  hitn: startTime != null
                      ? startTime.format(context)
                      : 'Select Start Time',
                  widget: IconButton(
                    onPressed: () {
                      _selectTime(context, true);
                    },
                    icon: Icon(
                      Icons.alarm_sharp,
                      color: value.getThemeType() == ThemeType.dark
                          ? Colors.white
                          : Colors.grey,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Expanded(
                child: InputFeild(
                  title: 'End Date',
                  // ignore: unnecessary_null_comparison
                  hitn: endTime != null
                      ? endTime.format(context)
                      : 'Select Start Time',
                  widget: IconButton(
                    onPressed: () {
                      _selectTime(context, false);
                    },
                    icon: Icon(
                      Icons.alarm_sharp,
                      color: value.getThemeType() == ThemeType.dark
                          ? Colors.white
                          : Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      );
    });
  }
}


// Task(
//                                     note: _noteController.text,
//                                     title: _titleController.text,
//                                     date: DateFormat.yMd().format(selectedDate),
//                                     startTime: startTime,
//                                     endTime: endTime,
//                                     reminder: selectedOption,
//                                     repeat: _selecteItem,
//                                     color: selectedColor,
//                                     isCompleted: 0,
//                                   ),