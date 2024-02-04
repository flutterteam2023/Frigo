import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frigo/commonWidgets/profile_info_button.dart';
import 'package:frigo/constant/app_color.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
@RoutePage()
class BusinessProfileView extends HookConsumerWidget {
  const BusinessProfileView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
   return Scaffold(
      backgroundColor: const Color(AppColors.scaffolColor),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: false,
        title: Text(
          'Profil',
          style: TextStyle(fontFamily: 'OpenSans', fontSize: 24.600.sp, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 33.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 80.r,
                  width: 80.r,
                  decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xffE6F0F2)),
                  child: Center(
                    child: Text(
                      'Ö',
                      style: TextStyle(
                        fontSize: 34.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(AppColors.primaryColor),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Center(
                child: Text(
                  'Örnek İşletme',
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                height: 32.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hesap',
                          style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(AppColors.textLightColor),
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        ProfileInfoButton(
                          title: 'Profil Ayarları',
                          onTap: () {},
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        ProfileInfoButton(
                          title: 'Güvenlik',
                          onTap: () {},
                        ),
                         SizedBox(
                          height: 16.h,
                        ),
                        ProfileInfoButton(
                          title: 'Abonelikleri Yönet',
                          onTap: () {},
                        ),
                        SizedBox(
                          height: 32.h,
                        ),
                        Text(
                          'Yasal',
                          style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(AppColors.textLightColor),
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        ProfileInfoButton(title: 'Kullanıcı Sözleşmesi', onTap: () {}),
                        SizedBox(
                          height: 16.h,
                        ),
                        ProfileInfoButton(title: 'Gizlilik Politikası', onTap: () {}),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
             

              Center(
                child: Bounceable(
                  onTap: () {
                    
                  },
                  child: Text('Çıkış Yap',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xffC85C0C),
                    fontFamily: 'OpenSans'
                  ),
                  ),
                ),
              ),
              SizedBox(height: 20.h,),
              Center(
                child: Text('Frig-o V1.0',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w300,
                  color: const Color(0xff858585),
                  fontFamily: 'OpenSans'
                ),  
                ),
              ),
              Center(
                child: Text('2023 Tüm hakları saklıdır.',
                style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w300,
                    color: const Color(0xff858585),
                    fontFamily: 'OpenSans'
                  ),
                ),
              ),
              SizedBox(height: 40.h,)
            ],
          ),
        ),
      ),
    );
  }
}