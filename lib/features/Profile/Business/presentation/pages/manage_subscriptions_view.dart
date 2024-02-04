import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frigo/commonWidgets/custom_filled_button.dart';
import 'package:frigo/constant/app_color.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
@RoutePage()
class ManageSubscriptionsView extends ConsumerWidget {
  const ManageSubscriptionsView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color(AppColors.scaffolColor),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('Abonelikleri Yönet',
        style: TextStyle(
          fontSize: 24.sp,
          fontWeight: FontWeight.w600,
          fontFamily: 'OpenSans',
          color: const Color(AppColors.textColor),
        ),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding:  EdgeInsets.only(top: 24.h, left: 16.w, right: 16.w),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromRGBO(0, 0, 0, 0.1),
                    blurRadius: 10.r,
                    offset: const Offset(0, 2),
                  )
                ]
              ),
              child: Padding(
                padding:  EdgeInsets.only(left: 14.w,
                right: 14.w,top: 16.h,bottom: 24.h),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Aylık abonelik',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'OpenSans',
                        ),
                        ),
                        Text('99,90₺',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'OpenSans',
                          color: const Color(AppColors.textLightColor),
              
                        ),
                        )
              
                      ],
                    ),
                    SizedBox(height: 25.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Başlangıç Tarihi',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'OpenSans',
                        ),
                        ),
                        Text('01.12.2023',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'OpenSans',
                          color: const Color(AppColors.textLightColor),
              
                        ),
                        )
              
                      ],
                    ),
                    SizedBox(height: 19.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Bitiş Tarihi',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'OpenSans',
                        ),
                        ),
                        Text('01.01.2024',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'OpenSans',
                          color: const Color(AppColors.textLightColor),
              
                        ),
                        )
              
                      ],
                    ),
                    SizedBox(height: 42.h,),
                    CustomFilledButton(text: 'Aboneliği Yükselt', onTap: (){}),
                    SizedBox(height: 24.h,),
                    Bounceable(
                      onTap: ()async{
                        return showDialog(context: context,
                        builder: (context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                            backgroundColor: Colors.white,
                            
                           
                           content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset('assets/svg/warning-outline.svg'),
                              SizedBox(height: 16.h,),
                              Text('Abonelik İptal Ediliyor!',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'OpenSans',
                                color: const Color(AppColors.errorColor),
                              ),
                              ),
                              SizedBox(height: 16.h,),
                              Text('Frig-o işletme aboneliği iptal etmek istediğine emin misin?',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'OpenSans',
                                color: const Color(0xff666666),
                              ),
                              ),
                              SizedBox(height: 33.h,),
                              Bounceable(
                                onTap: () {
                                  
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    border: Border.all(
                                      color: const Color(AppColors.errorColor),
                                      width: 1
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Padding(
                                        padding:  EdgeInsets.only(top:12.h, bottom: 12.h),
                                        child: Text('Evet, İptal Et',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'OpenSans',
                                          color: const Color(AppColors.errorColor),
                                        ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 16.h,),
                               Bounceable(
                                onTap: () {
                                  Navigator.pop(context);
                                
                                },
                                 child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    color: const Color(AppColors.errorColor),
                                   
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Padding(
                                        padding:  EdgeInsets.only(top:12.h, bottom: 12.h),
                                        child: Text('Hayır, İptal Etme',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'OpenSans',
                                          color: Colors.white
                                        ),
                                        ),
                                      ),
                                    ),
                                  ),
                                                             ),
                               ),
                              

                            ],
                           ),
                          );
                        },
                        );

                      },
                      child: Text('Aboneliği sonlandır',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'OpenSans',
                        color: const Color(AppColors.primaryColor),
                      ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}