import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frigo/commonWidgets/auth_text_field.dart';
import 'package:frigo/commonWidgets/custom_filled_button.dart';
import 'package:frigo/constant/app_color.dart';
import 'package:frigo/features/Authentication/presentation/providers/auth_notifier.dart';
import 'package:frigo/router/app_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class CompanyApplicationProcessesView extends HookConsumerWidget {
  const CompanyApplicationProcessesView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: const Color(AppColors.scaffolColor),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            context.replaceRoute(const AuthSplashRoute());
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: const Color(AppColors.textColor),
        ),
        centerTitle: false,
        title: Text(
          'İşletme Başvuru Yap',
          style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
              color: const Color(AppColors.textColor),
              fontFamily: 'OpenSans'),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 32.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'İşletme Üyelik Bilgileri',
                style:
                    TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: Colors.black, fontFamily: 'OpenSans'),
              ),
              SizedBox(
                height: 10.h,
              ),
             Form(
              key: formKey,
              child:Column(
              children: [
                 AuthTextField(
                  validator: (p0) {
                    if (p0!.isEmpty) {
                      return 'E-Posta Adresi Boş Bırakılamaz';
                    }
                  },
                text: 'E-Posta Adresi',
                hintText: 'user@example.com',
                keyboardType: TextInputType.emailAddress,
                obscureText: null,
                controller: emailController,
              ),
              SizedBox(
                height: 24.h,
              ),
              AuthTextField(
                validator: (p0) {
                  if (p0!.isEmpty) {
                    return 'Şifre alanı boş bırakılamaz';
                  }else if(p0.length<6){
                    return 'Şifre en az 6 karakter olmalıdır';
                  }
                },
                text: 'Şifre',
                hintText: '****************',
                keyboardType: TextInputType.multiline,
                obscureText: true,
                controller: passwordController,
              ),
              ],
             )),
              SizedBox(
                height: 32.h,
              ),
              RichText(
                text: TextSpan(
                    text: 'Kayıt olma işlemini gerçekleştirerek ',
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(AppColors.textLightColor),
                        fontFamily: 'OpenSans'),
                    children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
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
                            fontFamily: 'OpenSans'),
                      ),
                    ]),
              ),
              SizedBox(
                height: 48.h,
              ),
              CustomFilledButton(
                  text: 'Onayla ve Devam et',
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      ref.read(authProvider.notifier).membershipInformation(emailController.value.text, passwordController.value.text,context);
                      
                    }
                  }),
              SizedBox(
                height: 24.h,
              ),
              Center(
                child: Bounceable(
                  onTap: () {
                    context.replaceRoute(const AuthSplashRoute());
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
        ),
      ),
    );
  }
}
