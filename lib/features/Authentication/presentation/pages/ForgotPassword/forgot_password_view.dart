import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frigo/commonWidgets/auth_text_field.dart';
import 'package:frigo/commonWidgets/custom_filled_button.dart';
import 'package:frigo/constant/app_color.dart';
import 'package:frigo/router/app_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class ForgotPasswordView extends HookConsumerWidget {
  const ForgotPasswordView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    return Scaffold(
      backgroundColor: const Color(AppColors.scaffolColor),
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Şifremi Unuttum',
          style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
              color: const Color(AppColors.textColor),
              fontFamily: 'OpenSans'),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 16.h, left: 16.w, right: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Şifre değiştirme işlemi için kayıtlı E-posta adresini doğrula',
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(AppColors.textColor),
                      fontFamily: 'OpenSans'),
                ),
                SizedBox(
                  height: 40.h,
                ),
                AuthTextField(
                  controller: emailController,
                  text: 'E-Posta Adresi',
                  hintText: 'user@example.com',
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false,
                ),
                SizedBox(
                  height: 24.h,
                ),
                
                CustomFilledButton(text: 'Doğrulama Kodu Gönder', onTap: () {
                  context.router.push(const SecturityVerifyRoute());
                }),
                SizedBox(
                  height: 24.h,
                ),
                Center(
                  child: Bounceable(
                    onTap: () {},
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
            
          ],
        ),
      ),
    );
  }
}
