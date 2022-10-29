import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../downloads/downloads_controller.dart';
import 'everyones_watching_card.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  const EveryonesWatchingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DownloadsController>(builder: (controller) {
      return ListView.builder(
        itemCount: controller.downloadsResponseModel.results?.length ?? 0,
        itemBuilder: (context, index) => EveryonesWatchingCard(
          result: controller.downloadsResponseModel.results![index],
        ),
      );
    });
  }
}
