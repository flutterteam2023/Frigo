// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'business_model.freezed.dart';
part 'business_model.g.dart';

@freezed
class BusinessModel with _$BusinessModel {
  const factory BusinessModel({
    @JsonKey(name: "uid")  String? uid,
    @JsonKey(name: "fromUid")  String? fromUid,
    @JsonKey(name: "email")  String? email,
    @JsonKey(name: "password")  String? password,
    @JsonKey(name: "businessName")  String? businessName,
    @JsonKey(name: "businessType")  String? businessType,
    @JsonKey(name: "description")  String? description,
    @JsonKey(name: "phone")  String? phone,
    @JsonKey(name: "seePhone")  bool? seePhone,
    @JsonKey(name: "lat")  String? lat,
    @JsonKey(name: "long")  String? long,
    @JsonKey(name: "images")  List<String>? images,
    @JsonKey(name: "subscription")  int? subscription,
  }) = _BusinessModel;

  factory BusinessModel.fromJson(Map<String, dynamic> json) => _$BusinessModelFromJson(json);
}
