// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    @JsonKey(name: "uid") required String? uid,
    @JsonKey(name: "name") required String? name,
    @JsonKey(name: "surname") required String? surname,
    @JsonKey(name: "email") required String? email,
    @JsonKey(name: "role") required String? role,


  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}
