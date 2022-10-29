import 'dart:math';

import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  const ImageCard(
      {Key? key,
      this.width,
      this.height,
      this.angle = 0,
      this.margin,
      required this.borderRadius,
      required this.image})
      : super(key: key);

  final double? width;
  final double? height;
  final int angle;
  final EdgeInsetsGeometry? margin;
  final String image;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(image),
              fit: BoxFit.cover,
            ),
            borderRadius: borderRadius),
        width: width,
        height: height,
      ),
    );
  }
}
