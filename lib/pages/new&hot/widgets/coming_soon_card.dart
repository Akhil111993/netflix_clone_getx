import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:netflix_clone/models/hot&new/coming_soon_response_model.dart';
import 'package:netflix_clone/pages/new&hot/coming_soon_controller.dart';

import '../../../styles/constants/widgets.dart';
import '../../widgets/icon_title_column.dart';
import '../../widgets/image_with_volume_button.dart';

class ComingSoonCard extends StatelessWidget {
  final Result? result;
  const ComingSoonCard({
    Key? key,
    this.result,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 30,
        top: 10,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kSizedBoxW10,
          Column(
            children: [
              Text(
                Get.find<ComingSoonController>().getMonth(result?.releaseDate),
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
              kSizedBoxH10,
              Text(
                Get.find<ComingSoonController>().getDay(result?.releaseDate),
                style: const TextStyle(
                  fontSize: 20,
                  letterSpacing: 5,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
          kSizedBoxW10,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImageWithVolumeButton(
                  image: result?.posterPath,
                ),
                kSizedBoxH10,
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        result?.originalTitle ?? 'no title',
                        style: GoogleFonts.satisfy(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              overflow: TextOverflow.ellipsis),
                        ),
                      ),
                    ),
                    const IconTitleColumn(
                      icon: Icons.notifications_none_outlined,
                      title: 'Remind me',
                    ),
                    kSizedBoxW10,
                    const IconTitleColumn(
                      icon: Icons.info_outline,
                      title: 'Info',
                    ),
                    kSizedBoxW10,
                  ],
                ),
                kSizedBoxH10,
                Builder(builder: (context) {
                  return Text(
                    'Coming on ${DateFormat('EEEE').format(DateTime.parse(result?.releaseDate ?? '15-10-2022'))}',
                    style: const TextStyle(color: Colors.white60),
                  );
                }),
                kSizedBoxH20,
                Text(
                  result?.originalTitle ?? '',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      overflow: TextOverflow.ellipsis),
                ),
                kSizedBoxH10,
                Text(
                  result?.overview ?? '',
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
