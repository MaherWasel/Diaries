import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomBarController extends StateNotifier<int> {
  BottomBarController() : super(0);
  void setIndex({required int index}) {
    state = index;
  }
}

final bottomBarControllerProvider =
    StateNotifierProvider<BottomBarController, int>((ref) {
  return BottomBarController();
});
