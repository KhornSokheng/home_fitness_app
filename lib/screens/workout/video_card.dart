import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:home_fitness/screens/workout/video_display.dart';

import '../../models/video.dart';

class VideoCard extends StatelessWidget {
  // const VideoCard({Key? key}) : super(key: key);

  final Video video;
  List<Video> selectedWorkoutList;

  VideoCard({
    required this.video,
    required this.selectedWorkoutList
  });

  List<Color?> colors = [
    Colors.green[200],
    Colors.orange[200],
    Colors.blue[200],
    Colors.red[200],
    Colors.pink[200],
    Colors.purple[200],
  ];

  @override
  Widget build(BuildContext context) => GestureDetector(

    onTap: () => Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => VideoDisplay(
          video: video,
          selectedWorkoutList:selectedWorkoutList
      ),
    )),

    child: Container(
      padding: const EdgeInsets.all(16),
      height: 150,
      decoration: BoxDecoration(
        // color: exerciseSet.color,
        color: colors[Random().nextInt(colors.length)],
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
        SizedBox(height: 50),
        Text('$level : $minutes Mins'),
      ],
    );
  }
}
