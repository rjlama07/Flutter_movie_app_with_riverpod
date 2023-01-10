import 'package:flutter/material.dart';
import 'package:movie/widget/discover.dart';
import 'package:movie/widget/heading_text.dart';

import 'package:movie/widget/trending_movie_listview.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Colors.black
            : Colors.white,
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeadingText(text: "Discover"),
                SizedBox(
                  height: deviceHeight * 0.01,
                ),
                const Discover(),
                SizedBox(
                  height: deviceHeight * 0.01,
                ),
                const HeadingText(text: "Trending now"),
                SizedBox(
                  height: deviceHeight * 0.01,
                ),
                const TrendingListview(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
