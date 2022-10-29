import 'package:flutter/material.dart';

class ProfilePicWithText extends StatelessWidget {
  const ProfilePicWithText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Stack(
        children: const [
          CircleAvatar(
            radius: 28,
            backgroundImage: NetworkImage(
                'https://www.themoviedb.org/t/p/w220_and_h330_face/wE0I6efAW4cDDmZQWtwZMOW44EJ.jpg'),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text('LOGO'),
            ),
          ),
        ],
      ),
    );
  }
}
