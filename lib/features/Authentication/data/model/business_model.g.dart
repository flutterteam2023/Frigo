// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BusinessModelImpl _$$BusinessModelImplFromJson(Map<String, dynamic> json) =>
    _$BusinessModelImpl(
      uid: json['uid'] as String?,
      fromUid: json['fromUid'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      businessName: json['businessName'] as String?,
      businessType: json['businessType'] as String?,
      description: json['description'] as String?,
      phone: json['phone'] as String?,
      seePhone: json['seePhone'] as bool?,
      lat: json['lat'] as String?,
      long: json['long'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      subscription: json['subscription'] as int?,
    );

Map<String, dynamic> _$$BusinessModelImplToJson(_$BusinessModelImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'fromUid': instance.fromUid,
      'email': instance.email,
      'password': instance.password,
      'businessName': instance.businessName,
      'businessType': instance.businessType,
      'description': instance.description,
      'phone': instance.phone,
      'seePhone': instance.seePhone,
      'lat': instance.lat,
      'long': instance.long,
      'images': instance.images,
      'subscription': instance.subscription,
    };
