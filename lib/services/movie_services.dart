import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie/model/movie.dart';
import 'package:movie/resources/constrains.dart';

class MovieServices {
  Future<Either<String, List<Movie>>> getData(
      {required String catagory}) async {
    try {
      final response = await Dio()
          .get("/3/movie/$catagory", queryParameters: {'api_key': apiKey});
      final data = (response.data['reasults'] as List)
          .map((e) => Movie.fromJson(e))
          .toList();
      return right(data);
    } on DioError catch (ex) {
      return Left(ex.message);
    }
  }
}
