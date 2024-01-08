import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frigo/commonWidgets/custom_filled_button.dart';
import 'package:frigo/constant/app_color.dart';
import 'package:frigo/router/app_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
@RoutePage()
class SuccessView extends ConsumerWidget {
  const SuccessView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color(AppColors.scaffolColor),
      body: WillPopScope(
        onWillPop:()async => false,
        child: Padding(
          padding:  EdgeInsets.only(left: 39.w, right: 39.w ,top: 127.h),
          child: Column(
            children: [
              SvgPicture.asset('assets/svg/check.svg'),
              SizedBox(height: 16.h,),
              Text('İşlem Başarılı!',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: const Color(AppColors.primaryColor),
                fontFamily: 'OpenSans'
              ),
              ),
              SizedBox(height: 16.h,),
      
              Text('Şifre değiştirme işlemi başarıyla gerçekleştirildi. Hesabına giriş yaparak tekrar keşfetmeye başlayabilirsin.',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: const Color(AppColors.textLightColor),
                fontFamily: 'OpenSans'
              ),
              textAlign: TextAlign.center,
              
              ),
              SizedBox(height: 48.h,),
              CustomFilledButton(text: 'Giriş Ekranına Dön', onTap: (){
                // bütün sayfaları kapatıp login sayfasına yönlendiriyoruz. Ama login sayfası geri gittiğinde splash screen'a yönlendiriyor.
                // bunu düzeltmek için splash screen'a yönlendirmek yerine login sayfasına yönlendireceğiz.
                context.router.popUntilRoot();
                context.pushRoute(const LoginRoute());
      
              })
            ],
          ),
        ),
      ),

    );
  }
}