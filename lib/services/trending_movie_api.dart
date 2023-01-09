import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:movie/model/trending_movie_model.dart';
import 'package:movie/resources/constrains.dart';

class TrendingApiService {
  Future<TrendingMovieModel> getData() async {
    var response = await Dio().get(trendingMovieApi);
    var data = jsonDecode(response.toString());
    if (response.statusCode == 200) {
      return TrendingMovieModel.fromJson(data);
    } else {
      return TrendingMovieModel.fromJson(data);
    }
  }
}
