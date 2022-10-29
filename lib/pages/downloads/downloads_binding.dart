import 'package:get/get.dart';

import 'downloads_controller.dart';

//class binds all controllers that is needed (Actually helpful if more
//controllers are needed)

class DownloadsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DownloadsController());
  }
}
