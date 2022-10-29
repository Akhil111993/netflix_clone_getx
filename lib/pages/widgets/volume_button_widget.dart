import 'package:flutter/material.dart';

class VolumeButtonWidget extends StatelessWidget {
  const VolumeButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      backgroundColor: Colors.grey,
      radius: 25,
      child: Icon(
        Icons.volume_off,
        color: Colors.white,
      ),
    );
  }
}
