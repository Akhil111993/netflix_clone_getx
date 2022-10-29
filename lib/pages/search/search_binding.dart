import 'package:get/get.dart';
import 'package:netflix_clone/pages/search/search_controller.dart';

import 'search_trending_controller.dart';

//class binds all controllers that is needed (Actually helpful if more
//controllers are needed)

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchTrendingController());
    Get.lazyPut(() => SearchController());
  }
}
