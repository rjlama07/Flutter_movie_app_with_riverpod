import 'package:flutter/material.dart';
import 'package:movie/widget/heading_text.dart';
import 'package:movie/widget/trending_movie.dart';

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeadingText(text: "Trending now"),
              SizedBox(
                height: deviceHeight * 0.01,
              ),
              SizedBox(
                height: deviceHeight * 0.28,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const TrendingWidget(
                        imageUrl:
                            "https://bbts1.azureedge.net/images/p/full/2022/02/821e9a47-7a4f-492e-af21-ebf3470d3e60.jpg");
                  },
                ),
              ),
              SizedBox(
                height: deviceHeight * 0.01,
              ),
              const HeadingText(text: "Horror"),
              SizedBox(
                height: deviceHeight * 0.01,
              ),
              SizedBox(
                height: deviceHeight * 0.28,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const TrendingWidget(
                      imageUrl:
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTSoMS_87254HUudb4Emt-adeLHzZNiQkrAqW7UApAwlQHuI3t_3N2J10pModsVgpngs0&usqp=CAU",
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
