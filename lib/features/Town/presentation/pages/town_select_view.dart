import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frigo/constant/app_color.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
@RoutePage()
class TownSelectView extends HookConsumerWidget {
  const TownSelectView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color(AppColors.scaffolColor),
      appBar:AppBar(
        centerTitle: false,
        title: Text('Belde Seçiniz',
        style: TextStyle(
          fontSize: 24.sp,
          fontWeight: FontWeight.w600,
          color: const Color(AppColors.textColor),
          fontFamily: 'OpenSans'
        ),
        ),
      ) ,
      body: Padding(
        padding:  EdgeInsets.only(top: 12.h, left: 16.w, right: 16.w),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding:  EdgeInsets.only(top: 12.h),
              child: Bounceable(
                onTap: (){},
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Colors.white
                  ),
                  child: Padding(
                    padding:  EdgeInsets.symmetric(vertical: 16.h,horizontal: 24.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Lorem',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(AppColors.textColor,),
                          fontFamily: 'OpenSans'
                        ),
                        ),
                        Text('Seç',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(AppColors.primaryColor),
                          fontFamily: 'OpenSans'
                        ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      )
    );
  }
}