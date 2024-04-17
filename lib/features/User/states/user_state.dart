
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frigo/features/Authentication/data/model/business_model.dart';
import 'package:frigo/features/User/model/user_model.dart';

part 'user_state.freezed.dart';

@freezed
class UserState with _$UserState {
  factory UserState(
      {required bool isLoading,
      required UserModel? userModel,
      required BusinessModel? businessModel,
     }) = _UserState;
  factory UserState.initial() => UserState(
      isLoading: false,
      userModel: null,
      businessModel: null,
      
      
      );
}