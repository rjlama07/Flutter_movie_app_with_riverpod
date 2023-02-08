import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie/resources/constrains.dart';
import 'package:movie/services/movie_services.dart';
import 'package:movie/services/movie_state.dart';

final defaultState =
    MovieState(errorMessage: "", isError: false, isLoading: false, movies: []);

class PopularMovie extends StateNotifier<MovieState> {
  PopularMovie(super.state) {
    getMovieByCategory();
  }
  Future<void> getMovieByCategory() async {
    state = state.copyWith(isLoading: true, isError: false);
    final resonse = await MovieServices()
        .getData(api: "https://api.themoviedb.org/3/movie/popular");
    resonse.fold((l) {
      state = state.copyWith(isError: true, errorMessage: l, isLoading: false);
    }, (r) {
      state = state.copyWith(
          isError: false, errorMessage: "", isLoading: false, movies: r);
    });
  }
}

final popularProvider = StateNotifierProvider<PopularMovie, MovieState>(
    (ref) => PopularMovie(defaultState));
