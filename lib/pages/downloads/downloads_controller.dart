import 'package:get/get.dart';

import '../../models/Downloads/downloads_response_model.dart';
import '../../network/base_client.dart';
import '../../network/base_controller.dart';
import '../../network/end_points.dart';
import 'package:http/http.dart' as http;

class DownloadsController extends GetxController with BaseController {
  DownloadsResponseModel downloadsResponseModel = DownloadsResponseModel();

  @override
  onReady() {
    fetchRemoteData();
  }

  fetchRemoteData() async {
    // showLoading();
    var responseString = await Get.find<BaseClient>()
        .get(ApiEndPoints.downloads)
        .catchError(handleError);
    // hideLoading();
    if (responseString == null) {
      return;
    } else {
      downloadsResponseModel = downloadsResponseModelFromJson(responseString);
    }
    update();
  }
}
