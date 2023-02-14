import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:movie/data_provider/movie_provider.dart';
import 'package:movie/data_provider/video_provider.dart';
import 'package:movie/resources/constrains.dart';
import 'package:pod_player/pod_player.dart';
import '../../model/movie.dart';

class DetailPage extends ConsumerWidget {
  const DetailPage({super.key, required this.movie});
  final Movie movie;
  @override
  Widget build(BuildContext context, ref) {
    final videoData = ref.watch(videoProvider(movie.id.toString()));
    final trendingData = ref.watch(trendingMovieProvider);
    final recommandedMovies = ref.watch(recommandedProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            videoData.when(
              data: (data) => data.isNotEmpty
                  ? MovieImage(keys: data[0])
                  : CachedNetworkImage(
                      imageUrl: "$imageApi${movie.poster_path}"),
              error: (error, stackTrace) => Container(),
              loading: () => Container(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 35.sp),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(movie.overview),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    "Trending Movies",
                    style:
                        TextStyle(fontSize: 40.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  SizedBox(
                    height: 60.h,
                    width: double.maxFinite,
                    child: trendingData.isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : NotificationListener(
                            onNotification:
                                (ScrollEndNotification onNotifiaction) {
                              final before =
                                  onNotifiaction.metrics.extentBefore;
                              final max =
                                  onNotifiaction.metrics.maxScrollExtent;
                              if (max == before) {
                                ref
                                    .read(trendingMovieProvider.notifier)
                                    .loadMore();
                              }
                              return true;
                            },
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: trendingData.movies.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.of(context)
                                        .pushReplacement(MaterialPageRoute(
                                      builder: (context) => DetailPage(
                                          movie: trendingData.movies[index]),
                                    ));
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(right: 12.w),
                                    child: CircleAvatar(
                                      backgroundImage: CachedNetworkImageProvider(
                                          "$imageApi${trendingData.movies[index].poster_path}"),
                                      radius: 20.h,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  recommandedMovies.isLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : recommandedMovies.isError
                          ? Center(child: Text(recommandedMovies.errorMessage))
                          : SizedBox(
                              height: 100.h,
                              width: double.maxFinite,
                              child: NotificationListener(
                                onNotification:
                                    (ScrollEndNotification onNotification) {
                                  // final before =
                                  //     onNotification.metrics.extentBefore;
                                  // final max =
                                  //     onNotification.metrics.maxScrollExtent;
                                  return true;
                                },
                                child: ListView.builder(
                                  itemCount: recommandedMovies.movies.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      margin: EdgeInsets.only(right: 30.w),
                                      child: recommandedMovies
                                                  .movies[index].poster_path !=
                                              ""
                                          ? CachedNetworkImage(
                                              errorWidget: (context, url,
                                                      error) =>
                                                  Image.asset(
                                                      "assets/images/launch_icon.png"),
                                              placeholder: (context, url) =>
                                                  Center(
                                                      child: SpinKitFadingCube(
                                                    color: Colors.redAccent
                                                        .withOpacity(0.2),
                                                  )),
                                              imageUrl:
                                                  "$imageApi${recommandedMovies.movies[index].poster_path}")
                                          : Image.asset(
                                              "assets/images/launch_icon.png"),
                                    );
                                  },
                                ),
                              ),
                            ),
                ],
              ),
            )
          ],
        ),
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
            const PodPlayerConfig(autoPlay: false, isLooping: false))
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
