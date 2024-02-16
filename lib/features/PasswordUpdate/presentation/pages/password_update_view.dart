import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frigo/commonWidgets/auth_text_field.dart';
import 'package:frigo/commonWidgets/custom_filled_button.dart';
import 'package:frigo/constant/app_color.dart';
import 'package:frigo/router/app_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
@RoutePage()
class PasswordUpdateView extends HookConsumerWidget {
  const PasswordUpdateView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final oldPasswordController = useTextEditingController(); 
    final newPasswordController = useTextEditingController();
    final newPasswordConfirmController = useTextEditingController();
    return Scaffold(
      backgroundColor: const Color(AppColors.scaffolColor),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: false,
        title: Text(
          'Şifre Yenileme',
          style: TextStyle(fontFamily: 'OpenSans', fontSize: 24.600.sp, fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.only(top: 40.sp, left: 16.w, right: 16.w),
        child: Column(
          children: [
            AuthTextField(text: 'Eski Şifre', hintText: '****************', keyboardType: TextInputType.multiline, obscureText: true, controller: oldPasswordController),
            SizedBox(height: 24.h),
            AuthTextField(text: 'Yeni Şifre Onayı', hintText: '****************', keyboardType: TextInputType.multiline, obscureText: true, controller: newPasswordController),
            SizedBox(height: 24.h),
            AuthTextField(text: 'Yeni Şifre Onayı', hintText: '****************', keyboardType: TextInputType.multiline, obscureText: true, controller: newPasswordConfirmController),
            SizedBox(height: 48.h),
            CustomFilledButton(text: 'Şifreyi Güncelle', onTap: (){
              context.pushRoute(const PasswordUpdateSuccesRoute());
            })

          ],
        ),
      ),
    );
  }
}