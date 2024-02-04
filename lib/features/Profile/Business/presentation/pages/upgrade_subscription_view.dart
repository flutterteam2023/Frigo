import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frigo/commonWidgets/custom_filled_button.dart';
import 'package:frigo/constant/app_color.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
@RoutePage()
class UpgradeSubscriptionView extends StatefulHookConsumerWidget {
  const UpgradeSubscriptionView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UpgradeSubscriptionViewState();
}
class _UpgradeSubscriptionViewState extends ConsumerState<UpgradeSubscriptionView> {
    int? selectedOption = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(AppColors.scaffolColor),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: false,
        title: Text(
          'Aboneliği Yükselt',
          style: TextStyle(fontFamily: 'OpenSans', fontSize: 24.sp, fontWeight: FontWeight.w600,
          color: const Color(AppColors.textColor)
          ),
        ),
        
      ),
      body: Padding(
        padding:  EdgeInsets.only(top: 32.h, left: 16.w, right: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Aktif Abonelik',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff666666)
                ),
                ),
                Text('Aylık',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black
                ),
                )
              ],
            ),
            SizedBox(height: 40.h),
            Text('Yükseltmek İstediğiniz Abonelik Türü',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: const Color(0xff123740)
            ),
            ),
            SizedBox(height: 33.h),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Aylık/',
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'OpenSans',
                            color: Color(0xff123740)),
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Text(
                        '99,90₺',
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'OpenSans',
                            color: Color(0xff123740)),
                      )
                    ],
                  ),
                  Radio(
                    activeColor: const Color(AppColors.primaryColor),
                    fillColor: MaterialStateProperty.all(const Color(AppColors.primaryColor)),
                    value: 1,
                    groupValue: selectedOption,
                    onChanged: (value) {
                      setState(() {
                        selectedOption = value;
                      });
                    },
                  )
                ],
              ),
              SizedBox(
                height: 25.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Yıllık/',
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'OpenSans',
                            color: Color(0xff123740)),
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Text(
                        '1000,00₺',
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'OpenSans',
                            color: Color(0xff123740)),
                      )
                    ],
                  ),
                  Radio(
                    activeColor: const Color(AppColors.primaryColor),
                    fillColor: MaterialStateProperty.all(const Color(AppColors.primaryColor)),
                    value: 2,
                    groupValue: selectedOption,
                    onChanged: (value) {
                      setState(() {
                        selectedOption = value;
                      });
                    },
                  )
                ],
              ),
              SizedBox(
                height: 48.h,
              ),
              CustomFilledButton(text: 'Devam Et ve Yükselt', onTap: (){})
            
          ],
        ),
      ),
    );
  }
}