import '../model/movie.dart';

class MovieState {
  final bool isLoading;
  final bool isError;
  final List<Movie> movies;
  final String errorMessage;
  final int page;
  final bool isLoaded;
  MovieState(
      {required this.errorMessage,
      required this.isError,
      required this.isLoading,
      required this.movies,
      required this.page,
      required this.isLoaded});

  MovieState copyWith(
      {bool? isLoading,
      bool? isError,
      List<Movie>? movies,
      String? errorMessage,
      int? page,
      bool? isLoaded}) {
    return MovieState(
        page: page ?? this.page,
        isLoaded: isLoaded ?? this.isLoaded,
        isLoading: isLoading ?? this.isLoading,
        isError: isError ?? this.isError,
        errorMessage: errorMessage ?? this.errorMessage,
        movies: movies ?? this.movies);
  }
}
