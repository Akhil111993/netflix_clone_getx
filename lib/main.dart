import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/pages/home/home_binding.dart';

import 'package:netflix_clone/styles/colors/colors.dart';
import 'package:netflix_clone/pages/main_bottom_nav/screen_main.dart';
import 'package:netflix_clone/routes/app_pages.dart';

import 'styles/constants/styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Netflix',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
        primarySwatch: Colors.blue,
        backgroundColor: CustomColors.backgroundColor,
        scaffoldBackgroundColor: CustomColors.backgroundColor,
        textTheme: GoogleFonts.montserratTextTheme(
          const TextTheme(bodyText1: kTextBodyStyle, bodyText2: kTextBodyStyle),
        ),
      ),
      home: ScreenMainPage(),
      initialBinding: HomeBinding(),
      getPages: AppPages.routes,
    );
  }
}
