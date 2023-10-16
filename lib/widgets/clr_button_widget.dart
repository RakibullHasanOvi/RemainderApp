// import 'package:daly_task_app/models/boxes.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';
// import '../models/task_model.dart';
// import '../providers/task_provider.dart';
// import '../providers/themeprovider.dart';
// import 'button_widgets.dart';
// import 'color_widgets.dart';

// class ColorAndButton extends StatefulWidget {
//   const ColorAndButton({
//     super.key,
//     required TextEditingController titleController,
//     required TextEditingController noteController,
//     required this.selectedDate,
//     required this.startTime,
//     required this.endTime,
//     required this.selectedOption,
//     required String selecteItem,
//     required this.selectedColor,
//   })  : _titleController = titleController,
//         _noteController = noteController,
//         _selecteItem = selecteItem;

//   final TextEditingController _titleController;
//   final TextEditingController _noteController;
//   final DateTime selectedDate;
//   final TimeOfDay startTime;
//   final TimeOfDay endTime;
//   final int selectedOption;
//   final String _selecteItem;
//   final int selectedColor;

//   @override
//   State<ColorAndButton> createState() => _ColorAndButtonState();
// }

// class _ColorAndButtonState extends State<ColorAndButton> {
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<ThemeProvider>(builder: (context, value, child) {
//       return Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text('Color', style: value.titleStyle),
//               SizedBox(height: 8.0.h),
//               const SeClrWidget(),
//             ],
//           ),
//           Consumer<TaskProvider>(builder: (context, taskProvider, child) {
//             return ButtonWidgets(
//               label: 'Create Task',
//               onTap: () {
//                 setState(() {
//                   boxTasks.put(
//                     'key_{$_titleController.text}',
//                     Task(
//                       title: _titleController.text,
//                       note: _noteController.text,
//                       date: selectedDate,
//                       startTime: startTime.format(context),
//                       endTime: endTime.format(context),
//                       reminder: selectedOption.toString(),
//                       repeat: _selecteItem,
//                       color: selectedColor.toString(),
//                       isCompleted: 0,
//                     ),
//                   );
//                 });

// //? Save the data by this section..
//                 // final newTask = Task(
//                 //   title: _titleController.text,
//                 //   note: _noteController.text,
//                 //   date: selectedDate,
//                 //   startTime: startTime.format(context),
//                 //   endTime: endTime.format(context),
//                 //   reminder: selectedOption.toString(),
//                 //   repeat: _selecteItem,
//                 //   color: selectedColor.toString(),
//                 //   isCompleted: 0,
//                 // );
//                 // taskProvider.addTask(newTask);
// //?This implement some condition...Anyhow the field notempty then it work otherwise don't..
//                 if (widget._titleController.text.isNotEmpty &
//                     widget._noteController.text.isNotEmpty) {
//                   Navigator.pop(context);
//                 } else if (widget._titleController.text.isEmpty ||
//                     widget._noteController.text.isEmpty) {
// //?Here is a alert messege
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(
//                       content: Text(
//                         'Please write something',
//                         style: value.titleStyle,
//                       ),
//                       behavior: SnackBarBehavior.floating,
//                       backgroundColor: value.getThemeType() == ThemeType.dark
//                           ? Colors.red
//                           : yellowClr,
//                     ),
//                   );
//                 }
//               },
//             );
//           }),
//         ],
//       );
//     });
//   }
// }
