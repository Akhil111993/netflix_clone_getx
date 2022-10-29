import 'package:get/get.dart';

import '../../models/Search/search_response.dart';
import '../../network/base_client.dart';
import '../../network/base_controller.dart';
import '../../network/end_points.dart';

class SearchController extends GetxController with BaseController {
  SearchResponseModel searchResponseModel = SearchResponseModel();
  bool isQueryEmpty = true;

  fetchRemoteData(String query) async {
    var responseString = await Get.find<BaseClient>()
        .get(ApiEndPoints.getSearch(query))
        .catchError(handleError);

    if (responseString == null) {
      return;
    } else {
      searchResponseModel = searchResponseModelFromJson(responseString);
    }
    update();
  }

  void setIsQueryEmpty(bool isQueryEmpty) {
    this.isQueryEmpty = isQueryEmpty;
    update();
  }
}
