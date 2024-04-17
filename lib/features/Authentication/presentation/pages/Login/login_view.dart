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
class LoginView extends HookConsumerWidget {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authProvider);
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final _formKey = GlobalKey<FormState>();
    final isobscure = useState(true);

    return Scaffold(
      backgroundColor: const Color(AppColors.scaffolColor),
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Giriş Yap',
          style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
              color: const Color(AppColors.textColor),
              fontFamily: 'OpenSans'),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 16.h, left: 16.w, right: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Kullanıcı bilgilerini girerek Frig vadisini keşfetmeye başla.',
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(AppColors.textColor),
                        fontFamily: 'OpenSans'),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        AuthTextField(
                          validator: (p0) {
                            if (p0!.isEmpty) {
                              return 'E-Posta Adresi Boş Bırakılamaz';
                            }
                            if (!p0.contains('@')) {
                              return 'Geçerli bir E-Posta Adresi Giriniz';
                            }
                            return null;
                          },
                          controller: emailController,
                          text: 'E-Posta Adresi',
                          hintText: 'user@example.com',
                          keyboardType: TextInputType.emailAddress,
                          obscureText: null,
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        AuthTextField(
                          validator: (p0) {
                            if (p0!.isEmpty) {
                              return 'Şifre Boş Bırakılamaz';
                            }
                            if (p0.length < 6) {
                              return 'Şifre en az 6 karakter olmalıdır';
                            }
                            return null;
                          },
                          onTap: () {
                            isobscure.value = !isobscure.value;
                          },
                          controller: passwordController,
                          text: 'Şifre',
                          hintText: '********',
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: isobscure.value,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Bounceable(
                      onTap: () {
                        context.pushRoute(const ForgotPasswordRoute());
                        print('Şifremi unuttum tıklandı');
                      },
                      child: Text(
                        'Şifreni mi unuttun?',
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(AppColors.primaryColor),
                            fontFamily: 'OpenSans'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 48.h,
                  ),
                  state.isLoading == false
                      ? CustomFilledButton(
                          text: 'Giriş Yap',
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              ref
                                  .read(authProvider.notifier)
                                  .loginUser(emailController.text, passwordController.text, context);
                            }
                          })
                      : const Center(
                          child: CircularProgressIndicator(
                          color: Color(AppColors.primaryColor),
                        )),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 57.h),
                  child: RichText(
                    text: TextSpan(
                        text: 'Bir hesabın yok mu? ',
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(AppColors.textLightColor),
                            fontFamily: 'OpenSans'),
                        children: [
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                context.pushRoute(const RegisterRoute());
                                print('Kayıt ol tıklandı');
                              },
                            text: 'Kayıt Ol',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: const Color(AppColors.primaryColor),
                              fontFamily: 'OpenSans',
                            ),
                          )
                        ]),
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
