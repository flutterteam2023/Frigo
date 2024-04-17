// ignore_for_file: use_build_context_synchronously


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:frigo/features/Home/model/place_model.dart';

import 'package:frigo/features/Home/presentation/states/home_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final homeProvider = NotifierProvider.autoDispose<HomeNotifier, HomeState>(HomeNotifier.new);

class HomeNotifier extends AutoDisposeNotifier<HomeState> {
  @override
  HomeState build() {

    return HomeState.initial();
    
  }
  final firestore = FirebaseFirestore.instance;

  Future<void> getPlace()async{
    List<PlaceModel>?  placeModel;
    try {
      final placeDoc = await firestore.collection('places').get();
      if(placeDoc.docs.isNotEmpty){
        placeModel = placeDoc.docs.map((e) => PlaceModel.fromJson(e.data())).toList();
      }
      state = state.copyWith(placeModels: placeModel);
      
      
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }


  }
  

  

}
