import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie/model/movie_model.dart';
import 'package:movie/resources/constrains.dart';

class ApiService {
  ApiService({required this.url});
  String url;

  Future<MovieModel> getData() async {
    var response = await Dio().get(url);
    var data = jsonDecode(response.toString());
    if (response.statusCode == 200) {
      return MovieModel.fromJson(data);
    } else {
      return MovieModel.fromJson(data);
    }
  }
}

final trendingProvider = Provider<ApiService>(
  (ref) => ApiService(url: baseUrl + trendingMovieApi + apiKey),
);
final discoverProvider = Provider<ApiService>(
    (ref) => ApiService(url: '$baseUrl$discoverUrl$apiKey'));
