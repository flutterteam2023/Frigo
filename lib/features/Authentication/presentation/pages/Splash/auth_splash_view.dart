import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frigo/commonWidgets/custom_filled_button.dart';
import 'package:frigo/constant/app_color.dart';
import 'package:frigo/router/app_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class AuthSplashView extends ConsumerWidget {
  const AuthSplashView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            ColorFiltered(
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5), // Karartma seviyesini ve rengini ayarlayabilirsiniz
                BlendMode.darken, // Karartma efekti
              ),
              child: Image.asset(
                'assets/images/ballon.png',
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.r, right: 16.r),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomFilledButton(
                    text: 'Kayıt Ol',
                    onTap: (){
                      context.pushRoute(const RegisterRoute());
                    },
                  ),
                  SizedBox(height: 24.h,),
                  CustomFilledButton(text: 'Giriş Yap', onTap: (){
                      context.pushRoute(const LoginRoute());
    
                  }),
                  SizedBox(height: 64.h,),
                  Bounceable(
                    onTap: (){
                      context.pushRoute(const CompanyApplicationProcessesRoute());
                    },
                    child: Text('İşletme başvurusu yapmak istiyorum',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(AppColors.primaryColor),
                      fontFamily: 'OpenSans'
                    ),
                    ),
                  ),
                  SizedBox(height: 55.h,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

