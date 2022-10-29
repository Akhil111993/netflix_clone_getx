import 'package:flutter/material.dart';

class IconTitleColumn extends StatelessWidget {
  final String title;
  final IconData icon;
  const IconTitleColumn({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.white,
        ),
        Text(title),
      ],
    );
  }
}
