import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerContainer extends StatelessWidget {
  const ShimmerContainer({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Shimmer.fromColors(
        baseColor: Colors.grey.shade700,
        highlightColor: Colors.grey.shade100,
        child: SizedBox(
          child: GridView.builder(
            itemCount: 12,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 2 / 3,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5),
            itemBuilder: (context, index) {
              return Container(
                color: Colors.white,
              );
            },
          ),
        ));
  }
}
