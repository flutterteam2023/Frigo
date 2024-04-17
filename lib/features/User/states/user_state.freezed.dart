// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserState {
  bool get isLoading => throw _privateConstructorUsedError;
  UserModel? get userModel => throw _privateConstructorUsedError;
  BusinessModel? get businessModel => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserStateCopyWith<UserState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStateCopyWith<$Res> {
  factory $UserStateCopyWith(UserState value, $Res Function(UserState) then) =
      _$UserStateCopyWithImpl<$Res, UserState>;
  @useResult
  $Res call(
      {bool isLoading, UserModel? userModel, BusinessModel? businessModel});

  $BusinessModelCopyWith<$Res>? get businessModel;
}

/// @nodoc
class _$UserStateCopyWithImpl<$Res, $Val extends UserState>
    implements $UserStateCopyWith<$Res> {
  _$UserStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? userModel = freezed,
    Object? businessModel = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      userModel: freezed == userModel
          ? _value.userModel
          : userModel // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      businessModel: freezed == businessModel
          ? _value.businessModel
          : businessModel // ignore: cast_nullable_to_non_nullable
              as BusinessModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BusinessModelCopyWith<$Res>? get businessModel {
    if (_value.businessModel == null) {
      return null;
    }

    return $BusinessModelCopyWith<$Res>(_value.businessModel!, (value) {
      return _then(_value.copyWith(businessModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserStateImplCopyWith<$Res>
    implements $UserStateCopyWith<$Res> {
  factory _$$UserStateImplCopyWith(
          _$UserStateImpl value, $Res Function(_$UserStateImpl) then) =
      __$$UserStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading, UserModel? userModel, BusinessModel? businessModel});

  @override
  $BusinessModelCopyWith<$Res>? get businessModel;
}

/// @nodoc
class __$$UserStateImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$UserStateImpl>
    implements _$$UserStateImplCopyWith<$Res> {
  __$$UserStateImplCopyWithImpl(
      _$UserStateImpl _value, $Res Function(_$UserStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? userModel = freezed,
    Object? businessModel = freezed,
  }) {
    return _then(_$UserStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      userModel: freezed == userModel
          ? _value.userModel
          : userModel // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      businessModel: freezed == businessModel
          ? _value.businessModel
          : businessModel // ignore: cast_nullable_to_non_nullable
              as BusinessModel?,
    ));
  }
}

/// @nodoc

class _$UserStateImpl implements _UserState {
  _$UserStateImpl(
      {required this.isLoading,
      required this.userModel,
      required this.businessModel});

  @override
  final bool isLoading;
  @override
  final UserModel? userModel;
  @override
  final BusinessModel? businessModel;

  @override
  String toString() {
    return 'UserState(isLoading: $isLoading, userModel: $userModel, businessModel: $businessModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.userModel, userModel) ||
                other.userModel == userModel) &&
            (identical(other.businessModel, businessModel) ||
                other.businessModel == businessModel));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, userModel, businessModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserStateImplCopyWith<_$UserStateImpl> get copyWith =>
      __$$UserStateImplCopyWithImpl<_$UserStateImpl>(this, _$identity);
}

abstract class _UserState implements UserState {
  factory _UserState(
      {required final bool isLoading,
      required final UserModel? userModel,
      required final BusinessModel? businessModel}) = _$UserStateImpl;

  @override
  bool get isLoading;
  @override
  UserModel? get userModel;
  @override
  BusinessModel? get businessModel;
  @override
  @JsonKey(ignore: true)
  _$$UserStateImplCopyWith<_$UserStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
