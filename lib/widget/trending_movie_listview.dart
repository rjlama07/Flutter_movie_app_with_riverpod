import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie/data_provider/data_provider.dart';
import 'package:movie/resources/constrains.dart';
import 'package:movie/screens/moviedetails.dart';
import 'package:movie/widget/shimmer_effect.dart';
import 'package:movie/widget/trending_movie.dart';

class TrendingListview extends StatelessWidget {
  const TrendingListview({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;

    return Consumer(builder: (context, ref, child) {
      final trending = ref.watch(trendigDataProvider);
      return trending.when(
          data: (data) {
            return SizedBox(
              height: deviceHeight * 0.28,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  if (data.results![index].title.toString() == "null") {
                    data.results![index].title = " ";
                  }
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MovieDetails(
                                    results: data.results![index],
                                  )));
                    },
                    child: TrendingWidget(
                        name: data.results![index].title.toString() == " "
                            ? "?"
                            : data.results![index].originalTitle.toString(),
                        imageUrl: imageApi +
                            data.results![index].backdropPath.toString()),
                  );
                },
              ),
            );
          },
          error: (error, stackTrace) {
            return const Text("Error");
          },
          loading: () => const ShimmerContainer());
    });
  }
}
