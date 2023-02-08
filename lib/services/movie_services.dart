import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie/model/movie.dart';

class MovieServices {
  final Dio dio = Dio();

  Future<Either<String, List<Movie>>> getData({required String api}) async {
    try {
      final response = await dio.get(
          "https://api.themoviedb.org/3/movie/popular?api_key=85b9491c903a2b128afc01a33d1f4f6c");
      final data = (response.data['results'] as List)
          .map((e) => Movie.fromJson(e))
          .toList();
      return right(data);
    } on DioError catch (ex) {
      return Left(ex.message);
    }
  }
}
