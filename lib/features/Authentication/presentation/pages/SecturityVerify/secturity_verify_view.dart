import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:frigo/commonWidgets/custom_filled_button.dart';
import 'package:frigo/constant/app_color.dart';
import 'package:frigo/router/app_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class SecturityVerifyView extends HookConsumerWidget {
  const SecturityVerifyView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    return Scaffold(
      backgroundColor: const Color(AppColors.scaffolColor),
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Güvenlik Doğrulaması',
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
                  'E-posta adresine gelen 6 haneli doğrulama kodunu girerek doğrulama işlemini tamamla',
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(AppColors.textColor),
                      fontFamily: 'OpenSans'),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Text(
                  'Doğrulama Kodu',
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(AppColors.textLightColor),
                      fontFamily: 'OpenSans'),
                ),
                SizedBox(
                  height: 8.h,
                ),
                VerificationCode(
                  margin: EdgeInsets.symmetric(horizontal:4.w),
                  underlineColor: const Color(AppColors.primaryColor),
                  cursorColor: const Color(AppColors.primaryColor),
                  
                  textStyle: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'OpenSans' ,
                    color: Colors.black,
                  ),
                  
                  fullBorder: true,
                  keyboardType: TextInputType.number,
                  length: 6,
                  onCompleted: (String value) {
                    print(value);
                  },
                  onEditing: (bool value) {
                    print(value);
                  },
                ),
                SizedBox(
                  height: 48.h,
                ),
                CustomFilledButton(text: 'Doğrulama Kodunu Onayla', onTap: () {
                  context.router.push(const SuccessRoute());
                }),
                SizedBox(
                  height: 24.h,
                ),
                Center(
                  child: Bounceable(
                    onTap: () {
                      context.router.pop();
                    },
                    child: Text(
                      'Vazgeç',
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(AppColors.primaryColor),
                          fontFamily: 'OpenSans'),
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
