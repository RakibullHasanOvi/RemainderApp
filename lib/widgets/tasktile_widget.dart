import 'package:daly_task_app/providers/pickerdate_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../models/boxes.dart';
import '../models/task_model.dart';
import '../providers/task_provider.dart';
import '../providers/themeprovider.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DateProvider>(builder: (context, dateProvider, child) {
      return Consumer<ThemeProvider>(builder: (context, value, child) {
        return Consumer<TaskProvider>(
          builder: (context, taskProvider, _) {
            return Expanded(
              child: ListView.builder(
                itemCount: boxTasks.length,
                itemBuilder: (context, index) {
// ignore: unused_local_variable
                  Task getBox = boxTasks.getAt(index);

                  //? this function for color...
// ignore: no_leading_underscores_for_local_identifiers
                  _getBGClr(int no) {
                    switch (no) {
                      case 0:
                        return bluishClr;
                      case 1:
                        return pinkClr;
                      case 2:
                        return yellowClr;
                      default:
                        return primaryClr;
                    }
                  }

                  //?this is for datetime...
                  DateTime? date = getBox.date;
                  String formattedDate = DateFormat.yMd().format(date!);
                  print(getBox.repeat);
                  print(formattedDate);
                  print(getBox.startTime);
                  print(getBox.endTime);
                  print(getBox.reminder);

//! Now this logic is Card repeat show daily then this one ...
                  if (getBox.repeat == "Daily") {
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      child: SlideAnimation(
                        verticalOffset: 50.0.h,
                        child: FadeInAnimation(
                          child: Padding(
                            padding: EdgeInsets.only(left: 15.w, right: 15.w),
                            // ignore: avoid_unnecessary_containers
                            child: GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(25.0.r)),
                                  ),
                                  elevation: 10,
                                  backgroundColor:
                                      value.getThemeType() == ThemeType.dark
                                          ? darkHeaderClr
                                          : whiteClr,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Container(
                                      padding: EdgeInsets.all(10.h),
                                      height: getBox.isCompleted == 1
                                          ? 175.h
                                          // MediaQuery.of(context).size.height *
                                          //     0.23.h
                                          : 230.h,
                                      // MediaQuery.of(context).size.height *
                                      //     0.275.h,
                                      width:
                                          MediaQuery.of(context).size.width.w,
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 5.h,
                                            width: 120.w,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8.r),
                                              color: value.getThemeType() ==
                                                      ThemeType.dark
                                                  ? Colors.grey[300]
                                                  : Colors.grey[600],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          const Spacer(),
                                          getBox.isCompleted == 1
                                              ? Container()
                                              //For completed..
                                              : _buttomSheetButton(
                                                  label: "Task Completed",
                                                  onTap: () {
                                                    // ignore: unrelated_type_equality_checks
                                                    if (value == true) {
                                                      taskProvider
                                                          .markAsCompleted(
                                                              getBox);
                                                    } else {
                                                      taskProvider
                                                          .markAsIncomplete(
                                                              getBox);
                                                    }
                                                    Navigator.of(context).pop();
                                                  },
                                                  clr: primaryClr,
                                                  context: context,
                                                ),
                                          SizedBox(height: 10.h),
                                          //For Delete..
                                          _buttomSheetButton(
                                            label: "Delete Task",
                                            onTap: () {
                                              taskProvider.deleteTask(getBox);
                                              Navigator.of(context).pop();
                                            },
                                            clr: pinkClr,
                                            context: context,
                                          ),
                                          SizedBox(height: 20.h),
                                          //For close....
                                          _buttomSheetButton(
                                            label: "Close",
                                            onTap: () {
                                              Navigator.of(context).pop();
                                            },
                                            clr: yellowClr,
                                            isClose: true,
                                            context: context,
                                          ),
                                          SizedBox(height: 10.h),
                                        ],
                                        //?
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(13.r),
                                  //set border radius more than 50% of height and width to make circle
                                ),
                                color: _getBGClr(
                                  int.parse(
                                    getBox.color.toString(),
                                  ),
                                ),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width.w,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            //? This container for the title..
                                            Container(
                                              margin: EdgeInsets.only(
                                                left: 8.w,
                                                top: 8.h,
                                                // right: 5.w,
                                              ),
                                              child: Text(
                                                getBox.title.toString(),
                                                style: value.labelStyle,
                                              ),
                                            ),

                                            //? This container for the date..
                                            Container(
                                              margin: EdgeInsets.only(
                                                top: 8.h,
                                                left: 8.w,
                                                // bottom: 5.h,
                                              ),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons
                                                        .calendar_month_outlined,
                                                    size: 25,
                                                    color:
                                                        value.getThemeType() ==
                                                                ThemeType.dark
                                                            ? Colors.white
                                                            : Colors.white,
                                                  ),
                                                  SizedBox(
                                                    width: 3.w,
                                                  ),
                                                  Text(
                                                    formattedDate,
                                                    style: value.dateTimeStyle,
                                                  ),
                                                  SizedBox(width: 20.w),
                                                  Container(
                                                    child: Text(
                                                      getBox.repeat.toString(),
                                                      style: value
                                                          .repeatAndRemainder,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            //? This container for the Starttime-Endtime..
                                            Container(
                                              margin: EdgeInsets.only(
                                                top: 5.h,
                                                left: 8.w,
                                                bottom: 5.h,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Icon(
                                                    Icons.alarm_sharp,
                                                    size: 25,
                                                    color:
                                                        value.getThemeType() ==
                                                                ThemeType.dark
                                                            ? whiteClr
                                                            : whiteClr,
                                                  ),
                                                  SizedBox(
                                                    width: 3.w,
                                                  ),
                                                  Text(
                                                    "${getBox.startTime} - ${getBox.endTime}",
                                                    style: value.dateTimeStyle,
                                                  ),
                                                  SizedBox(width: 20.w),
                                                  Container(
                                                    child: Text(
                                                      getBox.reminder
                                                          .toString(),
                                                      style: value
                                                          .repeatAndRemainder,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),

                                            //? This container for the note..
                                            Container(
                                              margin: EdgeInsets.only(
                                                left: 8.w,
                                                bottom: 10.h,
                                                // right: 5.w,
                                              ),
                                              child: Text(
                                                getBox.note.toString(),
                                                style: value.noteStyle,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: 70.h,
                                        width: 0.9.w,
                                        color:
                                            Colors.grey[200]!.withOpacity(0.7),
                                      ),
                                      RotatedBox(
                                        quarterTurns: 3,
                                        child: Container(
                                          // padding: EdgeInsets.all(0),
                                          margin: EdgeInsets.only(bottom: 10.h),
                                          child: Text(
                                            getBox.isCompleted == 1
                                                ? "COMPLETED"
                                                : "TODO",
                                            style: GoogleFonts.lato(
                                              textStyle: TextStyle(
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                  // ignore: unrelated_type_equality_checks
//! Now this logic is Card Date show currentdate then this one ...
                  if (formattedDate == dateProvider.getFormattedDate()) {
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      child: SlideAnimation(
                        verticalOffset: 50.0.h,
                        child: FadeInAnimation(
                          child: Padding(
                            padding: EdgeInsets.only(left: 15.w, right: 15.w),
                            // ignore: avoid_unnecessary_containers
                            child: GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(25.0.r)),
                                  ),
                                  elevation: 10,
                                  backgroundColor:
                                      value.getThemeType() == ThemeType.dark
                                          ? darkHeaderClr
                                          : whiteClr,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Container(
                                      padding: EdgeInsets.all(10.h),
                                      height: getBox.isCompleted == 1
                                          ? 175.h
                                          // MediaQuery.of(context).size.height *
                                          //     0.22.h
                                          : 230.h,
                                      // MediaQuery.of(context).size.height *
                                      //     0.275.h,
                                      width: MediaQuery.of(context).size.width,
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 5.h,
                                            width: 120.w,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8.r),
                                              color: value.getThemeType() ==
                                                      ThemeType.dark
                                                  ? Colors.grey[300]
                                                  : Colors.grey[600],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20.h,
                                          ),
                                          const Spacer(),
//! Showbuttomsheet and buttom coustomize...
                                          getBox.isCompleted == 1
                                              ? Container()
//!For completed..
                                              : _buttomSheetButton(
                                                  label: "Task Completed",
                                                  onTap: () {
                                                    // ignore: unrelated_type_equality_checks
                                                    if (value == true) {
                                                      taskProvider
                                                          .markAsCompleted(
                                                              getBox);
                                                    } else {
                                                      taskProvider
                                                          .markAsIncomplete(
                                                              getBox);
                                                    }
                                                    Navigator.of(context).pop();
                                                  },
                                                  clr: primaryClr,
                                                  context: context,
                                                ),
                                          SizedBox(height: 10.h),
//!For Delete..
                                          _buttomSheetButton(
                                            label: "Delete Task",
                                            onTap: () {
                                              taskProvider.deleteTask(getBox);
                                              Navigator.of(context).pop();
                                            },
                                            clr: pinkClr,
                                            context: context,
                                          ),
                                          SizedBox(height: 20.h),
//!For close....
                                          _buttomSheetButton(
                                            label: "Close",
                                            onTap: () {
                                              Navigator.of(context).pop();
                                            },
                                            clr: yellowClr,
                                            isClose: true,
                                            context: context,
                                          ),
                                          SizedBox(height: 10.h),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
//!here is a card design detailes.
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(13.r),
                                  //set border radius more than 50% of height and width to make circle
                                ),
                                color: _getBGClr(
                                  int.parse(
                                    getBox.color.toString(),
                                  ),
                                ),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width.w,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            //? This container for the title..
                                            Container(
                                              margin: EdgeInsets.only(
                                                left: 8.w,
                                                top: 8.h,
                                                // right: 5.w,
                                              ),
                                              child: Text(
                                                getBox.title.toString(),
                                                style: value.labelStyle,
                                              ),
                                            ),

                                            //? This container for the date..
                                            Container(
                                              margin: EdgeInsets.only(
                                                top: 8.h,
                                                left: 8.w,
                                                // bottom: 5.h,
                                              ),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons
                                                        .calendar_month_outlined,
                                                    size: 25,
                                                    color:
                                                        value.getThemeType() ==
                                                                ThemeType.dark
                                                            ? Colors.white
                                                            : Colors.white,
                                                  ),
                                                  SizedBox(
                                                    width: 3.w,
                                                  ),
                                                  Text(
                                                    formattedDate,
                                                    style: value.dateTimeStyle,
                                                  ),
                                                  SizedBox(width: 20.w),
                                                  Container(
                                                    child: Text(
                                                      getBox.repeat.toString(),
                                                      style: value
                                                          .repeatAndRemainder,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            //? This container for the Starttime-Endtime..
                                            Container(
                                              margin: EdgeInsets.only(
                                                top: 5.h,
                                                left: 8.w,
                                                bottom: 5.h,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Icon(
                                                    Icons.alarm_sharp,
                                                    size: 25,
                                                    color:
                                                        value.getThemeType() ==
                                                                ThemeType.dark
                                                            ? whiteClr
                                                            : whiteClr,
                                                  ),
                                                  SizedBox(
                                                    width: 3.w,
                                                  ),
                                                  Text(
                                                    "${getBox.startTime} - ${getBox.endTime}",
                                                    style: value.dateTimeStyle,
                                                  ),
                                                  SizedBox(width: 20.w),
                                                  Container(
                                                    child: Text(
                                                      getBox.reminder
                                                          .toString(),
                                                      style: value
                                                          .repeatAndRemainder,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            //? This container for the note..
                                            Container(
                                              margin: EdgeInsets.only(
                                                left: 8.w,
                                                bottom: 10.h,
                                                // right: 5.w,
                                              ),
                                              child: Text(
                                                getBox.note.toString(),
                                                style: value.noteStyle,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: 70.h,
                                        width: 0.9.w,
                                        color:
                                            Colors.grey[200]!.withOpacity(0.7),
                                      ),
                                      RotatedBox(
                                        quarterTurns: 3,
                                        child: Container(
                                          // padding: EdgeInsets.all(0),
                                          margin: EdgeInsets.only(bottom: 10.h),
                                          child: Text(
                                            getBox.isCompleted == 1
                                                ? "COMPLETED"
                                                : "TODO",
                                            style: GoogleFonts.lato(
                                              textStyle: TextStyle(
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            );
          },
        );
      });
    });
  }
}

_buttomSheetButton({
  required String label,
  required Function()? onTap,
  required Color clr,
  bool isClose = false,
  required BuildContext context,
}) {
  final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.only(left: 15.w, right: 15.w),
      height: 45.h,
      width: MediaQuery.of(context).size.width.w,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.w,
          color: isClose == true
              ? themeProvider.getThemeType() == ThemeType.dark
                  ? Colors.grey[300]!
                  : Colors.grey[400]!
              : clr,
        ),
        borderRadius: BorderRadius.circular(
          20.r,
        ),
        color: isClose == true ? Colors.transparent : clr,
      ),
      child: Center(
        child: Text(
          label,
          style: isClose
              ? themeProvider.titleStyle
              : themeProvider.titleStyle.copyWith(
                  color: whiteClr,
                ),
        ),
      ),
    ),
  );
}
