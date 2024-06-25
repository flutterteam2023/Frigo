// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:frigo/features/Home/model/place_model.dart';

import 'package:frigo/features/Home/presentation/states/home_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:latlong2/latlong.dart';

final homeProvider = NotifierProvider.autoDispose<HomeNotifier, HomeState>(HomeNotifier.new);

class HomeNotifier extends AutoDisposeNotifier<HomeState> {
  @override
  HomeState build() {
    getPlace(const LatLng(0, 0));
    return HomeState.initial();
  }

  final firestore = FirebaseFirestore.instance;

  Future<void> getPlace(LatLng benimKonum) async {
    List<PlaceModel>? placeModel = [];
    try {
      final placeDoc = await firestore.collection('places').get();
      if (placeDoc.docs.isNotEmpty) {
        placeModel = placeDoc.docs.map((e) => PlaceModel.fromJson(e.data())).toList();

        placeModel = [...placeModel];
        state = state.copyWith(placeModels: placeModel);
      } else {
        placeModel = [...placeModel];
        state = state.copyWith(placeModels: placeModel);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> getCoffe(LatLng benimKonum) async {
    List<PlaceModel>? placeModel = [];
    try {
      final businessDoc = await firestore.collection('business').get();
      if (businessDoc.docs.isNotEmpty) {
        for (var i = 0; i < businessDoc.docs.length; i++) {
          final business = businessDoc.docs[i];
          if (business["businessType"] == "Cafe") {
            final businessPlace = PlaceModel(
                address: business['address'] ?? "",
                description: business['description'],
                name: business['businessName'],
                latitude: double.parse(business['lat'].toString().replaceAll(',', '.')),
                longitude: double.parse(business['long'].toString().replaceAll(',', '.')),
                image: business['images'][0],
                images: List<String>.from(business['images'].map((item) => item as String)),
                phone: business['phone'],
                businessType: business['businessType'],
                email: business['email'],
                seePhone: business['seePhone']);

            placeModel = [businessPlace, ...placeModel!];
          }
        }

        placeModel = [...placeModel!];
        state = state.copyWith(placeModels: placeModel);
      } else {
        placeModel = [...placeModel];
        state = state.copyWith(placeModels: placeModel);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> getMarket(LatLng benimKonum) async {
    List<PlaceModel>? placeModel = [];
    try {
      final businessDoc = await firestore.collection('business').get();
      if (businessDoc.docs.isNotEmpty) {
        for (var i = 0; i < businessDoc.docs.length; i++) {
          final business = businessDoc.docs[i];
          if (business["businessType"] == "Market") {
            final businessPlace = PlaceModel(
                address: business['address'] ?? "",
                description: business['description'],
                name: business['businessName'],
                latitude: double.parse(business['lat'].toString().replaceAll(',', '.')),
                longitude: double.parse(business['long'].toString().replaceAll(',', '.')),
                image: business['images'][0],
                images: List<String>.from(business['images'].map((item) => item as String)),
                phone: business['phone'],
                businessType: business['businessType'],
                email: business['email'],
                seePhone: business['seePhone']);
            placeModel = [businessPlace, ...placeModel!];
          }
        }

        placeModel = [...placeModel!];
        state = state.copyWith(placeModels: placeModel);
      } else {
        placeModel = [...placeModel];
        state = state.copyWith(placeModels: placeModel);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> getHotel(LatLng benimKonum) async {
    List<PlaceModel>? placeModel = [];
    try {
      final businessDoc = await firestore.collection('business').get();
      if (businessDoc.docs.isNotEmpty) {
        for (var i = 0; i < businessDoc.docs.length; i++) {
          final business = businessDoc.docs[i];
          if (business["businessType"] == "Konaklama") {
            final businessPlace = PlaceModel(
                address: business['address'] ?? "",
                description: business['description'],
                name: business['businessName'],
                latitude: double.parse(business['lat'].toString().replaceAll(',', '.')),
                longitude: double.parse(business['long'].toString().replaceAll(',', '.')),
                image: business['images'][0],
                images: List<String>.from(business['images'].map((item) => item as String)),
                phone: business['phone'],
                businessType: business['businessType'],
                email: business['email'],
                seePhone: business['seePhone']);
            placeModel = [businessPlace, ...placeModel!];
          }
        }

        placeModel = [...placeModel!];
        state = state.copyWith(placeModels: placeModel);
      } else {
        placeModel = [...placeModel];
        state = state.copyWith(placeModels: placeModel);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> getRestoran(LatLng benimKonum) async {
    List<PlaceModel>? placeModel = [];
    try {
      final businessDoc = await firestore.collection('business').get();
      if (businessDoc.docs.isNotEmpty) {
        for (var i = 0; i < businessDoc.docs.length; i++) {
          final business = businessDoc.docs[i];
          if (business["businessType"] == "Restorant") {
            final businessPlace = PlaceModel(
                address: business['address'] ?? "",
                description: business['description'],
                name: business['businessName'],
                latitude: double.parse(business['lat'].toString().replaceAll(',', '.')),
                longitude: double.parse(business['long'].toString().replaceAll(',', '.')),
                image: business['images'][0],
                images: List<String>.from(business['images'].map((item) => item as String)),
                phone: business['phone'],
                businessType: business['businessType'],
                email: business['email'],
                seePhone: business['seePhone']);
            placeModel = [businessPlace, ...placeModel!];
          }
        }

        placeModel = [...placeModel!];
        state = state.copyWith(placeModels: placeModel);
      } else {
        placeModel = [...placeModel];
        state = state.copyWith(placeModels: placeModel);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<LatLongCustom> getLatLong(String address) async {
    Dio dio = Dio();
    final response = await dio.get('https://geocode.maps.co/search?q=$address&api_key=6679662cadf33019186500ien0b875b');
    try {
      if (response.data.isNotEmpty) {
        return LatLongCustom(lat: response.data[0]['lat'].toString(), lon: response.data[0]['lon'].toString());
      } else {
        return LatLongCustom(lat: '0', lon: '0');
      }
    } catch (e) {
      return LatLongCustom(lat: '0', lon: '0');
    }
  }
}

class LatLongCustom {
  final String lat;
  final String lon;

  LatLongCustom({required this.lat, required this.lon});
}
