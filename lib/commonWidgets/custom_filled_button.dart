import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frigo/constant/app_color.dart';

class CustomFilledButton extends StatelessWidget {
  const CustomFilledButton({
    super.key, required this.text, required this.onTap,
  });
  final String text;
  final void Function() onTap;


  @override
  Widget build(BuildContext context) {
    return Bounceable(
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.r),
            color: const Color(AppColors.primaryColor),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 16.h, bottom: 16.h),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontFamily: 'OpenSans'),
              ),
            ),
          )),
    );
  }
}
