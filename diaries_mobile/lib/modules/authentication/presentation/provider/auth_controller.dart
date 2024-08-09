import 'package:diaries_mobile/modules/authentication/data/auth_repo.dart';
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
  final authRepo = AuthRepository();
  Future<void> signIn({required String email, required String password}) async {
    state = AuthLoading();
    final response = await authRepo.signIn(email: email, password: password);
    response.fold(
        (left) => state = AuthFailure(errorMessage: left.errorMessage),
        (right) => state = AuthSuccess());
  }

  Future<void> register(
      {required String email,
      required String userName,
      required String password}) async {
    state = AuthLoading();
    final response = await authRepo.register(
        email: email, userName: userName, password: password);
    response.fold(
        (left) => state = AuthFailure(errorMessage: left.errorMessage),
        (right) => state = AuthSuccess());
  }

  void reset() {
    state = AuthInitial();
  }
}

final authControllerProvider =
    StateNotifierProvider<AuthController, AuthStates>((ref) {
  return AuthController();
});

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
