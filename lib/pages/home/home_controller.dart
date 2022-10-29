import 'package:get/get.dart';
import 'package:netflix_clone/models/Home/popular_movie_model.dart';

import '../../models/Downloads/downloads_response_model.dart';
import '../../network/base_client.dart';
import '../../network/base_controller.dart';
import '../../network/end_points.dart';
import 'package:http/http.dart' as http;

List<String> endpoints = [
  ApiEndPoints.downloads,
  ApiEndPoints.weeklyTrending,
  ApiEndPoints.topRated,
  ApiEndPoints.downloads,
  ApiEndPoints.weeklyTrending,
];

class HomeController extends GetxController with BaseController {
  PopularResponseModel popularResponseModel = PopularResponseModel();
  DownloadsResponseModel downloadsResponseModel = DownloadsResponseModel();
  DownloadsResponseModel downloadsResponseModel2 = DownloadsResponseModel();
  DownloadsResponseModel downloadsResponseModel3 = DownloadsResponseModel();
  DownloadsResponseModel downloadsResponseModel4 = DownloadsResponseModel();

  var isDownloadsLoading = true.obs;
  var isReleasedLoading = true.obs;
  var isTenseLoading = true.obs;
  var isSouthLoading = true.obs;

  late List<RxBool> isLoadingList;
  late List<DownloadsResponseModel> responseModelList;

  @override
  void onInit() {
    isLoadingList = [
      isDownloadsLoading,
      isReleasedLoading,
      isTenseLoading,
      isSouthLoading,
      isSouthLoading,
    ];
    responseModelList = [
      downloadsResponseModel,
      downloadsResponseModel2,
      downloadsResponseModel3,
      downloadsResponseModel4,
      downloadsResponseModel4,
    ];

    super.onInit();
  }

  @override
  onReady() {
    for (int i = 0; i < 5; i++) {
      fetchRemoteData(i);
    }
  }

  fetchRemoteData(int i) async {
    isLoadingList[i](true);
    var responseString =
        await Get.find<BaseClient>().get(endpoints[i]).catchError(handleError);

    if (responseString == null) {
      isLoadingList[i](false);
    } else {
      _setModel(i, responseString);
      isLoadingList[i](false);
    }
  }

  _setModel(int i, String responseString) {
    switch (i) {
      case 0:
        responseModelList[i] = downloadsResponseModelFromJson(responseString);
        break;
      case 1:
        responseModelList[i] = downloadsResponseModelFromJson(responseString);
        break;
      case 2:
        responseModelList[i] = downloadsResponseModelFromJson(responseString);
        break;
      case 3:
        responseModelList[i] = downloadsResponseModelFromJson(responseString);
        break;
      case 4:
        responseModelList[i] = downloadsResponseModelFromJson(responseString);
        break;
    }
  }
}
