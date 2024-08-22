import 'package:diaries_mobile/errors/backend_responses.dart';
import 'package:diaries_mobile/modules/home/domain/diaries.dart';
import 'package:either_dart/either.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeRepository {
  Future<Either<BackEndFailure, BackEndSuccess<List<Diaries>>>> fetchAllDiaries(
      {required String userId}) async {
    try {
      final response = await Supabase.instance.client
          .from("diares")
          .select()
          .eq("user_id", userId);
      List<Diaries> data = [];
      data = response.map((e) => Diaries.fromMap(e)).toList();
      return Right(BackEndSuccess<List<Diaries>>(data: data));
    } catch (e) {
      return Left(BackEndFailure());
    }
  }
}
