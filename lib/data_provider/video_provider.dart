import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie/resources/constrains.dart';

class VideoProvider {
  static Future<List<String>> getVideo(String movieId) async {
    final dio = Dio();
    try {
      final response = await dio.get(
          "https://api.themoviedb.org/3/movie/$movieId/videos",
          queryParameters: {'api_key': apiKey});

      final data = (response.data['results'] as List)
          .map((e) => e['key'] as String)
          .toList();
      return data;
    } on DioError catch (err) {
      throw err.message;
    }
  }
}

final videoProvider =
    FutureProvider.family((ref, String id) => VideoProvider.getVideo(id));
