import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie/data_provider/video_provider.dart';
import 'package:pod_player/pod_player.dart';

import '../../model/movie.dart';

class DetailPage extends ConsumerWidget {
  const DetailPage({super.key, required this.movie});
  final Movie movie;
  @override
  Widget build(BuildContext context, ref) {
    final videoData = ref.watch(videoProvider(movie.id.toString()));

    return Container(
      child: videoData.when(
        data: (data) => MovieImage(keys: data[0]),
        error: (error, stackTrace) => Container(),
        loading: () => Container(),
      ),
    );
  }
}

class MovieImage extends StatefulWidget {
  const MovieImage({super.key, required this.keys});
  final String keys;
  @override
  State<MovieImage> createState() => _MovieImageState();
}

class _MovieImageState extends State<MovieImage> {
  late final PodPlayerController controller;

  @override
  void initState() {
    controller = PodPlayerController(
        playVideoFrom: PlayVideoFrom.youtube(
            "https://www.youtube.com/watch?v=${widget.keys}"),
        podPlayerConfig:
            const PodPlayerConfig(autoPlay: true, isLooping: false))
      ..initialise();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PodVideoPlayer(controller: controller);
  }
}
