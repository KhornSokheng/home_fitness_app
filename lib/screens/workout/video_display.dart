
import 'package:flutter/material.dart';
import 'package:home_fitness/screens/workout/video_controls_widget.dart';
import 'package:home_fitness/screens/workout/video_player_widget.dart';

import '../../models/video.dart';

class VideoDisplay extends StatefulWidget {
  final Video video;
  List<Video> selectedWorkoutList;

  VideoDisplay({
    required this.video,
    required this.selectedWorkoutList
  });

  @override
  _VideoDisplayState createState() => _VideoDisplayState();
}

class _VideoDisplayState extends State<VideoDisplay> {
  final controller = PageController();
  // late Video currentExercise;
  late Video currentWorkout;

  @override
  void initState() {
    super.initState();

    // currentExercise = widget.exerciseSet.exercises.first;
    currentWorkout = widget.selectedWorkoutList.firstWhere((video) => video == widget.video);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.transparent,
      title: Text(currentWorkout.title),
      centerTitle: true,
      elevation: 0,
      iconTheme: IconThemeData(
          color: Colors
              .black), // set backbutton color here which will reflect in all screens.
      leading: BackButton(),
    ),
    extendBodyBehindAppBar: true,
    body: Stack(
      children: [
        buildVideos(),
        Positioned(
          bottom: 20,
          right: 50,
          left: 50,
          child: buildVideoControls(),
        )
      ],
    ),
  );

  Widget buildVideos() => PageView(
    controller: controller,
    onPageChanged: (index) => setState(() {
      // currentWorkout = widget.exerciseSet.exercises[index];
      currentWorkout = widget.selectedWorkoutList[index];
    }),
    children: widget.selectedWorkoutList
        .map((workout) => VideoPlayerWidget(
      video: workout,
      onInitialized: () => setState(() {}),
    ))
        .toList(),
  );

  Widget buildVideoControls() => VideoControlsWidget(
    video: currentWorkout,
    onTogglePlaying: (isPlaying) {
      setState(() {
        if (isPlaying) {
          currentWorkout.controller!.play();
        } else {
          currentWorkout.controller!.pause();
        }
      });
    },
    onNextVideo: () => controller.nextPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeIn,
    ),
    onRewindVideo: () => controller.previousPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeIn,
    ),
  );
}