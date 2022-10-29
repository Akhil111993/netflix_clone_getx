import 'package:get/get.dart';

import '../downloads/downloads_controller.dart';
import 'coming_soon_controller.dart';

//class binds all controllers that is needed (Actually helpful if more
//controllers are needed)

class HotAndNewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DownloadsController());
    Get.lazyPut(() => ComingSoonController());
  }
}
