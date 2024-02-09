import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frigo/commonWidgets/custom_filled_button.dart';
import 'package:frigo/constant/app_color.dart';
import 'package:frigo/router/app_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:latlong2/latlong.dart';

@RoutePage()
class HomeView extends StatefulHookConsumerWidget {
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  List<String> filterList = [
    'Hepsi',
    'Gezilecek Yerler',
    'Yeme - İçme',
    'Konaklama',
  ];
  @override
  Widget build(BuildContext context) {
    final selectedfilter = useState(0);

    MapController mapController = MapController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(AppColors.primaryColor),
        toolbarHeight: 80.h,
        centerTitle: false,
        title: Text(
          'Logotype',
          style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w600, color: Colors.white, fontFamily: 'OpenSans'),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: Bounceable(
                onTap: () {}, child: SvgPicture.asset('assets/svg/settings-outline.svg', height: 24.r, width: 24.r)),
          )
        ],
      ),
      body: Stack(
        children: [
          FlutterMap(
            mapController: mapController,
            options: const MapOptions(
              initialCenter: LatLng(39.0891307, 30.4100159),
              initialZoom: 16,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    width: 100.0,
                    height: 150.0,
                    point: const LatLng(39.0891307, 30.4100159),
                    child: Bounceable(
                        onTap: () {
                          //bottomsheet açar map üzerindeki işletmeleri gösterir
                          CustomBottomSheet().infoBottomSheet(context);
                        },
                        child: Column(
                          children: [
                            Image.asset('assets/images/demo.jpeg'),
                            const Text(
                              'Oyma Kilise Ayazini',
                              textAlign: TextAlign.center,
                            )
                          ],
                        )),
                  ),
                  Marker(
                    width: 40.0,
                    height: 40.0,
                    point: const LatLng(39.089204, 30.418907),
                    child: Bounceable(
                        onTap: () {
                          //bottomsheet açar map üzerindeki işletmeleri gösterir
                          CustomBottomSheet().infoBottomSheet(context);
                        },
                        child: Container(
                          height: 40.r,
                          width: 40.r,
                          decoration: const BoxDecoration(color: Color(AppColors.errorColor), shape: BoxShape.circle),
                          child: SvgPicture.asset(
                            'assets/svg/bed-outline.svg',
                            fit: BoxFit.scaleDown,
                          ),
                        )),
                  ),
                  Marker(
                    width: 40.0,
                    height: 40.0,
                    point: const LatLng(39.087173, 30.417596),
                    child: Bounceable(
                        onTap: () {
                          //bottomsheet açar map üzerindeki işletmeleri gösterir
                          CustomBottomSheet().infoBottomSheet(context);
                        },
                        child: Container(
                          height: 40.r,
                          width: 40.r,
                          decoration: const BoxDecoration(color: Color(AppColors.primaryColor), shape: BoxShape.circle),
                          child: const Icon(
                            Icons.location_pin,
                            color: Colors.white,
                          ),
                        )),
                  ),
                ],
              ),
              const RichAttributionWidget(
                attributions: [
                  TextSourceAttribution(
                    'OpenStreetMap contributors',
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(16.0.r),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextField(
                    cursorColor: const Color(AppColors.primaryColor),
                    decoration: InputDecoration(
                      hintText: 'Konum ve işletme ara',
                      hintStyle:
                          TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, color: const Color(0xff666666)),
                      prefixIcon: const Icon(Icons.search, color: Color(AppColors.primaryColor)),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
                    ),
                  ),
                ),
                SizedBox(
                  width: 16.w,
                ),
                Bounceable(
                  onTap: () {
                    showModalBottomSheet(
                      enableDrag: true,
                      showDragHandle: true,
                      backgroundColor: const Color(AppColors.scaffolColor),
                      context: context,
                      builder: (context) {
                         return Padding(
                           padding:  EdgeInsets.only( left: 24.w, right: 24.w),
                           child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Bounceable(
                                onTap: () {
                                  context.pushRoute(const TownSelectRoute());
                                  
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.r)
                                                       
                                  ),
                                  child: Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: 12.w,vertical: 14.h),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('İhsaniye',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                          fontFamily: 'OpenSans'
                                        ),
                                        ),
                                        SvgPicture.asset('assets/svg/caret-forward-outline.svg')
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 48.h,
                              ),
                              CustomFilledButton(text: 'Filtrele ve Devam Et', onTap: (){}),
                              SizedBox(height: 32.h,)
                            ],
                         
                           ),
                         );
                      },
                    );
                  },
                  child: Container(
                    height: 48.r,
                    width: 48.r,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: SvgPicture.asset(
                      "assets/svg/filter-outline.svg",
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 40.h),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 37.h,
                child: ListView.builder(
                  itemCount: filterList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(right: index == filterList.length - 1 ? 16.w : 0),
                      child: Bounceable(
                        onTap: () {
                          selectedfilter.value = index;
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 16.w),
                          decoration: BoxDecoration(
                              color: selectedfilter.value == index ? const Color(0xff123740) : Colors.white,
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(
                                color: const Color(0xff123740),
                                width: 1,
                              )),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: Text(
                                filterList[index],
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: selectedfilter.value == index ? Colors.white : const Color(0xff123740),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomBottomSheet {
  void infoBottomSheet(BuildContext context) {
    showModalBottomSheet(
        enableDrag: true,
        showDragHandle: true,
        backgroundColor: Colors.white,
        context: context,
        builder: (context) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 45.h, left: 24.w, right: 24.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(5.r)),
                          child: Image.asset(
                            'assets/images/demo.jpeg',
                            width: 103.r,
                            height: 103.r,
                            fit: BoxFit.fill,
                          )),
                      SizedBox(
                        width: 14.w,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Örnek İşletme',
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontFamily: 'OpenSans'),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            'İhsaniye',
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff666666),
                                fontFamily: 'OpenSans'),
                          ),
                          SizedBox(height: 16.h),
                          Container(
                            decoration: BoxDecoration(
                                color: const Color(0xffE6F0F2), borderRadius: BorderRadius.circular(20.r)),
                            child: Padding(
                              padding: EdgeInsets.only(left: 12.w, right: 12.w, top: 5.h, bottom: 5.h),
                              child: Text(
                                'Yeme - İçme',
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff123740),
                                    fontFamily: 'OpenSans'),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  SizedBox(
                    height: 75.h,
                    child: ListView.builder(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(left: index == 0 ? 0 : 16.w),
                          child: SizedBox(
                              height: 75.r,
                              width: 75.r,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.all(Radius.circular(5.r)),
                                  child: Image.asset(
                                    'assets/images/demo.jpeg',
                                    fit: BoxFit.fill,
                                  ))),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore ',
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff666666),
                        fontFamily: 'OpenSans'),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset('assets/svg/call-outline.svg'),
                          SizedBox(
                            width: 17.w,
                          ),
                          Text(
                            '(+90) 123 456 78 91',
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff123740),
                                fontFamily: 'OpenSans'),
                          )
                        ],
                      ),
                      Bounceable(
                        onTap: () {},
                        child: Text(
                          'Ara',
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff30608A),
                              fontFamily: 'OpenSans'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 48.h,
                  ),
                  CustomFilledButton(text: 'Yol Tarifi Al', onTap: () {}),
                  SizedBox(
                    height: 48.h,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
