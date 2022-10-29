import 'package:get/get.dart';
import 'package:netflix_clone/pages/downloads/downloads_page.dart';
import 'package:netflix_clone/pages/fast_laughs/screen_fast_laughs.dart';
import 'package:netflix_clone/pages/home/screen_home.dart';
import 'package:netflix_clone/pages/new&hot/hot&new_binding.dart';
import 'package:netflix_clone/pages/new&hot/screen_new_hot.dart';
import 'package:netflix_clone/pages/search/search_binding.dart';
import 'package:netflix_clone/pages/search/search_page.dart';

import '../pages/downloads/downloads_binding.dart';
import '../pages/home/home_binding.dart';
import 'app_routes.dart';

class AppPages {
  static const initial = Routes.home;
  static final routes = [
    GetPage(
      name: Routes.downloads,
      page: () => DownloadsScreen(),
      binding: DownloadsBinding(),
    ),
    GetPage(
      name: Routes.fastLaughs,
      page: () => const FastLaughsScreen(),
    ),
    GetPage(
      name: Routes.home,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.newNHot,
      page: () => const NewAndHotScreen(),
      binding: HotAndNewBinding(),
    ),
    GetPage(
      name: Routes.search,
      page: () => SearchScreen(),
      binding: SearchBinding(),
    ),
  ];
}
