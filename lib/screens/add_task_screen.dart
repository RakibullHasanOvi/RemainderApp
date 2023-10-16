// ignore_for_file: no_leading_underscores_for_local_identifiers, unused_import
import 'package:daly_task_app/providers/colorselet_provider.dart';
import 'package:daly_task_app/providers/repeat_provider.dart';
import 'package:daly_task_app/providers/task_provider.dart';
import 'package:daly_task_app/providers/themeprovider.dart';
import 'package:daly_task_app/screens/home_screen.dart';
import 'package:daly_task_app/widgets/button_widgets.dart';
import 'package:daly_task_app/widgets/input_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../models/task_model.dart';
import '../providers/dropdown_prodiver.dart';
import '../providers/pickerdate_provider.dart';
import '../providers/pickertime_provider.dart';
import '../widgets/color_widgets.dart';
import '../widgets/datepicker_widget.dart';
import '../widgets/remainder_widgets.dart';
import '../widgets/timepicker_widgets.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

//! this list create for Reminder field..
  late List<String> repeatList = ["None", "Daily", "Weekly", "Monthly"];

  @override
  Widget build(BuildContext context) {
//? Now All provider calls for put to the hive database...
//This provider is a datePicker..
    return Consumer<DateProvider>(builder: (context, dateProvider, _) {
//This provider is a timePicker..
      return Consumer<TimeChangeProvider>(
          builder: (context, timeRangeProvider, _) {
//This provider is a remainder..
        return Consumer<RemainderProvider>(builder: (context, reminder, _) {
//This provider is a repeater..
          return Consumer<RepeatProvider>(builder: (context, repeater, _) {
//This provider is a color..
            return Consumer<SeletedClrProvider>(
                builder: (context, colorProvider, _) {
//This provider is a addHivedata...
              return Consumer<TaskProvider>(
                  builder: (context, taskProvider, _) {
                return Consumer<ThemeProvider>(
                  builder: (context, val, child) {
                    return Scaffold(
                      // ignore: deprecated_member_use
                      backgroundColor: val.getTheme().backgroundColor,
                      appBar: AppBar(
                        // ignore: deprecated_member_use
                        backgroundColor: val.getTheme().backgroundColor,
                        elevation: 0,
                        leading: IconButton(
                          onPressed: () {},
                          icon: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              val.getThemeType() == ThemeType.light
                                  ? Icons.arrow_back_ios_new
                                  : Icons.arrow_back_ios_new_outlined,
                              color: val.getThemeType() == ThemeType.dark
                                  ? Colors.white
                                  : Colors.black,
                              size: 18.sp,
                            ),
                          ),
                        ),
                        // actions: [
                        //   IconButton(
                        //     onPressed: () {},
                        //     icon: Icon(
                        //       Icons.person_2_rounded,
                        //       color: val.getThemeType() == ThemeType.dark
                        //           ? Colors.white
                        //           : Colors.black,
                        //       size: 18.sp,
                        //     ),
                        //   ),
                        // ],
                      ),
                      body: GestureDetector(
                        onTap: () {
                          FocusScope.of(context).unfocus();
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                              left: 15.w, right: 15.w, top: 8.0.h),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Add Task',
                                  style: val.headingStyle,
                                ),
//! This field for Title..
                                InputFeild(
                                  title: 'Title',
                                  hitn: 'Enter title here',
                                  controller: _titleController,
                                ),
//! This field for Note..
                                InputFeild(
                                  title: 'Note',
                                  hitn: 'Enter your note',
                                  controller: _noteController,
                                ),
//! This field for the Date field..
                                const DatePicker(),
//! This field for the Time field...
                                const TimePicker(),
//? This field for reminder...
                                const Remainder(),
//? This field for Repeat..
                                Consumer<RepeatProvider>(
                                  builder: (context, val4, child) {
                                    final _selecteItem = val4.selectedOption;
                                    return InputFeild(
                                      title: "Repeat",
                                      hitn: _selecteItem,
                                      widget: DropdownButton(
                                        icon: Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: val.getThemeType() ==
                                                  ThemeType.dark
                                              ? Colors.white
                                              : Colors.grey,
                                        ),
                                        underline: Container(
                                          height: 0.h,
                                        ),
                                        iconSize: 28.sp,
                                        elevation: 4,
                                        style: val.subTitleStyle,
                                        items: repeatList
                                            .map<DropdownMenuItem<String>>(
                                                (String? value) {
                                          return DropdownMenuItem<String>(
                                            value: value.toString(),
                                            child: Text(value.toString()),
                                          );
                                        }).toList(),
                                        onChanged: (newValue) {
                                          val4.updateSelectedOption(
                                              newValue.toString());
                                        },
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(height: 8.0.h),
//? last part of this page...
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Color', style: val.titleStyle),
                                        SizedBox(height: 8.0.h),
                                        const SeClrWidget(),
                                      ],
                                    ),
                                    ButtonWidgets(
                                      label: 'Create Task',
                                      onTap: () {
//?This implement some condition...Anyhow the field notempty then it work otherwise don't..
                                        if (_titleController.text.isNotEmpty &
                                            _noteController.text.isNotEmpty) {
//? Save the data by this section..
                                          var newTask = Task(
                                            title: _titleController.text,
                                            note: _noteController.text,
                                            date: dateProvider.selectedDate,
                                            startTime: timeRangeProvider
                                                .startTime
                                                .format(context),
                                            endTime: timeRangeProvider.endTime
                                                .format(context),
                                            reminder: reminder.selectedOption
                                                .toString(),
                                            repeat: repeater.selectedOption,
                                            color: colorProvider.selectedColor
                                                .toString(),
                                            isCompleted: 0,
                                          );
                                          taskProvider.addTask(newTask);

                                          Navigator.push(
                                            context,
                                            PageRouteBuilder(
                                              pageBuilder: (_, __, ___) =>
                                                  const HomeScreen(),
                                              transitionDuration:
                                                  const Duration(
                                                      milliseconds: 400),
                                              transitionsBuilder:
                                                  (_, a, __, c) =>
                                                      FadeTransition(
                                                          opacity: a, child: c),
                                            ),
                                          );
                                        } else if (_titleController
                                                .text.isEmpty ||
                                            _noteController.text.isEmpty) {
//?Here is a alert messege
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Please write something',
                                                style: val.titleStyle,
                                              ),
                                              behavior:
                                                  SnackBarBehavior.floating,
                                              backgroundColor:
                                                  val.getThemeType() ==
                                                          ThemeType.dark
                                                      ? Colors.red
                                                      : yellowClr,
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20.h),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              });
            });
          });
        });
      });
    });
  }
}
