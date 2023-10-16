import 'package:daly_task_app/providers/colorselet_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../providers/themeprovider.dart';

class SeClrWidget extends StatelessWidget {
  const SeClrWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Now you can save the task object
    return Consumer<SeletedClrProvider>(
      builder: (context, val5, child) {
        final selectedColor = val5.selectedColor;

        return Wrap(
          children: List<Widget>.generate(
            3,
            (int index) {
              return Padding(
                padding: EdgeInsets.only(right: 6.0.w),
                child: GestureDetector(
                  onTap: () {
                    val5.updateSelectedColor(index);
                  },
                  child: CircleAvatar(
                    radius: 14.r,
                    backgroundColor: index == 0
                        ? primaryClr
                        : index == 1
                            ? pinkClr
                            : yellowClr,
                    child: selectedColor == index
                        ? Icon(
                            Icons.done,
                            color: Colors.white,
                            size: 16.sp,
                          )
                        : Container(),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
