import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_clone/pages/home/home_controller.dart';

import '../../../network/end_points.dart';
import '../../../styles/constants/widgets.dart';
import '../../widgets/card_title.dart';
import '../../widgets/image_card.dart';

class ListWithTitle extends StatelessWidget {
  final String title;
  final int position;

  const ListWithTitle({
    Key? key,
    required this.size,
    required this.title,
    required this.position,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kSizedBoxH10,
        CardTitle(title: title),
        kSizedBoxH10,
        Obx(
          () => Get.find<HomeController>().isLoadingList[position].value
              ? const SizedBox()
              : LimitedBox(
                  maxHeight: size.width * 0.57,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => ImageCard(
                            width: size.width * 0.35,
                            borderRadius: kBorderRadius10,
                            image:
                                '$kImageAppendUrl${Get.find<HomeController>().responseModelList[position].results?[index].posterPath}',
                          ),
                      separatorBuilder: ((context, index) => kSizedBoxW10),
                      itemCount: 10),
                ),
        ),
      ],
    );
  }
}
