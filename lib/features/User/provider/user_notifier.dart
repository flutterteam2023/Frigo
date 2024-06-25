// ignore_for_file: use_build_context_synchronously


import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:frigo/features/Authentication/data/model/business_model.dart';
import 'package:frigo/features/User/model/user_model.dart';
import 'package:frigo/features/User/states/user_state.dart';
import 'package:frigo/router/app_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userProvider = NotifierProvider.autoDispose<UserNotifier, UserState>(UserNotifier.new);

class UserNotifier extends AutoDisposeNotifier<UserState> {
  @override
  UserState build() {
    getUser();

    return UserState.initial();
    
  }
  

  final _auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  void deleteUser()async{
    await _auth.signOut();
    state = state.copyWith(userModel: null, businessModel: null);
  }

  Future<void> getUser()async{
    final user = _auth.currentUser;
    UserModel? userModel;
    BusinessModel? businessModel;
    try {
      final userDoc = await firestore.collection('users').where('uid', isEqualTo: user!.uid).get();
      final businessDoc = await firestore.collection('business').where('uid', isEqualTo: user.uid).get();
      if(userDoc.docs.isNotEmpty){
        userModel = UserModel.fromJson(userDoc.docs.first.data());
      }
      if(businessDoc.docs.isNotEmpty){
        businessModel = BusinessModel.fromJson(businessDoc.docs.first.data());
      }
      state = state.copyWith(userModel: userModel, businessModel: businessModel);
      
      
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      
    }

    
  }


  Future<void> signOut(BuildContext context) async {
    state = state.copyWith(isLoading: true);
    await _auth.signOut().then((value) {
      state = state.copyWith(isLoading: false);
      context.replaceRoute(const AuthSplashRoute());
            state = UserState.initial();

    });
  }

  Future<void> businessApplication(BuildContext context) async {
    state = state.copyWith(isLoading: true);
    await _auth.signOut().then((value) {
      state = state.copyWith(isLoading: false);


      context.replaceRoute(const CompanyApplicationProcessesRoute());
                  state = UserState.initial();

    });
  }

}
