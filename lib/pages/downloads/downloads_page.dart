import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_clone/network/end_points.dart';
import 'package:netflix_clone/styles/colors/colors.dart';
import 'package:netflix_clone/styles/constants/widgets.dart';
import 'package:netflix_clone/pages/downloads/downloads_controller.dart';

import '../../styles/constants/styles.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/image_card.dart';

class DownloadsScreen extends StatelessWidget {
  final DownloadsController downloadsController =
      Get.put(DownloadsController());
  DownloadsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetBuilder<DownloadsController>(builder: (contoller) {
      return Scaffold(
        appBar: const AppBarWidget(
          title: 'Downloads',
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 5,
          ),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: const [
                    Icon(
                      Icons.settings,
                      color: CustomColors.white,
                    ),
                    kSizedBoxW10,
                    Text('Smart Downloads'),
                  ],
                ),
              ),
              kSizedBoxH10,
              const Text(
                'Introducing Downloads For You',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              kSizedBoxH10,
              const Text(
                'We will download a personalised selection of\nmovies and shows for you, so there\'s\nalways something to watch on your\ndevice',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      radius: size.width * 0.37,
                      backgroundColor: Colors.grey.withOpacity(0.5),
                    ),
                    GetBuilder<DownloadsController>(
                      builder: (controller) => ImageCard(
                        width: size.width * 0.35,
                        height: size.width * 0.52,
                        angle: 20,
                        margin: const EdgeInsets.only(left: 150, bottom: 20),
                        image:
                            '$kImageAppendUrl${controller.downloadsResponseModel.results?[2].posterPath}',
                        borderRadius: kBorderRadius10,
                      ),
                    ),
                    GetBuilder<DownloadsController>(builder: (controller) {
                      return ImageCard(
                        width: size.width * 0.35,
                        height: size.width * 0.52,
                        angle: -20,
                        margin: const EdgeInsets.only(right: 150, bottom: 20),
                        image:
                            '$kImageAppendUrl${controller.downloadsResponseModel.results?[1].posterPath}',
                        borderRadius: kBorderRadius10,
                      );
                    }),
                    GetBuilder<DownloadsController>(builder: (controller) {
                      return ImageCard(
                        width: size.width * 0.35,
                        height: size.width * 0.52,
                        image:
                            '$kImageAppendUrl${controller.downloadsResponseModel.results?[0].posterPath}',
                        borderRadius: kBorderRadius10,
                      );
                    }),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Set up',
                  style: kBoldText,
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(CustomColors.white),
                ),
                child: const Text(
                  'See what you can download',
                  style: kBoldAndBlackText,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
