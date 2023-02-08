import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie/data_provider/movie_provider.dart';

class PopularMovie extends ConsumerWidget {
  const PopularMovie({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final movieData = ref.watch(popularProvider);
    return Column(
      children: [
        movieData.isLoading
            ? const CircularProgressIndicator()
            : movieData.isError
                ? const Text("Error")
                : Text(movieData.movies[0].title)
      ],
    );
  }
}
