import 'package:diaries_mobile/errors/backend_responses.dart';
import 'package:diaries_mobile/shared/local_storage.dart';
import 'package:diaries_mobile/utils/utils.dart';
import 'package:either_dart/either.dart';
import 'package:supabase_flutter/supabase_flutter.dart' show Supabase;

class AuthRepository {
  Future<Either<BackEndFailure, BackEndSuccess<String?>>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await Supabase.instance.client.auth
          .signInWithPassword(password: password, email: email);
      Utils.userId = response.user?.id ?? "";
      await LocalStorage.storeUserId(userId: response.user?.id ?? "");
      return Right(BackEndSuccess());
    } catch (e) {
      return Left(BackEndFailure(errorMessage: e.toString()));
    }
  }
}
