import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frigo/commonWidgets/auth_text_field.dart';
import 'package:frigo/commonWidgets/custom_filled_button.dart';
import 'package:frigo/constant/app_color.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class ProfileSettingsView extends StatefulHookConsumerWidget {
  const ProfileSettingsView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileSettingsViewState();
}

class _ProfileSettingsViewState extends ConsumerState<ProfileSettingsView> {
  String dropdownValue = 'Konaklama';

  @override
  Widget build(BuildContext context) {
    final descriptionController = useTextEditingController();

    final businessNameController = useTextEditingController();
    return Scaffold(
      backgroundColor: const Color(AppColors.scaffolColor),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Profil Ayarları',
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.w600,
            fontFamily: 'OpenSans',
            color: const Color(AppColors.textColor),
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 24.sp, left: 16.w, right: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AuthTextField(
                  text: 'İşletme İsmi',
                  hintText: 'Örnek İşletme',
                  keyboardType: TextInputType.multiline,
                  obscureText: false,
                  controller: businessNameController),
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
                                  ),
                                ],
                              ),
                            ),
                          );
                  },
                ),
              ),
              SizedBox(
                height: 48.h,
              ),
              CustomFilledButton(text: 'Bilgileri Güncelle', onTap: () {}),
              SizedBox(
                height: 71.h,)
            ],
          ),
        ),
      ),
    );
  }
}
