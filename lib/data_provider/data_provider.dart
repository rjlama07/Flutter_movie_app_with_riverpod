import 'package:movie/model/trending_movie_model.dart';
import 'package:movie/services/trending_movie_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final trendigDataProvider = FutureProvider<TrendingMovieModel>((ref) async {
  return ref.watch(trendingProvider).getData();
});

final discoverDataProvider = FutureProvider(
  (ref) async {
    return ref.watch(discoverProvider).getData();
  },
);
