import 'package:daly_task_app/providers/themeprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class InputFeild extends StatelessWidget {
  final String title;
  final String hitn;
  final TextEditingController? controller;
  final Widget? widget;
  const InputFeild({
    super.key,
    required this.title,
    required this.hitn,
    this.controller,
    this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, value, _) {
      return Container(
        margin: EdgeInsets.only(top: 14.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: value.titleStyle),
            Container(
              margin: EdgeInsets.only(top: 8.0.h),
              padding: EdgeInsets.only(left: 10.w, right: 10.w),
              height: 42.h,
              width: MediaQuery.of(context).size.width.w,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0.w,
                  ),
                  borderRadius: BorderRadius.circular(10.r)),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      readOnly: widget == null ? false : true,
                      autofocus: false,
                      cursorColor: value.getThemeType() == ThemeType.dark
                          ? Colors.grey[100]
                          : Colors.grey[700],
                      controller: controller,
                      style: value.subTitleStyle,
                      decoration: InputDecoration(
                        hintText: hitn,
                        hintStyle: value.subTitleStyle,
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  widget == null
                      ? Container()
                      : Container(
                          child: widget,
                        ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
