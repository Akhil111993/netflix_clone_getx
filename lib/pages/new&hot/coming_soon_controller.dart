import 'package:get/get.dart';

import '../../models/Downloads/downloads_response_model.dart';
import '../../models/hot&new/coming_soon_response_model.dart';
import '../../network/base_client.dart';
import '../../network/base_controller.dart';
import '../../network/end_points.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class ComingSoonController extends GetxController with BaseController {
  ComingSoonResponseModel comingSoonResponseModel = ComingSoonResponseModel();

  @override
  onReady() {
    fetchRemoteData();
  }

  fetchRemoteData() async {
    showLoading();
    var responseString = await Get.find<BaseClient>()
        .get(ApiEndPoints.comingSoon)
        .catchError(handleError);
    hideLoading();
    if (responseString == null) {
      return;
    } else {
      comingSoonResponseModel = comingSoonResponseModelFromJson(responseString);
    }
    update();
  }

  String getMonth(String? date) {
    return DateFormat('MMMM')
        .format(DateTime.parse(date ?? '15-10-2022'))
        .substring(0, 3)
        .toUpperCase();
  }

  String getDay(String? date) {
    return (date ?? '2022-10-15').substring((date ?? '2022-10-15').length - 2);
  }
}
