import 'package:flutter/material.dart';

import '../../../styles/constants/widgets.dart';

class SearchCustomListTile extends StatelessWidget {
  final String image;
  final String title;
  const SearchCustomListTile({
    Key? key,
    required this.image,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: kBorderRadius5,
            image: DecorationImage(
              image: NetworkImage(
                image,
              ),
              fit: BoxFit.cover,
            ),
          ),
          height: 90,
          width: MediaQuery.of(context).size.width * 0.37,
        ),
        kSizedBoxW10,
        Expanded(
          child: Text(
            title,
            maxLines: 3,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        const Icon(
          Icons.play_circle_outline_sharp,
          color: Colors.white,
          size: 50,
        ),
        kSizedBoxW10,
      ],
    );
  }
}
