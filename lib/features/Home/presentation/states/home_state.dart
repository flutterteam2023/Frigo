
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frigo/features/Home/model/place_model.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  factory HomeState(
      {required bool isLoading,
      required List<PlaceModel>? placeModels,
      
     }) = _HomeState;
  factory HomeState.initial() => HomeState(
      isLoading: false,
      placeModels: null,
      
      
      
      );
}