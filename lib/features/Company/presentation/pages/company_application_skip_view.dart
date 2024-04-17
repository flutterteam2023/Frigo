import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frigo/commonWidgets/auth_text_field.dart';
import 'package:frigo/commonWidgets/custom_filled_button.dart';
import 'package:frigo/constant/app_color.dart';
import 'package:frigo/features/Authentication/presentation/providers/auth_notifier.dart';
import 'package:frigo/router/app_router.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:intl_phone_number_input/intl_phone_number_input.dart';

@RoutePage()
class CompanyApplicationSkipView extends StatefulHookConsumerWidget {
  const CompanyApplicationSkipView(this.email, this.password, {super.key});
  final String email;
  final String password;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CompanyApplicationSkipViewState();
}

class _CompanyApplicationSkipViewState extends ConsumerState<CompanyApplicationSkipView> {
  int? selectedOption = 0;
  String _latitude = '';
  String _longitude = '';
  final List<XFile> images = [];
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    getCurrentLocation();
    super.initState();
  }

  Future<void> getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        print("No permission, requesting one");
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.deniedForever) {
          return Future.error('Location Not Available');
        }
      }
      print("Found permission to get location");
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      _latitude = position.latitude.toString();
      _longitude = position.longitude.toString();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    // PhoneNumber number = PhoneNumber(isoCode: 'TR');
    final isSwitched = useState(true);

    final companyNameController = useTextEditingController();
    final descriptionController = useTextEditingController();
    final phoneController = useTextEditingController();

    final businessType = useState('Konaklama');

    final formKey = GlobalKey<FormState>();
    final formkeyDescription = GlobalKey<FormState>();
    final formkeyCompanyName = GlobalKey<FormState>();
    final state = ref.watch(authProvider);

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
              Form(
                key: formkeyCompanyName,
                child: AuthTextField(
                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return 'İşletme ismi boş bırakılamaz';
                      }
                    },
                    text: 'İşletme İsmi',
                    hintText: 'Örnek İşletme',
                    keyboardType: TextInputType.multiline,
                    obscureText: null,
                    controller: companyNameController),
              ),
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
                value: businessType.value,
                onChanged: (String? newValue) {
                  businessType.value = newValue!;
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
              Form(
                key: formkeyDescription,
                child: AuthTextField(
                  validator: (p0) {
                    if (p0!.isEmpty) {
                      return 'Açıklama boş bırakılamaz';
                    }
                  },
                  text: 'Açıklama',
                  hintText:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore ',
                  keyboardType: TextInputType.multiline,
                  obscureText: null,
                  controller: descriptionController,
                  minLines: 4,
                  maxLines: 100,
                ),
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
              Form(
                key: formKey,
                child: AuthTextField(
                  validator: (p0) {
                    if (p0!.isEmpty) {
                      return 'Telefon numarası boş bırakılamaz';
                    }
                  },
                  text: 'Telefon Numarası',
                  hintText: '534 000 00 00',
                  keyboardType: TextInputType.number,
                  obscureText: null,
                  controller: phoneController,
                ),
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
                    value: isSwitched.value,
                    onChanged: (value) {
                      isSwitched.value = value;
                    },
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
                onTap: () {
                  getCurrentLocation();
                },
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
                          _latitude == " " && _longitude == " "
                              ? 'Konum Paylaş'
                              : "Latitude: $_latitude \nLongitude: $_longitude",
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
                  itemCount: images.length + 1,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, mainAxisSpacing: 25.w, crossAxisSpacing: 32.h, childAspectRatio: 0.9),
                  itemBuilder: (context, index) {
                    return index != 0
                        ? Stack(
                            children: [
                              Container(
                                width: 102.r,
                                height: 102.r,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.r),
                                ),
                                child: Image.file(
                                  File(images[index - 1].path),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                right: 0,
                                top: 0,
                                child: Bounceable(
                                  onTap: () {
                                    setState(() {
                                      images.removeAt(index - 1);
                                    });
                                  },
                                  child: Container(
                                    width: 20.r,
                                    height: 20.r,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50.r),
                                    ),
                                    child: Center(
                                        child: Icon(
                                      Icons.close,
                                      size: 16.r,
                                      color: const Color(AppColors.primaryColor),
                                    )),
                                  ),
                                ),
                              )
                            ],
                          )
                        : Bounceable(
                            onTap: () {
                              final picker = ImagePicker().pickImage(source: ImageSource.gallery);
                              picker.then((value) {
                                if (value != null) {
                                  setState(() {
                                    images.add(value);
                                    print(images.length);
                                  });
                                }
                              });
                            },
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
           state.isLoading==false?   CustomFilledButton(
                  text: 'Başvur',
                  onTap: () async {
                    if (formKey.currentState!.validate() &&
                        formkeyDescription.currentState!.validate() &&
                        formkeyCompanyName.currentState!.validate() &&
                        selectedOption != null) {
                     
                      await ref.read(authProvider.notifier).registerBusiness(
                        widget.email,
                        widget.password,
                        images,
                       companyNameController.value.text,
                          businessType.value,
                          descriptionController.value.text,
                          phoneController.value.text,
                          isSwitched.value,
                          _latitude,
                          _longitude,
                          selectedOption!,
                          context
                      );
                      print('Başvuruldu');
                    } else {
                      print('Başvuru yapılamadı');
                    }
                    // return showDialog(
                    //   context: context,
                    //   builder: (context) {
                    //     return AlertDialog(
                    //       title: Text('Başvurunuz alınmıştır.'),
                    //       content: Text('Başvurunuz alınmıştır. En kısa sürede dönüş yapılacaktır.'),
                    //       actions: [
                    //         TextButton(
                    //             onPressed: () {
                    //               context.replaceRoute(const PersonelProfileRoute());
                    //             },
                    //             child: Text(
                    //               'Tamam',
                    //               style: TextStyle(
                    //                   fontSize: 14.sp,
                    //                   fontWeight: FontWeight.w600,
                    //                   color: const Color(AppColors.primaryColor),
                    //                   fontFamily: 'OpenSans'),
                    //             ))
                    //       ],
                    //     );
                    //   },
                    // );
                  }):const Center(
                    child: CircularProgressIndicator(color: Color(AppColors.primaryColor),),
                  
                  ),
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
