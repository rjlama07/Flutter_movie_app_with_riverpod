import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:movie/data_provider/search_provider.dart';
import 'package:movie/screens/details_page/details_page.dart';
import 'package:movie/widget/no_reasult.dart';
import 'package:movie/widget/shimmer_effect.dart';

import '../../resources/constrains.dart';

class SearchPage extends ConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final searchdData = ref.watch(searchProvider);
    TextEditingController searchController = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text("Search"),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: TextField(
                  controller: searchController,
                  decoration: const InputDecoration(
                      hintText: "Search for  movies",
                      contentPadding: EdgeInsets.all(12),
                      border: OutlineInputBorder()),
                ),
              ),
              Center(
                  child: ElevatedButton(
                      onPressed: () {
                        String search = searchController.text.trim();
                        ref.read(searchProvider.notifier).searchMovie(search);
                        searchController.clear();
                      },
                      child: const Text("Search"))),
              Expanded(
                  child: searchdData.isLoading
                      ? const ShimmerContainer()
                      : searchdData.isError
                          ? !searchdData.errorMessage.contains("empty")
                              ? Center(child: Text(searchdData.errorMessage))
                              : const NoReasult()
                          : GridView.builder(
                              itemCount: searchdData.movies.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      childAspectRatio: 2 / 3,
                                      crossAxisSpacing: 5,
                                      mainAxisSpacing: 5),
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    Get.to(DetailPage(
                                        movie: searchdData.movies[index]));
                                  },
                                  child: searchdData
                                              .movies[index].poster_path !=
                                          ""
                                      ? CachedNetworkImage(
                                          errorWidget: (context, url, error) =>
                                              Image.asset(
                                                  "assets/images/launch_icon.png"),
                                          placeholder: (context, url) => Center(
                                                  child: SpinKitFadingCube(
                                                color: Colors.redAccent
                                                    .withOpacity(0.2),
                                              )),
                                          imageUrl:
                                              "$imageApi${searchdData.movies[index].poster_path}")
                                      : Image.asset(
                                          "assets/images/launch_icon.png"),
                                );
                              },
                            ))
            ],
          ),
        ));
  }
}
