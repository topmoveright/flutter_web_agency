import 'package:agency/constants/custom_color.dart';
import 'package:agency/constants/custom_size.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoApp extends StatefulWidget {
  final double? height;
  final String videoUrl;

  const VideoApp({Key? key, required this.videoUrl, this.height})
      : super(key: key);

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late final VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {})
      ..addListener(() {
        if (_controller.value.isInitialized) {
          setState(() {});
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: Center(
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: _controller.value.isInitialized
              ? Stack(
                  alignment: Alignment.center,
                  children: [
                    VideoPlayer(_controller),
                    CircleAvatar(
                      backgroundColor: CustomColor.primary,
                      radius: CustomSize.xx,
                      child: IconButton(
                        iconSize: CustomSize.xx,
                        color: Colors.white,
                        onPressed: () => setState(() {
                          _controller.value.isPlaying
                              ? _controller.pause()
                              : _controller.play();
                        }),
                        icon: Icon(
                          _controller.value.isPlaying
                              ? Icons.pause
                              : Icons.play_arrow,
                        ),
                      ),
                    )
                  ],
                )
              : Container(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
