import 'package:flutter/material.dart';
import 'package:movie/widget/heading_text.dart';

class TrendingWidget extends StatelessWidget {
  const TrendingWidget({super.key, required this.imageUrl});
  final String imageUrl;

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
                image: DecorationImage(image: NetworkImage(imageUrl)),
                color: Colors.grey[400]),
            height: deviceHeight * 0.22,
            width: deviceWidth * 0.35,
          ),
          SizedBox(
            height: deviceHeight * 0.01,
          ),
          HeadingText(
            text: "Doctor Strange",
            size: deviceHeight * 0.019,
          )
        ],
      ),
    );
  }
}
