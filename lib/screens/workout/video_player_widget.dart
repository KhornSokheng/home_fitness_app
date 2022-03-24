import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../models/video.dart';

class VideoPlayerWidget extends StatefulWidget {
  final Video video;
  final VoidCallback onInitialized;

  const VideoPlayerWidget({
    required this.video,
    required this.onInitialized,
  });

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    // controller = VideoPlayerController.asset(widget.video.videoUrl)
    controller = VideoPlayerController.network(widget.video.videoUrl )
      ..initialize().then((value) {
        controller.setLooping(true);
        controller.play();

        widget.video.controller = controller;
        widget.onInitialized();
      });
  }

  @override
  Widget build(BuildContext context) => SizedBox.expand(
    child: controller.value.isInitialized
        ? VideoPlayer(controller)
        : Center(child: CircularProgressIndicator()),
  );
}