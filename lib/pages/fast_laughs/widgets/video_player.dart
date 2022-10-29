import 'package:flutter/material.dart';

import 'package:video_player/video_player.dart';

class CustomVideoPlayer extends StatefulWidget {
  final String url;
  const CustomVideoPlayer({super.key, required this.url});

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.url)
      ..initialize().then((_) {
        setState(() {
          _controller.play();
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: VideoPlayer(_controller))
        : Container();
  }
}
