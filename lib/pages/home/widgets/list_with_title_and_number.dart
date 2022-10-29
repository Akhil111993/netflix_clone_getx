import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_clone/pages/downloads/downloads_controller.dart';

import '../../../network/end_points.dart';
import '../../../styles/constants/widgets.dart';
import '../../widgets/card_title.dart';
import 'card_with_number.dart';

class ListWithTitleAndNumber extends StatelessWidget {
  final String title;
  const ListWithTitleAndNumber({
    Key? key,
    required this.size,
    required this.title,
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
        GetBuilder<DownloadsController>(builder: (controller) {
          return LimitedBox(
            maxHeight: size.width * 0.57,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => ImageCardWithNumber(
                      width: size.width * 0.35,
                      image:
                          '$kImageAppendUrl${controller.downloadsResponseModel.results?[index].posterPath}',
                      index: (index + 1).toString(),
                    ),
                separatorBuilder: ((context, index) => kSizedBoxW10),
                itemCount: 10),
          );
        })
      ],
    );
  }
}
