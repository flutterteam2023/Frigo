import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frigo/constant/app_color.dart';
import 'package:frigo/features/Authentication/presentation/pages/Splash/auth_splash_view.dart';
import 'package:frigo/router/app_router.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class EasySplashView extends ConsumerWidget {
  const EasySplashView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    FirebaseAuth auth = FirebaseAuth.instance;
    return Scaffold(
      body: FlutterSplashScreen.fadeIn(
        backgroundColor: const Color(AppColors.primaryColor),
        onEnd: () {
         if (auth.currentUser != null) {
            context.replaceRoute(const HomeRoute());
          
           
         } else {
            context.replaceRoute(const AuthSplashRoute());
           
         }
        },
        asyncNavigationCallback: () async {
          debugPrint('Async Navigation Callback');
          await Future.delayed(const Duration(seconds: 3), () {
            debugPrint('Async Navigation Callback');
          });
        },
        childWidget: Image.asset(
          'assets/images/splash.png',
          fit: BoxFit.fill,
          width:double.infinity,
          height: double.infinity,
        ),
        onAnimationEnd: () {
          debugPrint('On Fade In End');
        },
        nextScreen: const AuthSplashView(),
      ),
    );
  }
}
