import 'package:daly_task_app/providers/pickerdate_provider.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../providers/themeprovider.dart';

class AddDateBar extends StatelessWidget {
  const AddDateBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    // DateTime seletedTime = DateTime.now();
    return Consumer<DateProvider>(builder: (context, value, child) {
      return Container(
        margin: EdgeInsets.only(top: 10.h, left: 15.w),
        child: DatePicker(
          DateTime.now(),
          initialSelectedDate: value.selectedDate,
          selectionColor: primaryClr,
          selectedTextColor: whiteClr,
          height: 85.h,
          width: 65.w,
          dateTextStyle: GoogleFonts.lato(
            textStyle: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            ),
          ),
          dayTextStyle: GoogleFonts.lato(
            textStyle: TextStyle(
              fontSize: 11.sp,
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            ),
          ),
          monthTextStyle: GoogleFonts.lato(
            textStyle: TextStyle(
              fontSize: 9.sp,
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            ),
          ),
          onDateChange: (date) {
            value.updateSelectedDate(date);
          },
        ),
      );
    });
  }
}
