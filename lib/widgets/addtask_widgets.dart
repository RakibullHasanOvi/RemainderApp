import 'package:daly_task_app/providers/task_provider.dart';
import 'package:daly_task_app/providers/themeprovider.dart';
import 'package:daly_task_app/screens/add_task_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'button_widgets.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final taskProvider = Provider.of<TaskProvider>(context, listen: false);
    return Consumer<ThemeProvider>(builder: (context, value, child) {
      return Container(
        margin: EdgeInsets.only(left: 15.w, right: 15.w, top: 5.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //?First text for date & time..
                Text(
                  DateFormat.yMMMd().format(DateTime.now()),
                  style: value.subHeadingStyle,
                ),
                //?Second text for today..
                Text(
                  'Today',
                  style: value.headingStyle,
                ),
              ],
            ),
            ButtonWidgets(
              label: '+ Add Task',
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => const AddTaskPage(),
                    transitionDuration: const Duration(milliseconds: 400),
                    transitionsBuilder: (_, a, __, c) =>
                        FadeTransition(opacity: a, child: c),
                  ),
                );
              },
            ),
          ],
        ),
      );
    });
  }
}
