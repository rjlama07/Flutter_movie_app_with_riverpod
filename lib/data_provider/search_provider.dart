import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/movie_services.dart';
import '../services/movie_state.dart';

final defaultState = MovieState(
    errorMessage: "",
    isError: false,
    isLoading: false,
    movies: [],
    isLoaded: false,
    page: 1);

class Search extends StateNotifier<MovieState> {
  Search(super.state);
  Future<void> searchMovie(String search) async {
    state = state.copyWith(isLoading: true, isError: false);
    final resonse = await MovieServices().getSearchItems(search: search);
    resonse.fold((l) {
      state = state.copyWith(isError: true, errorMessage: l, isLoading: false);
    }, (r) {
      state = state.copyWith(
          isError: false, errorMessage: "", isLoading: false, movies: r);
    });
  }
}

final searchProvider =
    StateNotifierProvider<Search, MovieState>((ref) => Search(defaultState));
