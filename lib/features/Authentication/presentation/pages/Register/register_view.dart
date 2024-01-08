import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frigo/commonWidgets/auth_text_field.dart';
import 'package:frigo/commonWidgets/custom_filled_button.dart';
import 'package:frigo/constant/app_color.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
@RoutePage()
class RegisterView extends HookConsumerWidget {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    return Scaffold(
      backgroundColor: const Color(AppColors.scaffolColor),

      appBar: AppBar(
        centerTitle: false,
        title: Text('Kayıt Ol',
        style: TextStyle(
          fontSize: 24.sp,
          fontWeight: FontWeight.w600,
          color: const Color(AppColors.textColor),
          fontFamily: 'OpenSans'
        ),
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.only(top: 16.h, left: 16.w, right: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Frig vadisini keşfetmek için kayıt ol',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(AppColors.textColor),
                  fontFamily: 'OpenSans'
                ),
                ),
                SizedBox(height: 40.h,),
                AuthTextField(
                  controller:emailController ,
                  text: 'E-Posta Adresi',
                  hintText: 'user@example.com',
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false,
                ),
                SizedBox(height: 24.h,),
                AuthTextField(
                  controller: passwordController ,
                  text: 'Şifre',
                  hintText: '********',
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                ),
                SizedBox(height: 32.h,),
                RichText(
                  text: TextSpan(
                    text: 'Kayıt olma işlemini gerçekleştirerek ',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(AppColors.textLightColor),
                      fontFamily: 'OpenSans'
                    ),
                    children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()..onTap = (){
                          print('Şifremi unuttum tıklandı');
                        },
                        text: 'Kullanıcı Sözleşmesini ',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(AppColors.primaryColor),
                          fontFamily: 'OpenSans',
                          
                          
                        ),
                      ),
                      TextSpan(
                        text: 'kabul etmiş olursun. ',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(AppColors.textLightColor),
                          fontFamily: 'OpenSans'
                        ),
                      ),
                    ]
                  ),
                
                
                ),
                SizedBox(height: 48.h,),
                CustomFilledButton(text: 'Kayıt Ol', onTap: (){}),
                
                
              ],
            ),
          Center(
            child: Padding(
              padding:  EdgeInsets.only(bottom: 57.h),
              child: RichText(
                      text: TextSpan(
                        text: 'Zaten bir hesabın var mı? ',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(AppColors.textLightColor),
                          fontFamily: 'OpenSans'
                        ),
                        children: [
                          TextSpan(
                            recognizer: TapGestureRecognizer()..onTap = (){
                              print('Kayıt ol tıklandı');
                            },
                            text: 'Giriş Yap',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: const Color(AppColors.primaryColor),
                              fontFamily: 'OpenSans',
                              
                              
                            ),
                          )
                        ]
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