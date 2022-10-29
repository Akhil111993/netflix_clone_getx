import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ImageCardWithNumber extends StatelessWidget {
  const ImageCardWithNumber(
      {Key? key,
      this.width,
      this.height,
      required this.image,
      required this.index})
      : super(key: key);

  final double? width;
  final double? height;
  final String image;
  final String index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(left: (width ?? 0) * 0.2),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.red,
              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.cover,
              ),
            ),
            width: width,
            height: height,
          ),
        ),
        Positioned(
          bottom: 10,
          child: BorderedText(
            strokeWidth: 4.0,
            strokeColor: Colors.grey,
            child: Text(
              index,
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                  fontSize: width! * 0.7,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
