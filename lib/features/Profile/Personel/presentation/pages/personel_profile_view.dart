import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frigo/commonWidgets/profile_info_button.dart';
import 'package:frigo/constant/app_color.dart';
import 'package:frigo/features/Authentication/presentation/providers/auth_notifier.dart';
import 'package:frigo/features/User/provider/user_notifier.dart';
import 'package:frigo/router/app_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class PersonelProfileView extends HookConsumerWidget {
  const PersonelProfileView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authProvider);
    final profileState = ref.watch(userProvider);
    return Scaffold(
      backgroundColor: const Color(AppColors.scaffolColor),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.replaceRoute(const HomeRoute());
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: const Color(AppColors.primaryColor),
        ),
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
                      profileState.userModel!.name!.substring(0, 1).toUpperCase(),
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
                  profileState.userModel != null ? profileState.userModel!.name ?? '' : "",
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
                          title: 'Güvenlik',
                          onTap: () {
                            context.pushRoute(const SecurityRoute());
                          },
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
                        ProfileInfoButton(title: 'Kullanıcı Sözleşmesi', onTap: () {
                          context.pushRoute(const UserAgreementRoute());
                        }),
                        SizedBox(
                          height: 16.h,
                        ),
                        ProfileInfoButton(title: 'Gizlilik Politikası', onTap: () {
                          context.pushRoute(const PrivatePoliticaRoute());
                        }),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Bounceable(
                onTap: () {
                  ref.read(userProvider.notifier).businessApplication(context);
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 16.w, right: 16.w),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.r),
                        color: Colors.white,
                        border: Border.all(color: const Color(AppColors.primaryColor), width: 1.w)),
                    child: Padding(
                      padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                      child: Center(
                        child: Text(
                          'İşletme başvurusu yapmak istiyorum.',
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: const Color(AppColors.primaryColor),
                              fontFamily: 'OpenSans'),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              state.isLoading == false
                  ? Center(
                      child: Bounceable(
                        onTap: () {
                          ref.read(userProvider.notifier).signOut(context);
                        },
                        child: Text(
                          'Çıkış Yap',
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xffC85C0C),
                              fontFamily: 'OpenSans'),
                        ),
                      ),
                    )
                  : const Center(
                      child: CircularProgressIndicator(
                        color: Color(AppColors.primaryColor),
                      ),
                    ),
              SizedBox(
                height: 20.h,
              ),
              Center(
                child: Text(
                  'Frig-o V1.0',
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w300,
                      color: const Color(0xff858585),
                      fontFamily: 'OpenSans'),
                ),
              ),
              Center(
                child: Text(
                  '2023 Tüm hakları saklıdır.',
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w300,
                      color: const Color(0xff858585),
                      fontFamily: 'OpenSans'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
