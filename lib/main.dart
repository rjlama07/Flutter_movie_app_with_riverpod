import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/screens/home_page.dart';
import 'package:get/get.dart';
import 'package:movie/widget/shimmer_effect.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(932, 430),
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        themeMode: ThemeMode.light,
        theme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.blue,
            appBarTheme:
                const AppBarTheme().copyWith(foregroundColor: Colors.white)),
        home: const HomePage(),
      ),
    );
  }
}
