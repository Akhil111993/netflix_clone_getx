import 'package:flutter/material.dart';
import 'package:netflix_clone/pages/widgets/volume_button_widget.dart';

import '../../network/end_points.dart';

class ImageWithVolumeButton extends StatelessWidget {
  final String? image;
  const ImageWithVolumeButton({
    Key? key,
    this.image = '/wB8xWKLCZJZx13uavLffRhvPBSE.jpg',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          '$kImageAppendUrl$image',
          height: 200,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        const Positioned(
          right: 10,
          bottom: 10,
          child: VolumeButtonWidget(),
        ),
      ],
    );
  }
}
