import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie/model/movie_model.dart';
import 'package:movie/resources/constrains.dart';
import 'package:movie/widget/heading_text.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({super.key, required this.results});
  final Results results;

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    // double deviceWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios)),
          elevation: 0,
          centerTitle: true,
          title: const Text("Details"),
        ),
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Colors.black
            : Colors.white,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: deviceHeight * 0.3,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: CachedNetworkImageProvider(
                              imageApi + results.posterPath.toString())),
                      color: Colors.grey[400]),
                ),
                SizedBox(
                  height: deviceHeight * 0.02,
                ),
                HeadingText(text: results.title.toString()),
                Text(
                  results.releaseDate.toString(),
                  style: const TextStyle(color: Colors.white54, fontSize: 12),
                ),
                SizedBox(
                  height: deviceHeight * 0.022,
                ),
                Text(results.overview.toString())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
