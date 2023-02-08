import '../model/movie.dart';

class MovieState {
  final bool isLoading;
  final bool isError;
  final List<Movie> movies;
  final String errorMessage;
  MovieState(
      {required this.errorMessage,
      required this.isError,
      required this.isLoading,
      required this.movies});

  MovieState copyWith(
      {bool? isLoading,
      bool? isError,
      List<Movie>? movies,
      String? errorMessage}) {
    return MovieState(
        isLoading: isLoading ?? this.isLoading,
        isError: isError ?? this.isError,
        errorMessage: errorMessage ?? this.errorMessage,
        movies: movies ?? this.movies);
  }
}
