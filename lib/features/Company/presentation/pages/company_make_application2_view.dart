import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frigo/commonWidgets/auth_text_field.dart';
import 'package:frigo/commonWidgets/custom_filled_button.dart';
import 'package:frigo/constant/app_color.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
@RoutePage()
class CompanyMakeApplication2View extends StatefulHookConsumerWidget {
  const CompanyMakeApplication2View({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CompanyMakeApplication2ViewState();
}
class _CompanyMakeApplication2ViewState extends ConsumerState<CompanyMakeApplication2View> {
  @override
  Widget build(BuildContext context) {
    final nameController = useTextEditingController();
    final cardNumberController = useTextEditingController();
    final cvvController = useTextEditingController();
    final dateController = useTextEditingController();
    return Scaffold(
      backgroundColor: const Color(AppColors.scaffolColor),
      appBar: AppBar(
        centerTitle: false,
        title: Text('İşletme Başvuru Yap',
        style: TextStyle(
          fontSize: 24.sp,
          fontWeight: FontWeight.w600,
          color: const Color(AppColors.textColor),
          fontFamily: 'OpenSans'
        ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.only(top: 32.h,left: 16.w,right: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Ödeme Bilgileri',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontFamily: 'OpenSans'
              ),
              ),
              SizedBox(height: 16.h,),
              AuthTextField(text: 'Kart Üzerindeki İsim', hintText: 'Lorem Ipsum', keyboardType: TextInputType.multiline, obscureText: false, controller: nameController),
              SizedBox(height: 24.h,),
              AuthTextField(text: 'Kart Numarası', hintText: '1234 5678 9012 3456', keyboardType: TextInputType.multiline, obscureText: false, controller: cardNumberController),
              SizedBox(height: 24.h,),
              AuthTextField(text: 'CVV', hintText: '123', keyboardType: TextInputType.number, obscureText: false, controller: cvvController),
              SizedBox(height: 24.h,),
              AuthTextField(text: 'Kartın Son Kullanılma Tarihi', hintText: '07/27', keyboardType: TextInputType.multiline, obscureText: false, controller: dateController),
              SizedBox(height: 48.h,),
              CustomFilledButton(text: 'Ödeme Yap', onTap: (){}),
              SizedBox(height: 24.h,),
              Center(
                child: Bounceable(
                  onTap: (){
                  },
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
        ),
      ),
    );
  }
}