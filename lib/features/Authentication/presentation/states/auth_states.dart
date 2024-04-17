import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frigo/features/Authentication/data/model/business_model.dart';

part 'auth_states.freezed.dart';

@freezed
class AuthState with _$AuthState {
  factory AuthState(
      {required bool isLoading,
      required BusinessModel? businessModel,
     }) = _AuthState;
  factory AuthState.initial() => AuthState(
      isLoading: false,
      businessModel: null,
      
      );
}