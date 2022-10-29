import 'package:get/get.dart';
import '../downloads/downloads_controller.dart';
import 'home_controller.dart';

//class binds all controllers that is needed (Actually helpful if more
//controllers are needed)

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DownloadsController());
    Get.lazyPut(() => HomeController());
  }
}
