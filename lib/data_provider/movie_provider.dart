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
          isError: false,
          errorMessage: "",
          isLoading: false,
          movies: [...state.movies, ...r]);
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
    state = state.copyWith(
        isLoading: state.isLoaded ? false : true, isError: false);
    final resonse =
        await MovieServices().getData(api: topRatedMovie, page: state.page);
    resonse.fold((l) {
      state = state.copyWith(isError: true, errorMessage: l, isLoading: false);
    }, (r) {
      state = state.copyWith(
          isError: false,
          errorMessage: "",
          isLoading: false,
          movies: [...state.movies, ...r]);
    });
  }

  Future<void> loadMore() async {
    state = state.copyWith(isLoaded: true, page: state.page + 1);
    getMovieByCategory();
  }
}

final topRatedProvider = StateNotifierProvider<TopRated, MovieState>(
    (ref) => TopRated(defaultState));

class Upcomming extends StateNotifier<MovieState> {
  Upcomming(super.state) {
    getMovieByCategory();
  }
  Future<void> getMovieByCategory() async {
    state = state.copyWith(
        isLoading: state.isLoaded ? false : true, isError: false);
    final resonse =
        await MovieServices().getData(api: upComming, page: state.page);
    resonse.fold((l) {
      state = state.copyWith(isError: true, errorMessage: l, isLoading: false);
    }, (r) {
      state = state.copyWith(
          isError: false,
          errorMessage: "",
          isLoading: false,
          movies: [...state.movies, ...r]);
    });
  }

  Future<void> loadMore() async {
    state = state.copyWith(isLoaded: true, page: state.page + 1);
    getMovieByCategory();
  }
}

final upcommingProvider = StateNotifierProvider<Upcomming, MovieState>(
    (ref) => Upcomming(defaultState));

class TrendingMovie extends StateNotifier<MovieState> {
  TrendingMovie(super.state) {
    getMovieByCategory();
  }
  Future<void> getMovieByCategory() async {
    state = state.copyWith(
        isLoading: state.isLoaded ? false : true, isError: false);
    final resonse =
        await MovieServices().getData(api: upComming, page: state.page);
    resonse.fold((l) {
      state = state.copyWith(isError: true, errorMessage: l, isLoading: false);
    }, (r) {
      state = state.copyWith(
          isError: false,
          errorMessage: "",
          isLoading: false,
          movies: [...state.movies, ...r]);
    });
  }

  Future<void> loadMore() async {
    state = state.copyWith(isLoaded: true, page: state.page + 1);
    getMovieByCategory();
  }
}

final trendingMovieProvider = StateNotifierProvider<Upcomming, MovieState>(
    (ref) => Upcomming(defaultState));

class Recommanded extends StateNotifier<MovieState> {
  Recommanded(super.state) {
    // getMovieByCategory();
  }
  Future<void> getMovieByCategory(String movieId) async {
    state = state.copyWith(
        isLoading: state.isLoaded ? false : true, isError: false);
    final resonse = await MovieServices().getData(
        api: "https://api.themoviedb.org/3/movie/$movieId/recommendations",
        page: state.page);
    resonse.fold((l) {
      state = state.copyWith(isError: true, errorMessage: l, isLoading: false);
    }, (r) {
      state = state.copyWith(
          isError: false,
          errorMessage: "",
          isLoading: false,
          movies: [...state.movies, ...r]);
    });
  }

  Future<void> loadMore() async {
    state = state.copyWith(isLoaded: true, page: state.page + 1);
    // getMovieByCategory();
  }
}

final recommandedProvider = StateNotifierProvider<Recommanded, MovieState>(
    (ref) => Recommanded(defaultState));
