import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie/model/trending_movie_model.dart';
import 'package:movie/resources/constrains.dart';

class TrendingApiService {
  TrendingApiService({required this.url});
  String url;

  Future<TrendingMovieModel> getData() async {
    var response = await Dio().get(url);
    var data = jsonDecode(response.toString());
    if (response.statusCode == 200) {
      return TrendingMovieModel.fromJson(data);
    } else {
      return TrendingMovieModel.fromJson(data);
    }
  }
}

final trendingProvider = Provider<TrendingApiService>(
  (ref) => TrendingApiService(url: trendingMovieApi),
);
final discoverProvider =
    Provider<TrendingApiService>((ref) => TrendingApiService(url: discoverUrl));
