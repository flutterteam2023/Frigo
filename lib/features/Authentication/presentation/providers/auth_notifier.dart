// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frigo/constant/app_color.dart';
import 'package:frigo/features/Authentication/data/model/business_model.dart';
import 'package:frigo/features/Authentication/presentation/states/auth_states.dart';
import 'package:frigo/features/Home/presentation/pages/home_view.dart';
import 'package:frigo/features/User/states/user_state.dart';
import 'package:frigo/router/app_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final authProvider = NotifierProvider.autoDispose<AuthNotifier, AuthState>(AuthNotifier.new);

class AuthNotifier extends AutoDisposeNotifier<AuthState> {
  @override
  AuthState build() {
    return AuthState.initial();
  }

  final _auth = FirebaseAuth.instance;
  final _user = FirebaseAuth.instance.currentUser;
  final firestore = FirebaseFirestore.instance;

  Future<void> registerUser(
      String email, String password, String name, String surname, String role, BuildContext context) async {
    state = state.copyWith(isLoading: true);
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password).then((value) {
        firestore.collection('users').doc(value.user!.uid).set({
          'name': name,
          'surname': surname,
          'email': email,
          'uid': value.user!.uid,
          'role': role,
          'userType': 'user'
        });
      });

      state = state.copyWith(isLoading: false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: const Color(AppColors.primaryColor),
          content: Text(
            'Kayıt Başarılı',
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, color: Colors.white, fontFamily: 'OpenSans'),
          ),
        ),
      );
      // context.replaceRoute(const AuthSplashRoute());
     await loginUser(email, password, context);
    } on FirebaseAuthException catch (e) {
      state = state.copyWith(isLoading: false);
      // ignore: use_rethrow_when_possible
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: const Color(AppColors.primaryColor),
            content: Text(
              'Şifre Zayıf',
              style:
                  TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, color: Colors.white, fontFamily: 'OpenSans'),
            ),
          ),
        );
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: const Color(AppColors.primaryColor),
            content: Text(
              'Bu mail adresi zaten kullanılıyor',
              style:
                  TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, color: Colors.white, fontFamily: 'OpenSans'),
            ),
          ),
        );
      }
    }
  }

  Future<void> loginUser(String email, String password, BuildContext context) async {
    state = state.copyWith(isLoading: true);
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password).then((value) {
        state = state.copyWith(isLoading: false);
          context.router.replaceAll([const HomeRoute()]);

      });
    } on FirebaseAuthException catch (e) {
      state = state.copyWith(isLoading: false);
      // ignore: use_rethrow_when_possible
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: const Color(AppColors.primaryColor),
            content: Text(
              'Kullanıcı Bulunamadı',
              style:
                  TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, color: Colors.white, fontFamily: 'OpenSans'),
            ),
          ),
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: const Color(AppColors.primaryColor),
            content: Text(
              'Yanlış Şifre',
              style:
                  TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, color: Colors.white, fontFamily: 'OpenSans'),
            ),
          ),
        );
      } else if (e.code == 'invalid-email') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: const Color(AppColors.primaryColor),
            content: Text(
              'Geçersiz Mail Adresi',
              style:
                  TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, color: Colors.white, fontFamily: 'OpenSans'),
            ),
          ),
        );
      } else if (e.code == 'user-disabled') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: const Color(AppColors.primaryColor),
            content: Text(
              'Kullanıcı Devre Dışı',
              style:
                  TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, color: Colors.white, fontFamily: 'OpenSans'),
            ),
          ),
        );
      }
    }
  }

  Future<void> forgotPassword(String email, BuildContext context) async {
    state = state.copyWith(isLoading: true);
    try {
      await _auth.sendPasswordResetEmail(email: email);
      state = state.copyWith(isLoading: false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: const Color(AppColors.primaryColor),
          content: Text(
            'Şifre Sıfırlama Maili Gönderildi',
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, color: Colors.white, fontFamily: 'OpenSans'),
          ),
        ),
      );
      context.replaceRoute(const AuthSplashRoute());
    } on FirebaseAuthException catch (e) {
      state = state.copyWith(isLoading: false);
      // ignore: use_rethrow_when_possible
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: const Color(AppColors.primaryColor),
            content: Text(
              'Kullanıcı Bulunamadı',
              style:
                  TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, color: Colors.white, fontFamily: 'OpenSans'),
            ),
          ),
        );
      }
    }
  }


  // Future<void> deleteUser(BuildContext context) async {
  //   await _user!.delete();
  //   // ignore: use_build_context_synchronously
  //   context.replaceRoute(const AuthSplashRoute());
  // }
  //------------------- Business Auth -------------------

  //------------------- Business Auth Preparation -------------------

  void membershipInformation(String email, String password, BuildContext context) {
    state = state.copyWith(businessModel: const BusinessModel().copyWith(email: email, password: password));
    context.pushRoute(CompanyApplicationSkipRoute(email: email, password: password));
  }

  Future<void> businessInfo(
    String businessName,
    String businessType,
    String description,
    String phone,
    bool seePhone,
    String lat,
    String long,
    int subscription,
    String fromUid,
    BuildContext context,
  ) async {
    state = await state.copyWith(
        businessModel: state.businessModel!.copyWith(
      businessName: businessName,
      businessType: businessType,
      description: description,
      phone: phone,
      seePhone: seePhone,
      lat: lat,
      long: long,
      subscription: subscription,
      fromUid: fromUid,
    ));
  }

  Future<void> registerBusiness(
    String email,
    String password,
    List<XFile> images,
    String businessName,
    String businessType,
    String description,
    String phone,
    bool seePhone,
    String lat,
    String long,
    int subscription,
    BuildContext context,
    String address
  ) async {
    state = state.copyWith(isLoading: true);

    try {
      // Kullanıcıyı oluştur
      var userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      var userId = userCredential.user!.uid;

      // Storage'ye resimleri yükle ve linkleri al
      List<String> imageUrls = [];
      for (var image in images) {
        var imageUrl = await _uploadImageToFirebaseStorage(image, userId);
        imageUrls.add(imageUrl);
      }

      // Firestore'daki 'business' belgesini oluştur
      await firestore.collection('business').doc(userId).set({
        'businessName': businessName,
        'businessType': businessType,
        'description': description,
        'phone': phone,
        'seePhone': seePhone,
        'lat': lat,
        'long': long,
        'subscription': subscription,
        'images': imageUrls,
        'uid': userId,
        'email': email,
        'startDate': DateTime.now(),
        'endDate': null,
        'userType': 'business',
        'address': address
      });
    } catch (e) {
      if (kDebugMode) {
        print('Hata: $e');
      }
      // Hata durumunda kullanıcıyı geri al
      // Örneğin:
      // await userCredential.user!.delete();
    }

    state = state.copyWith(isLoading: false);
   context.router.replaceAll([const HomeRoute()]);

  }

  Future<String> _uploadImageToFirebaseStorage(XFile imageFile, String userId) async {
    try {
      final imageData = await XFile(imageFile.path).readAsBytes();
      final featuredPhoto = imageData;
      var storageRef = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('businessImages/$userId/${imageFile.path.split('/').last}');
      var uploadTask = storageRef.putFile(File(imageFile.path));
      var snapshot = await uploadTask;
      var downloadUrl = await snapshot.ref.putData(
        featuredPhoto,
        firebase_storage.SettableMetadata(contentType: 'image/jpeg'),
      );
      return await downloadUrl.ref.getDownloadURL();
    } catch (e) {
      if (kDebugMode) {
        print('Resim yüklenirken hata oluştu: $e');
      }
      return ''; // Hata durumunda boş bir URL döndür
    }
  }

  void changePassword(String currentPassword, String newPassword,BuildContext context) async {
    final user = _auth.currentUser;
    final cred = EmailAuthProvider.credential(email: user!.email!, password: currentPassword);

    user.reauthenticateWithCredential(cred).then((value) {
      user.updatePassword(newPassword).then((_) {
      context.pushRoute(const PasswordUpdateSuccesRoute());

      }).catchError((error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: const Color(AppColors.primaryColor),
            content: Text(
              'Şifre Değiştirilemedi',
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, color: Colors.white, fontFamily: 'OpenSans'),
            ),
          ),
        );
        //Error, show something
      });
    }).catchError((err) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: const Color(AppColors.primaryColor),
          content: Text(
            'Şifre Değiştirilemedi',
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, color: Colors.white, fontFamily: 'OpenSans'),
          ),
        ),
      );
    });
  }
}
