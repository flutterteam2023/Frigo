import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frigo/constant/app_color.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key, required this.text, required this.hintText, required this.keyboardType, required this.obscureText, required this.controller, this.minLines, this.maxLines, this.onTap, this.validator, this.inputFormatters,
  });
  final String text;
  final String hintText;
  final TextInputType keyboardType;
  final bool? obscureText;
  final TextEditingController controller;
  final int? minLines;
  final int?maxLines;
  final void Function()? onTap;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text,
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: const Color(AppColors.textLightColor),
          fontFamily: 'OpenSans'
        ),
        ),
        SizedBox(height: 8.h,),
        TextFormField(
          inputFormatters: inputFormatters,
          validator:validator ,
          minLines:minLines,
          maxLines: maxLines??1,
          controller: controller,
          obscureText:obscureText!=null? obscureText!:false,
          keyboardType: keyboardType,
          
          
          cursorColor: const Color(AppColors.primaryColor),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            suffixIcon:obscureText!=null? Bounceable(
              onTap: onTap??(){},
              child: Icon(
             obscureText==true?   Icons.visibility_off_outlined:Icons.visibility_outlined,
              color: const Color(0xff858585),
                size: 16.r,
              ),
            
            ) :null,
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: const Color(AppColors.textLightColor),
              fontFamily: 'OpenSans'
            ),
            
            border: OutlineInputBorder(
              
              borderRadius: BorderRadius.circular(30.r),
              borderSide: BorderSide(
                color: const Color(AppColors.borderColor),
                width: 1.w
              )
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.r),
              borderSide: BorderSide(
                color: const Color(AppColors.borderColor),
                width: 1.w
              )
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.r),
              borderSide: BorderSide(
                color: const Color(AppColors.borderColor),
                width: 1.w
              )
            ),
          ),
        ),
      ],
    );
  }
}