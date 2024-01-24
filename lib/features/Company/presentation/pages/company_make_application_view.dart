import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frigo/commonWidgets/custom_filled_button.dart';
import 'package:frigo/constant/app_color.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
@RoutePage()
class CompanyMakeApplicationView extends ConsumerWidget {
  const CompanyMakeApplicationView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color(AppColors.scaffolColor),
      appBar: AppBar(
        centerTitle: false,
        title: Text('İşletme Başvuru Yap',
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Abonelik Bilgileri',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black,
              fontFamily: 'OpenSans'
            ),
            ),
            SizedBox(height: 16.h,),
            const SubscriberInfo(
              subscriberTitle: 'Abonelik Türü',
              subscriberType: 'Aylık',
            
            ),
            SizedBox(height: 16.h,),
            const SubscriberInfo(
              subscriberTitle: 'Başlangıç Tarihi',
              subscriberType: '01.12.2023',
            
            ),
            SizedBox(height: 16.h,),
            const SubscriberInfo(
              subscriberTitle: 'Bitiş Tarihi',
              subscriberType: '01.01.2024',
            
            ),
            SizedBox(height: 24.h,),
            Text('Ödeme Özeti',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black,
              fontFamily: 'OpenSans'
            ),
            ),
            SizedBox(height: 16.h,),
            const SubscriberInfo(
              subscriberTitle: 'Abonelik Ücreti',
              subscriberType: '99,90₺',
            
            ),
            SizedBox(height: 16.h,),
            const SubscriberInfo(
              subscriberTitle: 'Toplam Tutar',
              subscriberType: '99,90₺',
            
            ),
            SizedBox(height: 48.h,),
            CustomFilledButton(text: 'Onayla ve Devam Et', onTap: (){}) ,
            SizedBox(height: 24.h,),
            Center(
              child: Bounceable(
                onTap: (){
                },
                child: Text('Vazgeç',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(AppColors.primaryColor),
                  fontFamily: 'OpenSans'
                
                ),
                ),
              ),
            )

          ],
        ),
      ),

    );
  }
}

class SubscriberInfo extends StatelessWidget {
  const SubscriberInfo({
    super.key, required this.subscriberType, required this.subscriberTitle,
  });
final String subscriberType;
final String subscriberTitle ;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(subscriberTitle,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color:  Colors.black,
          fontFamily: 'OpenSans'

        ),
        ),
        Text(subscriberType,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color:  const Color(AppColors.textLightColor),
          fontFamily: 'OpenSans'

        ),
        )
      ],
    );
  }
}