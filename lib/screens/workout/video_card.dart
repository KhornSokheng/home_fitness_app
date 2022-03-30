import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:home_fitness/models/user.dart';
import 'package:home_fitness/providers/user_provider.dart';
import 'package:home_fitness/screens/workout/video_display.dart';
import 'package:provider/provider.dart';

import '../../models/video.dart';

class VideoCard extends StatelessWidget {
  // const VideoCard({Key? key}) : super(key: key);

  final Video video;
  List<Video> selectedWorkoutList;

  VideoCard({required this.video, required this.selectedWorkoutList});

  List<Color?> colors = [
    Colors.green[200],
    Colors.orange[200],
    Colors.blue[200],
    Colors.red[200],
    Colors.pink[200],
    Colors.purple[200],
  ];

  @override
  Widget build(BuildContext context) {
    User user= Provider.of<UserProvider>(context).user;

    return GestureDetector(
      onTap: () =>
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        print('Video Clicked');

        // update user data when clicked on video
        user.num_workout +=1;
        user.minute_play += video.duration;
        user.calories_burn += video.caloriesBurn;

        // Provider.of<UserProvider>(context,listen: false).updateUser(user);
        final docUser = FirebaseFirestore.instance.collection('users').doc(user.id);
        docUser.update({
          'num_workout': user.num_workout,
          'minute_play': user.minute_play,
          'calories_burn': user.calories_burn,
        });

        //update video data
        video.numView +=1;
        print(video.id);
        final docVideo = FirebaseFirestore.instance.collection('videos').doc(video.id);
        docVideo.update({
          'numView':video.numView
        });



        return VideoDisplay(
            video: video, selectedWorkoutList: selectedWorkoutList);
      })),
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
            Expanded(child: Image.network(video.thumbnailImageUrl))
            // Expanded(child: Image.asset('assets/default_thumbnail.png'))
          ],
        ),
      ),
    );
  }

  Widget buildText() {
    final title = video.title;
    final minutes = video.duration;
    final level = video.level;
    final type = video.type;

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
        Text(type),
        Text('$level : $minutes Mins'),
      ],
    );
  }
}
