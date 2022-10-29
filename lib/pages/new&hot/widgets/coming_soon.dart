import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_clone/pages/new&hot/coming_soon_controller.dart';

import 'coming_soon_card.dart';

class ComingSoonWidget extends StatelessWidget {
  final ComingSoonController comingSoonController =
      Get.put(ComingSoonController());
  ComingSoonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ComingSoonController>(builder: (controller) {
      return ListView.builder(
        itemCount: controller.comingSoonResponseModel.results?.length ?? 0,
        itemBuilder: (context, index) => ComingSoonCard(
            result: controller.comingSoonResponseModel.results![index]),
      );
    });
  }
}
