import 'package:daly_task_app/providers/dropdown_prodiver.dart';
import 'package:daly_task_app/providers/themeprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'input_widgets.dart';

class Remainder extends StatelessWidget {
  const Remainder({super.key});
  @override
  Widget build(BuildContext context) {
//! this list create for Reminder field..
    late List<int> reminderList = [5, 10, 15, 20];
//? Call provider..
    return Consumer<RemainderProvider>(builder: (context, reminder, child) {
      // final selectedOption = reminder.selectedOption;
      return Consumer<ThemeProvider>(builder: (context, value, child) {
//Call theme provider by Consumer builder...
        return InputFeild(
          title: "Reminder",
          hitn: '${reminder.selectedOption}',
          widget: DropdownButton(
            icon: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: value.getThemeType() == ThemeType.dark
                  ? Colors.white
                  : Colors.grey,
            ),
            underline: Container(
              height: 0.h,
            ),
            iconSize: 28.sp,
            elevation: 4,
            style: value.subTitleStyle,
            items: reminderList.map<DropdownMenuItem>(
              (int value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(
                    value.toString(),
                  ),
                );
              },
            ).toList(),
            onChanged: (newValue) {
              reminder.updateSelectedOption(newValue as int);
            },
          ),
        );
      });
    });
  }
}
