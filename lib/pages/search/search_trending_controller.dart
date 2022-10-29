import 'package:get/get.dart';

import '../../models/Downloads/downloads_response_model.dart';
import '../../models/Search/search_trending_response.dart';
import '../../network/base_client.dart';
import '../../network/base_controller.dart';
import '../../network/end_points.dart';
import 'package:http/http.dart' as http;

class SearchTrendingController extends GetxController with BaseController {
  SearchTrendingResponseModel searchTrendingResponseModel =
      SearchTrendingResponseModel();

  @override
  onReady() {
    fetchRemoteData();
  }

  fetchRemoteData() async {
    showLoading();
    var responseString = await Get.find<BaseClient>()
        .get(ApiEndPoints.trending)
        .catchError(handleError);
    hideLoading();
    if (responseString == null) {
      return;
    } else {
      searchTrendingResponseModel =
          searchTrendingResponseModelFromJson(responseString);
    }
    update();
  }
}
