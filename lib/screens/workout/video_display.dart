//
// import 'package:flutter/material.dart';
//
// import '../../models/video.dart';
//
// class VideoDisplay extends StatefulWidget {
//   final Video video;
//
//   const VideoDisplay({
//     required this.video,
//   });
//
//   @override
//   _VideoDisplayState createState() => _VideoDisplayState();
// }
//
// class _VideoDisplayState extends State<VideoDisplay> {
//   final controller = PageController();
//   late Video currentExercise;
//
//   @override
//   void initState() {
//     super.initState();
//
//     currentExercise = widget.exerciseSet.exercises.first;
//   }
//
//   @override
//   Widget build(BuildContext context) => Scaffold(
//     appBar: AppBar(
//       backgroundColor: Colors.transparent,
//       title: Text(currentExercise.title),
//       centerTitle: true,
//       elevation: 0,
//     ),
//     extendBodyBehindAppBar: true,
//     body: Stack(
//       children: [
//         buildVideos(),
//         Positioned(
//           bottom: 20,
//           right: 50,
//           left: 50,
//           child: buildVideoControls(),
//         )
//       ],
//     ),
//   );
//
//   Widget buildVideos() => PageView(
//     controller: controller,
//     onPageChanged: (index) => setState(() {
//       currentExercise = widget.exerciseSet.exercises[index];
//     }),
//     children: widget.exerciseSet.exercises
//         .map((exercise) => VideoPlayerWidget(
//       exercise: exercise,
//       onInitialized: () => setState(() {}),
//     ))
//         .toList(),
//   );
//
//   Widget buildVideoControls() => VideoControlsWidget(
//     exercise: currentExercise,
//     onTogglePlaying: (isPlaying) {
//       setState(() {
//         if (isPlaying) {
//           currentExercise.controller.play();
//         } else {
//           currentExercise.controller.pause();
//         }
//       });
//     },
//     onNextVideo: () => controller.nextPage(
//       duration: Duration(milliseconds: 300),
//       curve: Curves.easeIn,
//     ),
//     onRewindVideo: () => controller.previousPage(
//       duration: Duration(milliseconds: 300),
//       curve: Curves.easeIn,
//     ),
//   );
// }