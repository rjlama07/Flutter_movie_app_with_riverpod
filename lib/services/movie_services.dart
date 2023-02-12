import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie/model/movie.dart';
import 'package:movie/resources/constrains.dart';

class MovieServices {
  final Dio dio = Dio();

  Future<Either<String, List<Movie>>> getData(
      {required String api, required int page}) async {
    try {
      final response = await dio
          .get(api, queryParameters: {'api_key': apiKey, 'page': page});
      final data = (response.data['results'] as List)
          .map((e) => Movie.fromJson(e))
          .toList();
      return right(data);
    } on DioError catch (ex) {
      return Left(ex.message);
    }
  }

  Future<Either<String, List<Movie>>> getSearchItems(
      {required String search}) async {
    try {
      final response = await dio.get(searchMovie, queryParameters: {
        'api_key': apiKey,
      });
      final data = (response.data['results'] as List)
          .map((e) => Movie.fromJson(e))
          .toList();
      return right(data);
    } on DioError catch (ex) {
      return Left(ex.message);
    }
  }
}
