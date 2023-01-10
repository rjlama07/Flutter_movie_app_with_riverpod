import 'package:movie/model/movie_model.dart';
import 'package:movie/services/api_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final trendigDataProvider = FutureProvider<MovieModel>((ref) async {
  return ref.watch(trendingProvider).getData();
});

final discoverDataProvider = FutureProvider(
  (ref) async {
    return ref.watch(discoverProvider).getData();
  },
);
