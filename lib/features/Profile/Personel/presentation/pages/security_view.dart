import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frigo/commonWidgets/profile_info_button.dart';
import 'package:frigo/constant/app_color.dart';
@RoutePage()
class SecurityView extends StatelessWidget {
  const SecurityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(AppColors.scaffolColor),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: false,
        title: Text(
          'Güvenlik',
          style: TextStyle(fontFamily: 'OpenSans', fontSize: 24..sp, fontWeight: FontWeight.w600,color: const Color(AppColors.textColor)),
        ),
      ),
      body:Padding(
        padding:  EdgeInsets.only(top: 24..sp, left: 16.w, right: 16.w),
        child: ProfileInfoButton(title: 'Şifre Yenileme',onTap: (){},),
      ) ,
    );
  }
}