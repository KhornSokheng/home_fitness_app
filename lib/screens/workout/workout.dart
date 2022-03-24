import 'package:flutter/material.dart';
// import 'package:home_fitness/models/level.dart';
import 'package:home_fitness/models/video.dart';
// import 'package:home_fitness/screens/achievement/activity_card.dart';
// import 'package:home_fitness/models/activity.dart';
// import 'package:home_fitness/screens/workout/levelcard.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:home_fitness/providers/user_provider.dart';
import 'package:home_fitness/providers/video_provider.dart';
import 'package:home_fitness/screens/workout/video_card.dart';
import 'package:provider/provider.dart';

import '../../data/workout_videos.dart';
import '../../models/user.dart';
import '../../models/workout_list.dart';

class Workout extends StatefulWidget {
  const Workout({Key? key}) : super(key: key);

  @override
  _WorkoutState createState() => _WorkoutState();
}

class _WorkoutState extends State<Workout> {
  WorkoutCategory selectedType = WorkoutCategory.for_you;

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Workouts"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              buildCategoryLevel(),
              SizedBox(height: 8),
              buildWorkouts(context),
              SizedBox(height: 50),
            ],
          ),
        ));
  }

  Widget buildWorkouts(BuildContext context) {

    User user = Provider.of<UserProvider>(context).user;
    List<Video> all_videos = Provider.of<VideoProvider>(context).all_videos;

    List<Video> selectedWorkoutList;

    if(getCategoryName(selectedType) == 'For You') {
      selectedWorkoutList = all_videos
          .where((video) => user.interest.contains(video.type))
          .toList();
    }else if( getCategoryName(selectedType) =='New Workout' ) {
      DateTime now = DateTime.now();
      selectedWorkoutList= all_videos
          .where((video) =>
      video.releaseDate!.difference(now) < Duration(days: 3))
          .toList();
    }else{
      selectedWorkoutList = all_videos;
    }

    print(user.interest);
    print(selectedWorkoutList.length);
    // forYouList.map((e) => print(e.title));

    return GestureDetector(
      onHorizontalDragEnd: swipeFunction,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: selectedWorkoutList
              // .where((video) => video.type == getCategoryName(selectedType))
              .map(
                (video) =>
                Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: VideoCard(video: video, selectedWorkoutList: selectedWorkoutList)

                ),
          )
              .toList(),
        ),
      ),
    );
  }

  Widget buildCategoryLevel() => Row(
        children: WorkoutCategory.values.map(
          (type) {
            final name = getCategoryName(type);
            final fontWeight =
                selectedType == type ? FontWeight.bold : FontWeight.normal;
            final double fontSize = selectedType == type ? 20 : 16;

            return Expanded(
              child: Center(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => setState(() => selectedType = type),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      name,
                      style: TextStyle(
                        fontWeight: fontWeight, fontSize: fontSize,
                        // color: Colors.green
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ).toList(),
      );

  void swipeFunction(DragEndDetails dragEndDetails) {
    final selectedIndex = WorkoutCategory.values.indexOf(selectedType);
    final hasNext = selectedIndex < WorkoutCategory.values.length;
    final hasPrevious = selectedIndex > 0;

    setState(() {
      if (dragEndDetails.primaryVelocity! < 0 && hasNext) {
        final nextType = WorkoutCategory.values[selectedIndex + 1];
        selectedType = nextType;
      }
      if (dragEndDetails.primaryVelocity! > 0 && hasPrevious) {
        final previousType = WorkoutCategory.values[selectedIndex - 1];
        selectedType = previousType;
      }
    });
  }
}
