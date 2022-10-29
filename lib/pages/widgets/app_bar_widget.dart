import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final double height;
  final PreferredSizeWidget? bottom;
  const AppBarWidget(
      {required this.title,
      super.key,
      this.bottom,
      this.height = kToolbarHeight});

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      actions: [
        const Icon(
          Icons.cast,
          color: Colors.white,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.blue,
                height: 20,
                width: 20,
              ),
            ],
          ),
        ),
      ],
      bottom: bottom,
    );
  }
}
