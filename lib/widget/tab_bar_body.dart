import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:movie/data_provider/movie_provider.dart';
import 'package:movie/resources/constrains.dart';
import 'package:movie/screens/details_page/details_page.dart';
import 'package:movie/screens/home_page.dart';
import 'package:movie/widget/shimmer_effect.dart';

class TabBarWidget extends ConsumerWidget {
  const TabBarWidget({super.key, required this.catagoryType});
  final CatagoryType catagoryType;

  @override
  Widget build(BuildContext context, ref) {
    final provider = catagoryType == CatagoryType.popular
        ? popularProvider
        : catagoryType == CatagoryType.toprated
            ? topRatedProvider
            : upcommingProvider;
    final movieData = ref.watch(provider);
    return Scaffold(
        body: movieData.isLoading
            ? const ShimmerContainer()
            : movieData.isError
                ? Center(
                    child: Text(movieData.errorMessage),
                  )
                : Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                    child: NotificationListener(
                      onNotification: (ScrollEndNotification onNotifiaction) {
                        final before = onNotifiaction.metrics.extentBefore;
                        final max = onNotifiaction.metrics.maxScrollExtent;
                        if (max == before) {
                          catagoryType == CatagoryType.popular
                              ? ref.read(popularProvider.notifier).loadMore()
                              : catagoryType == CatagoryType.toprated
                                  ? ref
                                      .read(topRatedProvider.notifier)
                                      .loadMore()
                                  : ref
                                      .read(upcommingProvider.notifier)
                                      .loadMore();
                        }
                        return true;
                      },
                      child: GridView.builder(
                        itemCount: movieData.movies.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                childAspectRatio: 2 / 3,
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 5),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Get.to(
                                  DetailPage(movie: movieData.movies[index]));
                            },
                            child: CachedNetworkImage(
                                key: UniqueKey(),
                                placeholder: (context, url) => Center(
                                        child: SpinKitFadingCube(
                                      color: Colors.redAccent.withOpacity(0.2),
                                    )),
                                imageUrl:
                                    "$imageApi${movieData.movies[index].poster_path}"),
                          );
                        },
                      ),
                    ),
                  ));
  }
}
