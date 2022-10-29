import 'package:flutter/material.dart';
import 'package:netflix_clone/pages/fast_laughs/screen_fast_laughs.dart';
import 'package:netflix_clone/pages/home/screen_home.dart';
import 'package:netflix_clone/pages/main_bottom_nav/widgets/bottom_nav.dart';
import 'package:netflix_clone/pages/new&hot/screen_new_hot.dart';
import 'package:netflix_clone/pages/search/search_page.dart';

import '../downloads/downloads_page.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({super.key});

  final screenList = [
    HomeScreen(),
    const NewAndHotScreen(),
    const FastLaughsScreen(),
    SearchScreen(),
    DownloadsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: valueNotifier,
          builder: ((context, int value, child) => screenList[value]),
        ),
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
