import 'package:flutter/material.dart';

import '../../../styles/constants/widgets.dart';

const List tabTitles = [
  'TV Shows',
  'Movies',
  'Categories',
];

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color: Colors.black38,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Image.network(
                  'https://www.designmantic.com/blog/wp-content/uploads/2016/07/Netflix-New-Logo.jpg',
                  height: 30,
                  width: 30,
                ),
                const Spacer(),
                const Icon(
                  Icons.cast,
                  color: Colors.white,
                ),
                kSizedBoxW10,
                Container(
                  color: Colors.blue,
                  height: 20,
                  width: 20,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: tabTitles
                .map(
                  (e) => Text(e),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
