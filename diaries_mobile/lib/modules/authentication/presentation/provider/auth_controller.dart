import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class AuthStates {}

class AuthSuccess<T> extends AuthStates {
  final T? data;
  AuthSuccess({this.data});
}

class AuthInitial extends AuthStates {}

class AuthLoading extends AuthStates {}

class AuthFailure extends AuthStates {
  final int? code;
  final String? errorMessage;
  AuthFailure({this.code, this.errorMessage});
}

class AuthController extends StateNotifier<AuthStates> {
  AuthController() : super(AuthInitial());
}

class RegisterOrSignInController extends StateNotifier<bool> {
  RegisterOrSignInController() : super(false);
  void swap() {
    state = !state;
  }
}

final registerOrSignInControllerProvider =
    StateNotifierProvider<RegisterOrSignInController, bool>((ref) {
  return RegisterOrSignInController();
});
