import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frigo/commonWidgets/custom_filled_button.dart';
import 'package:frigo/constant/app_color.dart';
import 'package:frigo/features/Home/model/place_model.dart';
import 'package:frigo/features/Home/presentation/providers/home_notifier.dart';
import 'package:frigo/features/User/provider/user_notifier.dart';
import 'package:frigo/router/app_router.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:multi_value_listenable_builder/multi_value_listenable_builder.dart';
import 'package:searchfield/searchfield.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:galleryimage/galleryimage.dart';
import 'package:url_launcher/url_launcher_string.dart';

@RoutePage()
class HomeView extends StatefulHookConsumerWidget {
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  List<String> filterList = [
    'Gezilecek Yerler',
    'Yeme - İçme',
    'Konaklama',
  ];
  final globalKey = GlobalKey();
  final double _latitude = 0;
  final double _longitude = 0;
  MapController mapController = MapController();
  final FocusNode _focusNode = FocusNode();

  // LatLng? _currentp = null;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        _focusNode.unfocus();
      }
    });
    // _getCurrentLocation();
  }

  void _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Konum servisleri açık değil, kullanıcıyı bilgilendirin.
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Konum izni reddedildi, kullanıcıyı bilgilendirin.
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Konum izni kalıcı olarak reddedildi, kullanıcıyı bilgilendirin.
      return;
    }

    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {});
  }

  void _launchMaps(double lat, double lng) async {
    final url = 'https://www.google.com/maps/dir/?api=1&destination=$lat,$lng';
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final selectedfilter = useState(0);
    final state = ref.watch(userProvider);
    final homestate = ref.watch(homeProvider);
    final centerLatLng = useState(const LatLng(39.08932110066504, 30.41971481061074));
    final zoom = useState(10.0);

    ref.watch(homeProvider);

    // ignore: deprecated_member_use
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.1,
        elevation: 1,
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: ValueListenableBuilder(
          valueListenable: selectedfilter,
          builder: (context, _, __) {
            return BottomNavigationBar(
              onTap: (value) {
                selectedfilter.value = value;
                if (selectedfilter.value == 0) {
                  ref.read(homeProvider.notifier).getPlace(const LatLng(0, 0)).then((value) {
                    mapController.move(const LatLng(39.08932110066504, 30.41971481061074), 10);
                  
                  });
                } else if (selectedfilter.value == 1) {
                  ref.read(homeProvider.notifier).getRestoran(const LatLng(0, 0)).then((value) {
                    mapController.move(const LatLng(39.08932110066504, 30.41971481061074), 10);
                  });
                } else if (selectedfilter.value == 2) {
                  ref.read(homeProvider.notifier).getCoffe(const LatLng(0, 0)).then((value) {
                    mapController.move(const LatLng(39.08932110066504, 30.41971481061074), 10);
                  });
                } else if (selectedfilter.value == 3) {
                  ref.read(homeProvider.notifier).getMarket(const LatLng(0, 0)).then((value) {
                    mapController.move(const LatLng(39.08932110066504, 30.41971481061074), 10);
                  });
                } else if (selectedfilter.value == 4) {
                  ref.read(homeProvider.notifier).getHotel(const LatLng(0, 0)).then((value) {
                    mapController.move(const LatLng(39.08932110066504, 30.41971481061074), 10);
                  });
                }
              },
              backgroundColor: Colors.white,
              selectedItemColor: const Color(AppColors.primaryColor),
              unselectedItemColor: const Color(0xff666666),
              currentIndex: selectedfilter.value,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.place),
                  label: 'Gezi Noktaları',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.restaurant),
                  label: 'Restoranlar',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.coffee),
                  label: 'Kafeler',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.store),
                  label: 'Marketler',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.hotel),
                  label: 'Konaklama',
                ),
              ],
            );
          }),
      body: Stack(
        children: [
          MultiValueListenableBuilder(
              valueListenables: [centerLatLng, zoom, selectedfilter],
              builder: (context, _, __) {
                return FlutterMap(
                  mapController: mapController,
                  options: MapOptions(
                    zoom: zoom.value,
                    // ignore: deprecated_member_use
                    center: centerLatLng.value,
                    // ignore: deprecated_member_use
                  ),
                  children: [
                    TileLayer(
                      retinaMode: true,
                      urlTemplate:
                          'https://api.mapbox.com/styles/v1/frig-o/clxs78rqk00py01qm70mjh2ur/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiZnJpZy1vIiwiYSI6ImNsdmwwdXUxcDIyaWQybG56OWFhMG03Z2kifQ.cX2N6q8HVKJw6E6k1oHWDQ',
                      additionalOptions: const {
                        'accessToken':
                            'pk.eyJ1IjoiZnJpZy1vIiwiYSI6ImNsdmwwdXUxcDIyaWQybG56OWFhMG03Z2kifQ.cX2N6q8HVKJw6E6k1oHWDQ',
                      },
                    ),
                    homestate.placeModels != null
                        ? MarkerClusterLayerWidget(
                            options: MarkerClusterLayerOptions(
                              maxClusterRadius: 120,
                              disableClusteringAtZoom: 14,
                              size: const Size(40, 40),
                              maxZoom: 14,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(50),
                              markers: List.generate(
                                homestate.placeModels!.length,
                                (index) {
                                  final place = homestate.placeModels![index];
                                  return Marker(
                                      width: place.businessType == null ? 120.r : 32.r,
                                      height: place.businessType == null ? 150.r : 32.r,
                                      point: LatLng(place.latitude!, place.longitude!),
                                      child: GestureDetector(
                                          onTap: () {
                                            CustomBottomSheet().infoBottomSheet(
                                                context,
                                                place.businessType ?? "place",
                                                place.name!,
                                                place.image!,
                                                place.description!,
                                                place.phone ?? "",
                                                place.images!,
                                                "subtitle",
                                                LatLng(place.latitude!, place.longitude!), () async {
                                              return showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    title: const Text('Yol Tarifi Al'),
                                                    content: const Text(
                                                        'Google Map uygulamasına yönlendirileceksiniz. Devam etmek istiyor musunuz?'),
                                                    actions: <Widget>[
                                                      TextButton(
                                                        onPressed: () {
                                                          Navigator.of(context).pop();
                                                        },
                                                        child: const Text(
                                                          'Vazgeç',
                                                          style: TextStyle(
                                                            color: Color(AppColors.primaryColor),
                                                          ),
                                                        ),
                                                      ),
                                                      TextButton(
                                                          onPressed: () {
                                                            _launchMaps(place.latitude!, place.longitude!);
                                                            Navigator.of(context).pop();
                                                          },
                                                          child: const Text(
                                                            'Tamam',
                                                            style: TextStyle(
                                                              color: Color(AppColors.primaryColor),
                                                            ),
                                                          )),
                                                    ],
                                                  );
                                                },
                                              );

                                              // _launchMaps(place.latitude!, place.longitude!);
                                            }, place.email ?? "", globalKey, place.address ?? "");
                                          },
                                          child: place.image != null && place.businessType == null
                                              ? Column(
                                                  children: [
                                                    CachedNetworkImage(
                                                      placeholder: (context, url) => const CircularProgressIndicator(
                                                        color: Color(AppColors.primaryColor),
                                                      ),
                                                      imageUrl: place.image!,
                                                      width: 100.r,
                                                      height: 100.r,
                                                      fit: BoxFit.cover,
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      place.name!,
                                                      textAlign: TextAlign.center,
                                                      style: const TextStyle(
                                                          fontSize: 12,
                                                          fontWeight: FontWeight.w500,
                                                          color: Color(0xff123740),
                                                          fontFamily: 'OpenSans'),
                                                    ),
                                                  ],
                                                )
                                              : place.businessType == "Konaklama"
                                                  ? Container(
                                                      height: 32.r,
                                                      width: 32.r,
                                                      decoration: const BoxDecoration(
                                                          color: Color(0xffFF7518), shape: BoxShape.circle),
                                                      // ignore: deprecated_member_use
                                                      child: SvgPicture.asset(
                                                                "assets/svg/bed.svg",
                                                                // ignore: deprecated_member_use
                                                                color: Colors.white,
                                                                fit: BoxFit.scaleDown,
                                                              ),
                                                    )
                                                  : place.businessType == "Cafe"
                                                      ? Container(
                                                          height: 32.r,
                                                          width: 32.r,
                                                          decoration: const BoxDecoration(
                                                              color: Color(0xffFF7518), shape: BoxShape.circle),
                                                          // ignore: deprecated_member_use
                                                          child: SvgPicture.asset(
                                                            "assets/svg/coffe.svg",
                                                            // ignore: deprecated_member_use
                                                            color: Colors.white,
                                                          ),
                                                        )
                                                      : place.businessType == "Restorant"
                                                          ? Container(
                                                              height: 40.r,
                                                              width: 40.r,
                                                              decoration: const BoxDecoration(
                                                                  color: Color(0xffFF7518), shape: BoxShape.circle),
                                                              // ignore: deprecated_member_use
                                                              child: SvgPicture.asset(
                                                                "assets/svg/restaurant.svg",
                                                                // ignore: deprecated_member_use
                                                                color: Colors.white,
                                                                fit: BoxFit.scaleDown,
                                                              ),
                                                            )
                                                          : place.businessType == "Market"
                                                              ? Container(
                                                                  height: 32.r,
                                                                  width: 32.r,
                                                                  decoration: const BoxDecoration(
                                                                      color: Color(0xffFF7518), shape: BoxShape.circle),
                                                                  child: Icon(
                                                                    Icons.store,
                                                                    color: Colors.white,
                                                                    size: 25.r,
                                                                  ),
                                                                )
                                                              : const SizedBox.shrink()));
                                },
                              ),
                              builder: (context, markers) {
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: const Color(0xffFF7518),
                                  ),
                                  child: Center(
                                    child: Text(
                                      markers.length.toString(),
                                      style: const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        : const Center(
                            child: CircularProgressIndicator(
                              color: Color(AppColors.primaryColor),
                            ),
                          ),
                  ],
                );
              }),
          Padding(
            padding: EdgeInsets.all(16.0.r),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Expanded(
                //   child: TextField(
                //     cursorColor: const Color(AppColors.primaryColor),
                //     decoration: InputDecoration(
                //       hintText: 'Konum ve işletme ara',
                //       hintStyle:
                //           TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, color: const Color(0xff666666)),
                //       prefixIcon: const Icon(Icons.search, color: Color(AppColors.primaryColor)),
                //       filled: true,
                //       fillColor: Colors.white,
                //       enabledBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(30.r),
                //         borderSide: BorderSide(
                //           color: const Color(AppColors.primaryColor),
                //           width: 1.w,
                //         ),
                //       ),
                //       focusedBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(30.r),
                //         borderSide: BorderSide(
                //           color: const Color(AppColors.primaryColor),
                //           width: 1.w,
                //         ),
                //       ),
                //       border: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(30.r),
                //         borderSide: BorderSide(
                //           color: const Color(AppColors.primaryColor),
                //           width: 1.w,
                //         ),
                //       ),
                //       contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
                //     ),
                //   ),
                // ),
                Expanded(
                  child: SearchField<PlaceModel>(
                    onTapOutside: (p0) {
                      _focusNode.unfocus();
                    },
                    onSuggestionTap: (p0) {
                      if (p0.item != null) {
                        setState(() {
                          mapController.move(LatLng(p0.item!.latitude!, p0.item!.longitude!), 18);
                          _focusNode.unfocus();
                        });
                      }
                    },
                    onSearchTextChanged: (p0) {
                      if (p0.isNotEmpty) {
                        mapController.move(const LatLng(39.08932110066504, 30.41971481061074), 10);
                      }
                    },
                    onTap: () {
                      _focusNode.requestFocus();
                      setState(() {});
                    },
                    focusNode: _focusNode,
                    itemHeight: 70.h,
                    searchInputDecoration: InputDecoration(
                      hintText: 'Konum ve işletme ara',
                      hintStyle:
                          TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, color: const Color(0xff666666)),
                      prefixIcon: const Icon(Icons.search, color: Color(AppColors.primaryColor)),
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.r),
                        borderSide: BorderSide(
                          color: const Color(AppColors.primaryColor),
                          width: 1.w,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.r),
                        borderSide: BorderSide(
                          color: const Color(AppColors.primaryColor),
                          width: 1.w,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.r),
                        borderSide: BorderSide(
                          color: const Color(AppColors.primaryColor),
                          width: 1.w,
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
                    ),
                    scrollbarDecoration: ScrollbarDecoration(
                      minThumbLength: 50,
                      radius: Radius.circular(20.r),
                      thumbColor: const Color(AppColors.primaryColor),
                      trackColor: Colors.white,
                    ),
                    suggestions: homestate.placeModels != null
                        ? homestate.placeModels!
                            .map(
                              (e) => SearchFieldListItem<PlaceModel>(
                                e.name!,
                                item: e,
                                // Use child to show Custom Widgets in the suggestions
                                // defaults to Text widget
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      e.images != null
                                          ? CircleAvatar(
                                              backgroundColor: const Color(AppColors.primaryColor),
                                              backgroundImage: NetworkImage(e.images!.first),
                                            )
                                          : const SizedBox.shrink(),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(e.name!),
                                    ],
                                  ),
                                ),
                              ),
                            )
                            .toList()
                        : [],
                  ),
                ),
                SizedBox(
                  width: 16.w,
                ),
                Bounceable(
                  onTap: () {
                    if (state.userModel != null) {
                      ref.read(userProvider.notifier).getUser();
                      context.pushRoute(const PersonelProfileRoute());
                    } else {
                      ref.read(userProvider.notifier).getUser();

                      context.pushRoute(const BusinessProfileRoute());
                    }
                  },
                  child: Container(
                      height: 48.r,
                      width: 48.r,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: const Color(AppColors.primaryColor), width: 1),
                      ),
                      child: const Icon(Icons.settings, color: Color(AppColors.primaryColor))),
                )
              ],
            ),
          ),
          // Padding(
          //   padding: EdgeInsets.only(bottom: 130.h),
          //   child: Align(
          //     alignment: Alignment.bottomCenter,
          //     child: SizedBox(
          //       height: 37.h,
          //       child: ListView.builder(
          //         itemCount: filterList.length,
          //         scrollDirection: Axis.horizontal,
          //         itemBuilder: (context, index) {
          //           return Padding(
          //             padding: EdgeInsets.only(right: index == filterList.length - 1 ? 16.w : 0),
          //             child: Bounceable(
          //               onTap: () {
          //                 selectedfilter.value = index;
          //                 setState(() {});
          //               },
          //               child: Container(
          //                 margin: EdgeInsets.only(left: 16.w),
          //                 decoration: BoxDecoration(
          //                     color:
          //                         selectedfilter.value == index ? const Color(AppColors.primaryColor) : Colors.white,
          //                     borderRadius: BorderRadius.circular(20.r),
          //                     border: Border.all(
          //                       color: const Color(AppColors.primaryColor),
          //                       width: 1,
          //                     )),
          //                 child: Center(
          //                   child: Padding(
          //                     padding: EdgeInsets.symmetric(horizontal: 20.w),
          //                     child: Text(
          //                       filterList[index],
          //                       style: TextStyle(
          //                         fontSize: 14.sp,
          //                         fontWeight: FontWeight.w400,
          //                         color: selectedfilter.value == index
          //                             ? Colors.white
          //                             : const Color(AppColors.primaryColor),
          //                       ),
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //             ),
          //           );
          //         },
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class CustomBottomSheet {
  void infoBottomSheet(
      BuildContext context,
      String type,
      String name,
      String image,
      String description,
      String phone,
      List<String> images,
      String subtitle,
      LatLng isletmeKonumu,
      void Function() onTap,
      String email,
      Key globalKey,
      String address) {
    showModalBottomSheet(
        enableDrag: true,
        showDragHandle: true,
        backgroundColor: Colors.white,
        context: context,
        builder: (context) {
          return Stack(
            children: [
              SingleChildScrollView(
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
                              child: type != "place"
                                  ? CachedNetworkImage(
                                      imageUrl: images.first,
                                      width: 103.r,
                                      height: 103.r,
                                      fit: BoxFit.fill,
                                    )
                                  : CachedNetworkImage(
                                      imageUrl: image,
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
                                name,
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                    fontFamily: 'OpenSans'),
                              ),
                              SizedBox(height: 8.h),
                              SizedBox(
                                width: 200.w,
                                child: Text(
                                  type != "place"
                                      ? address.isNotEmpty
                                          ? address
                                          : email
                                      : 'Ziyaret',
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff666666),
                                      fontFamily: 'OpenSans'),
                                ),
                              ),
                              SizedBox(height: 16.h),
                              Container(
                                decoration: BoxDecoration(
                                    color: const Color(0xffE6F0F2), borderRadius: BorderRadius.circular(20.r)),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 12.w, right: 12.w, top: 5.h, bottom: 5.h),
                                  child: Text(
                                    type != "place" ? type : 'Gezilecek Yerler',
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
                      // SizedBox(
                      //   height: 75.h,
                      //   child: ListView.builder(
                      //     itemCount: images.length,
                      //     scrollDirection: Axis.horizontal,
                      //     itemBuilder: (context, index) {
                      //       return Padding(
                      //         padding: EdgeInsets.only(left: index == 0 ? 0 : 16.w),
                      //         child: SizedBox(
                      //             height: 75.r,
                      //             width: 75.r,
                      //             child: ClipRRect(
                      //                 borderRadius: BorderRadius.all(Radius.circular(5.r)),
                      //                 child: type != "place"
                      //                     ? Image.asset(
                      //                         'assets/images/demo.jpeg',
                      //                         fit: BoxFit.fill,
                      //                       )
                      //                     : Image.network(
                      //                         images[index],
                      //                         fit: BoxFit.fill,
                      //                       ))),
                      //       );
                      //     },
                      //   ),
                      // ),
                      GalleryImage(
                          titleGallery: 'Galeri',
                          childAspectRatio: 1,
                          crossAxisCount: 3,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          key: globalKey,
                          numOfShowImages: images.length,
                          loadingWidget: SizedBox(
                            height: 20.h,
                            width: 20.w,
                            child: const CircularProgressIndicator(
                              color: Color(AppColors.primaryColor),
                            ),
                          ),
                          imageUrls: images),
                      SizedBox(
                        height: 24.h,
                      ),
                      Text(
                        description,
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff666666),
                            fontFamily: 'OpenSans'),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      type != "place"
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset('assets/svg/call-outline.svg'),
                                    SizedBox(
                                      width: 17.w,
                                    ),
                                    Text(
                                      phone,
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xff123740),
                                          fontFamily: 'OpenSans'),
                                    )
                                  ],
                                ),
                                Bounceable(
                                  onTap: () {
                                    launchUrlString("tel://$phone");
                                  },
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
                            )
                          : const SizedBox.shrink(),
                      SizedBox(
                        height: 100.h,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                  bottom: 24.h,
                  left: 24.w,
                  right: 24.w,
                  child: CustomFilledButton(text: 'Yol Tarifi Al', onTap: onTap)),
            ],
          );
        });
  }
}
