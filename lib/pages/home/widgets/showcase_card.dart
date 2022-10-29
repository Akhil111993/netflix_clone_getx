import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_clone/network/end_points.dart';
import 'package:netflix_clone/pages/home/home_controller.dart';

import '../../widgets/icon_title_column.dart';

class ShowcaseCard extends StatelessWidget {
  final Size size;
  const ShowcaseCard({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Obx(
          () => !Get.find<HomeController>().isLoadingList[1].value
              ? Container(
                  height: size.height * 0.8,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        '$kImageAppendUrl${Get.find<HomeController>().responseModelList[1].results![10].posterPath}',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : const SizedBox(),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const IconTitleColumn(
                icon: Icons.add,
                title: 'My List',
              ),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.play_arrow,
                  color: Colors.black,
                ),
                label: const Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Text(
                    'Play',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                ),
              ),
              const IconTitleColumn(
                icon: Icons.info_outline,
                title: 'Info',
              ),
            ],
          ),
        )
      ],
    );
  }
}
