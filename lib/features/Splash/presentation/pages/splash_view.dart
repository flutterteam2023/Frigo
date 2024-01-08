import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frigo/constant/app_color.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
@RoutePage()
class SplashView extends ConsumerWidget {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return  Scaffold(
      backgroundColor: const Color(AppColors.primaryColor),
      body: Center(
        child: Text(
          'Logotype',
          style: TextStyle(
            fontSize: 34.sp,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontFamily: 'OpenSans'
          ),
        ),
      ),
    );
  }
}