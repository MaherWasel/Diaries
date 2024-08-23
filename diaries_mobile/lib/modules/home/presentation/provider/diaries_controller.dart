import 'package:diaries_mobile/modules/home/data/home_repo.dart';
import 'package:diaries_mobile/modules/home/domain/diaries.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class HomeStates {}

class HomeSuccess<T> extends HomeStates {
  final T? data;
  HomeSuccess({this.data});
}

class HomeInitial extends HomeStates {}

class HomeLoading extends HomeStates {}

class HomeFailure extends HomeStates {
  final int? code;
  final String? errorMessage;
  HomeFailure({this.code, this.errorMessage});
}

class DiariesState extends StateNotifier<HomeStates> {
  DiariesState() : super(HomeInitial());
  Future<void> loadDiaires({required String userId}) async {
    state = HomeLoading();
    final response = await HomeRepository().fetchAllDiaries(userId: userId);
    response.fold((fail) => state = HomeFailure(),
        (right) => state = HomeSuccess<List<Diaries>>(data: right.data));
  }
}

final diariesStateControllerProvider =
    StateNotifierProvider<DiariesState, HomeStates>((ref) {
  return DiariesState();
});
