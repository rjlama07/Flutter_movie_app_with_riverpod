import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie/resources/constrains.dart';
import 'package:movie/services/movie_services.dart';
import 'package:movie/services/movie_state.dart';

final defaultState = MovieState(
    errorMessage: "",
    isError: false,
    isLoading: false,
    movies: [],
    isLoaded: false,
    page: 1);

class PopularMovie extends StateNotifier<MovieState> {
  PopularMovie(super.state) {
    getMovieByCategory();
  }
  Future<void> getMovieByCategory() async {
    state = state.copyWith(
        isLoading: state.isLoaded ? false : true, isError: false);
    final resonse =
        await MovieServices().getData(api: popularMovie, page: state.page);
    resonse.fold((l) {
      state = state.copyWith(isError: true, errorMessage: l, isLoading: false);
    }, (r) {
      state = state.copyWith(
          isError: false, errorMessage: "", isLoading: false, movies: r);
    });
  }

  Future<void> loadMore() async {
    state = state.copyWith(isLoaded: true, page: state.page + 1);
    getMovieByCategory();
  }
}

final popularProvider = StateNotifierProvider<PopularMovie, MovieState>(
    (ref) => PopularMovie(defaultState));

class TopRated extends StateNotifier<MovieState> {
  TopRated(super.state) {
    getMovieByCategory();
  }
  Future<void> getMovieByCategory() async {
    state = state.copyWith(isLoading: true, isError: false);
    final resonse = await MovieServices().getData(api: topRatedMovie, page: 1);
    resonse.fold((l) {
      state = state.copyWith(isError: true, errorMessage: l, isLoading: false);
    }, (r) {
      state = state.copyWith(
          isError: false, errorMessage: "", isLoading: false, movies: r);
    });
  }
}

final topRatedProvider = StateNotifierProvider<TopRated, MovieState>(
    (ref) => TopRated(defaultState));

class Upcomming extends StateNotifier<MovieState> {
  Upcomming(super.state) {
    getMovieByCategory();
  }
  Future<void> getMovieByCategory() async {
    state = state.copyWith(isLoading: true, isError: false);
    final resonse = await MovieServices().getData(api: upComming, page: 1);
    resonse.fold((l) {
      state = state.copyWith(isError: true, errorMessage: l, isLoading: false);
    }, (r) {
      state = state.copyWith(
          isError: false, errorMessage: "", isLoading: false, movies: r);
    });
  }
}

final upcommingProvider = StateNotifierProvider<Upcomming, MovieState>(
    (ref) => Upcomming(defaultState));
