import 'package:daly_task_app/widgets/datebar_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: unused_import
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../providers/themeprovider.dart';
import '../widgets/addtask_widgets.dart';
import '../widgets/tasktile_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // ignore: unused_field
  @override
  Widget build(BuildContext context) {
//!Consumer builder is using for provider file function call and implement into the code.
    return Consumer<ThemeProvider>(
      builder: (context, value, child) {
        return Scaffold(
          // ignore: deprecated_member_use
          backgroundColor: value.getTheme().backgroundColor,
          appBar: AppBar(
            elevation: 0,
            // ignore: deprecated_member_use
            backgroundColor: value.getTheme().backgroundColor,
            leading: IconButton(
              onPressed: () {
                final currentTheme = value.getThemeType();
                final newTheme = currentTheme == ThemeType.light
                    ? ThemeType.dark
                    : ThemeType.light;
                value.setTheme(newTheme);
              },
              icon: Icon(
                value.getThemeType() == ThemeType.light
                    ? Icons.nightlight_outlined
                    : Icons.light_mode_outlined,
                color: value.getThemeType() == ThemeType.dark
                    ? Colors.white
                    : Colors.black,
                size: 18.sp,
              ),
            ),
            // actions: [
            //   IconButton(
            //     onPressed: () {},
            //     icon: Icon(
            //       Icons.person_2_outlined,
            //       color: value.getThemeType() == ThemeType.dark
            //           ? Colors.white
            //           : Colors.black,
            //       size: 18.sp,
            //     ),
            //   ),
            // ],
          ),
          body: Column(
            children: [
//! This is a coustom widget that created by own.
              const AddTask(),
              SizedBox(height: 10.h),
//! This is a coustom widget that created by own.x
              const AddDateBar(),
              SizedBox(height: 20.h),
              const TaskTile(),
            ],
          ),
        );
      },
    );
  }
}
