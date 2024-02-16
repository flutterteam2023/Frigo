import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frigo/constant/app_color.dart';
import 'package:frigo/router/app_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
@RoutePage()
class CompanyTypeSelectView extends ConsumerWidget {
  const CompanyTypeSelectView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<String> companyTypes = [
      'Konaklama',
      'Yeme-İçme',
      'Eğlence',
    ];
    return Scaffold(
      backgroundColor: const Color(AppColors.scaffolColor),
      appBar: AppBar(
        centerTitle: false,
        title: Text('İşletme Türü Seçiniz',
        style: TextStyle(
          fontSize: 24.sp,
          fontWeight: FontWeight.w600,
          color: const Color(AppColors.textColor),
          fontFamily: 'OpenSans'
        ),
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.only(top: 32.h,left: 16.w,right: 16.w),
        child: ListView.builder(
          itemCount: companyTypes.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:  EdgeInsets.only(bottom: 16.h),
              child: Bounceable(
                onTap: (){
                  context.pushRoute(const CompanyMakeApplicationRoute());
                },
                child: Container(
                  height: 56.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xff000000).withOpacity(0.08),
                        blurRadius: 16.r,
                        offset: Offset(0, 4.h),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 24.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(companyTypes[index],
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(AppColors.textColor),
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
              ),
            );
          },
        )
      ),
    );
  }
}