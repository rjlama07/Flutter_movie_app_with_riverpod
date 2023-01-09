import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie/data_provider/data_provider.dart';

import 'package:movie/resources/constrains.dart';
import 'package:movie/screens/moviedetails.dart';
import 'package:movie/widget/shimmer_effect.dart';
import 'package:movie/widget/trending_movie.dart';

class Discover extends StatelessWidget {
  const Discover({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    return Consumer(
      builder: ((context, ref, child) {
        final discoverData = ref.watch(discoverDataProvider);
        return discoverData.when(
            data: (data) {
              return SizedBox(
                height: deviceHeight * 0.28,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              MovieDetails(results: data.results![index]))),
                      child: TrendingWidget(
                        name: data.results![index].title.toString(),
                        imageUrl: imageApi +
                            data.results![index].posterPath.toString(),
                      ),
                    );
                  },
                ),
              );
            },
            error: (error, stackTrace) => const Text("Cannot fetch Api"),
            loading: () => const ShimmerContainer());
      }),
    );
  }
}
