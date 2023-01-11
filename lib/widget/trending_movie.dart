import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie/widget/heading_text.dart';

class TrendingWidget extends StatelessWidget {
  const TrendingWidget({super.key, required this.imageUrl, required this.name});
  final String imageUrl;
  final String name;

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.only(top: 8, right: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: CachedNetworkImageProvider(imageUrl)),
            ),
            height: deviceHeight * 0.22,
            width: deviceWidth * 0.35,
          ),
          SizedBox(
            height: deviceHeight * 0.01,
          ),
          SizedBox(
            width: deviceWidth * 0.35,
            child: HeadingText(
              text: name,
              size: deviceHeight * 0.019,
            ),
          )
        ],
      ),
    );
  }
}
