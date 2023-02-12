import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/screens/search_page/searchpage.dart';
import 'package:movie/widget/tab_bar_body.dart';
import 'package:get/get.dart';

enum CatagoryType { popular, toprated, upcoimming }

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> tabbarItems = const [
      TabBarWidget(
        catagoryType: CatagoryType.popular,
      ),
      TabBarWidget(catagoryType: CatagoryType.toprated),
      TabBarWidget(catagoryType: CatagoryType.upcoimming),
    ];

    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(tabs: [
              Tab(text: 'Popular'),
              Tab(text: 'Top Rated'),
              Tab(text: 'Upcoming'),
            ]),
            toolbarHeight: 40.h,
            flexibleSpace: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 50.h,
              child: Column(
                children: [
                  const Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tmdb Movies',
                        style: TextStyle(fontSize: 35.sp),
                      ),
                      IconButton(
                          onPressed: () {
                            Get.to(const SearchPage());
                          },
                          icon: const Icon(
                            Icons.search,
                            size: 30,
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
          body: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              children: tabbarItems),
        ));
  }
}
