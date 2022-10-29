import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_clone/network/end_points.dart';
import 'package:netflix_clone/pages/search/search_controller.dart';
import 'package:netflix_clone/pages/search/search_trending_controller.dart';
import 'package:netflix_clone/pages/search/widgets/search_custom_listtile.dart';
import 'package:netflix_clone/styles/constants/widgets.dart';
import '../widgets/card_title.dart';
import '../widgets/image_card.dart';

class SearchScreen extends StatelessWidget {
  final SearchTrendingController trendingController =
      Get.put(SearchTrendingController());
  final SearchController searchController = Get.put(SearchController());
  SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CupertinoSearchTextField(
                  backgroundColor: Colors.grey.withOpacity(0.4),
                  itemColor: Colors.grey,
                  style: const TextStyle(color: Colors.white),
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      searchController.setIsQueryEmpty(false);
                      searchController.fetchRemoteData(value);
                    } else {
                      searchController.setIsQueryEmpty(true);
                    }
                  }),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: GetBuilder<SearchController>(builder: (controller) {
                  return CardTitle(
                    title: controller.isQueryEmpty
                        ? 'Top Searches'
                        : 'Search Result',
                  );
                }),
              ),
              GetBuilder<SearchController>(builder: (controller) {
                return !controller.isQueryEmpty
                    ? Expanded(
                        child: ListView.separated(
                          itemBuilder: (_, index) => SearchCustomListTile(
                            image:
                                '$kImageAppendUrl${controller.searchResponseModel.results?[index].posterPath}',
                            title:
                                '${controller.searchResponseModel.results?[index].title}',
                          ),
                          separatorBuilder: (_, index) => kSizedBoxH20,
                          itemCount:
                              controller.searchResponseModel.results?.length ??
                                  0,
                        ),
                      )
                    : GetBuilder<SearchTrendingController>(
                        builder: (controller) {
                        return Expanded(
                          child: GridView.count(
                            crossAxisCount: 3,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            childAspectRatio: 1 / 1.75,
                            children: List.generate(
                              controller.searchTrendingResponseModel.results
                                      ?.length ??
                                  0,
                              (index) => ImageCard(
                                borderRadius: kBorderRadius5,
                                image:
                                    '$kImageAppendUrl${controller.searchTrendingResponseModel.results?[index].posterPath}',
                              ),
                            ),
                          ),
                        );
                      });
              }),
            ],
          ),
        ),
      ),
    );
  }
}
