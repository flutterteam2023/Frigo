import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frigo/commonWidgets/auth_text_field.dart';
import 'package:frigo/commonWidgets/custom_filled_button.dart';
import 'package:frigo/constant/app_color.dart';
import 'package:frigo/router/app_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:intl_phone_number_input/intl_phone_number_input.dart';

@RoutePage()
class CompanyApplicationSkipView extends StatefulHookConsumerWidget {
  const CompanyApplicationSkipView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CompanyApplicationSkipViewState();
}

class _CompanyApplicationSkipViewState extends ConsumerState<CompanyApplicationSkipView> {
  int? selectedOption = 0;

  @override
  Widget build(BuildContext context) {
    // PhoneNumber number = PhoneNumber(isoCode: 'TR');

    final companyNameController = useTextEditingController();
    final descriptionController = useTextEditingController();

    String dropdownValue = 'Konaklama';

    return Scaffold(
      backgroundColor: const Color(AppColors.scaffolColor),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
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
          padding: EdgeInsets.only(top: 32.h, left: 16.w, right: 16.w, bottom: 50.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'İşletme Bilgileri',
                style: TextStyle(
                    fontSize: 16.sp, fontWeight: FontWeight.w600, color: Colors.black, fontFamily: 'OpenSans'),
              ),
              SizedBox(
                height: 16.sp,
              ),
              AuthTextField(
                  text: 'İşletme İsmi',
                  hintText: 'Örnek İşletme',
                  keyboardType: TextInputType.multiline,
                  obscureText: false,
                  controller: companyNameController),
              SizedBox(
                height: 24.h,
              ),
              Text(
                'İşletme Türü',
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'OpenSans',
                    color: const Color(AppColors.textLightColor)),
              ),
              SizedBox(
                height: 5.h,
              ),
              DropdownButtonFormField(
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    //<-- SEE HERE
                    borderSide: BorderSide(
                      color: Color(AppColors.borderColor),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    //<-- SEE HERE
                    borderSide: BorderSide(
                      color: Color(AppColors.borderColor),
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                dropdownColor: Colors.white,
                value: dropdownValue,
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
                items:
                    <String>['Konaklama', 'Cafe', 'Restorant', 'Market'].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'OpenSans',
                          color: const Color(AppColors.textLightColor)),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(
                height: 24.h,
              ),
              AuthTextField(
                text: 'Açıklama',
                hintText:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore ',
                keyboardType: TextInputType.multiline,
                obscureText: false,
                controller: descriptionController,
                minLines: 4,
                maxLines: 100,
              ),
              SizedBox(
                height: 32.h,
              ),
              Text(
                'İletişim',
                style: TextStyle(
                    fontSize: 16.sp, fontWeight: FontWeight.w600, fontFamily: 'OpenSans', color: Colors.black),
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                'Telefon Numarası',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Rubik',
                  color: const Color(AppColors.textLightColor),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              // InternationalPhoneNumberInput(
              //   onInputChanged: (PhoneNumber numberValue) {
              //     print(number.phoneNumber);
              //     number = numberValue;
              //   },
              //   onInputValidated: (bool value) {
              //     print(value);
              //   },
              //   selectorConfig: const SelectorConfig(
              //     selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
              //   ),
              //   cursorColor: const Color(AppColors.primaryColor),
              //   selectorTextStyle: const TextStyle(color: Colors.black),
              //   initialValue: number,
              //   inputDecoration: InputDecoration(
              //     hintText: '534 000 00 00',
              //     hintStyle: TextStyle(
              //       fontSize: 14.sp,
              //       fontWeight: FontWeight.w400,
              //       fontFamily: 'Rubik',
              //       color: Colors.black,
              //     ),
              //     contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(5.r),
              //       borderSide: const BorderSide(color: Color(0xff858585)),
              //     ),
              //     enabledBorder: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(5.r),
              //       borderSide: const BorderSide(color: Color(0xff858585)),
              //     ),
              //     focusedBorder: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(5.r),
              //       borderSide: const BorderSide(color: Color(0xff858585)),
              //     ),
              //   ),
              //   keyboardType: const TextInputType.numberWithOptions(
              //     signed: true,
              //     decimal: true,
              //   ),
              //   inputBorder: const OutlineInputBorder(
              //     borderSide: BorderSide(color: Color(0xff858585)),
              //   ),
              //   onSaved: (PhoneNumber number) {
              //     print('On Saved: $number');
              //   },
              // ),
              SizedBox(
                height: 24.sp,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 281.w,
                    child: Text(
                      'Telefon numarasının görüntülenmesine izin veriyorum',
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(AppColors.textLightColor),
                          fontFamily: 'OpenSans'),
                    ),
                  ),
                  Switch(
                    value: true,
                    onChanged: (value) {},
                    activeColor: const Color(0xff30608A),
                  ),
                ],
              ),
              SizedBox(
                height: 32.h,
              ),
              Text(
                'Konum',
                style: TextStyle(
                    fontSize: 16.sp, fontWeight: FontWeight.w600, fontFamily: 'OpenSans', color: Colors.black),
              ),
              SizedBox(
                height: 17.h,
              ),
              Bounceable(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 33.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/svg/location-outline.svg'),
                        SizedBox(
                          width: 16.w,
                        ),
                        Text(
                          'Konum Paylaş',
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: const Color(AppColors.primaryColor),
                              fontFamily: 'OpenSans'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 32.h,
              ),
              Text(
                'Görsel',
                style: TextStyle(
                    fontSize: 16.sp, fontWeight: FontWeight.w600, color: Colors.black, fontFamily: 'OpenSans'),
              ),
              SizedBox(
                height: 16.h,
              ),
              SizedBox(
                height: 236.h,
                child: GridView.builder(
                  itemCount: 6,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, mainAxisSpacing: 25.w, crossAxisSpacing: 32.h, childAspectRatio: 0.9),
                  itemBuilder: (context, index) {
                    return index != 0
                        ? Container(
                            width: 102.r,
                            height: 102.r,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.r),
                                image: const DecorationImage(
                                    image: AssetImage('assets/images/demoImage.png'), fit: BoxFit.fill)),
                          )
                        : Bounceable(
                            onTap: () {},
                            child: Container(
                              width: 102.r,
                              height: 102.r,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.r),
                                  color: Colors.white,
                                  border: Border.all(color: Color(AppColors.primaryColor))),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset('assets/svg/images-outline.svg'),
                                  SizedBox(
                                    height: 16.h,
                                  ),
                                  Text(
                                    'Görsel ekle',
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(AppColors.primaryColor)),
                                  )
                                ],
                              ),
                            ),
                          );
                  },
                ),
              ),
              SizedBox(
                height: 32.h,
              ),
              Text(
                'Abonelik Zamanı',
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'OpenSans',
                    color: const Color(0xff123740)),
              ),
              SizedBox(
                height: 33.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Aylık/',
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'OpenSans',
                            color: const Color(0xff123740)),
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Text(
                        '99,90₺',
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'OpenSans',
                            color: const Color(0xff123740)),
                      )
                    ],
                  ),
                  Radio(
                    activeColor: const Color(AppColors.primaryColor),
                    fillColor: MaterialStateProperty.all(const Color(AppColors.primaryColor)),
                    value: 1,
                    groupValue: selectedOption,
                    onChanged: (value) {
                      setState(() {
                        selectedOption = value;
                      });
                    },
                  )
                ],
              ),
              SizedBox(
                height: 25.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Yıllık/',
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'OpenSans',
                            color: const Color(0xff123740)),
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Text(
                        '1000,00₺',
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'OpenSans',
                            color: const Color(0xff123740)),
                      )
                    ],
                  ),
                  Radio(
                    activeColor: const Color(AppColors.primaryColor),
                    fillColor: MaterialStateProperty.all(const Color(AppColors.primaryColor)),
                    value: 2,
                    groupValue: selectedOption,
                    onChanged: (value) {
                      setState(() {
                        selectedOption = value;
                      });
                    },
                  )
                ],
              ),
              SizedBox(
                height: 64.h,
              ),
              CustomFilledButton(text: 'Onayla ve Devam et', onTap: () {
                context.pushRoute(const CompanyTypeSelectRoute());
              }),
              SizedBox(
                height: 24.h,
              ),
              Center(
                child: Bounceable(
                  onTap: () {
                    context.replaceRoute(const AuthSplashRoute());
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
