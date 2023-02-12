import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class NoReasult extends StatelessWidget {
  const NoReasult({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Lottie.asset("assets/images/no_items_found.json"),
        ),
        Text(
          "Sorry😢No reasult found for given keyword",
          style: TextStyle(fontSize: 40.sp),
        )
      ],
    );
  }
}
