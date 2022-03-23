import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../models/video.dart';

class VideoCard extends StatelessWidget {
  // const VideoCard({Key? key}) : super(key: key);

  final Video video;

  VideoCard({
    required this.video,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
    child: Container(
      padding: const EdgeInsets.all(16),
      height: 150,
      decoration: BoxDecoration(
        // color: exerciseSet.color,
        color: Colors.green[200],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(flex: 3, child: buildText()),
          Expanded(child: Image.asset(video.thumbnailImageUrl))
          // Expanded(child: Image.asset('assets/default_thumbnail.png'))
        ],
      ),
    ),
  );

  Widget buildText() {
    final title = video.title;
    final minutes = video.duration;
    final level = video.level;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AutoSizeText(
          title,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
          maxLines: 1,
        ),
        SizedBox(height: 10),
        Text('$level : $minutes Mins'),
      ],
    );
  }
}
