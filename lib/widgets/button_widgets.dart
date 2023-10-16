import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../providers/themeprovider.dart';

class ButtonWidgets extends StatelessWidget {
  final String label;
  final Function()? onTap;
  const ButtonWidgets({super.key, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80.w,
        height: 40.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: primaryClr,
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              color: whiteClr,
            ),
          ),
        ),
      ),
    );
  }
}
