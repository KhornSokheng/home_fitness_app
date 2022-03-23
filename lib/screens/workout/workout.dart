import 'package:flutter/material.dart';
// import 'package:home_fitness/models/level.dart';
import 'package:home_fitness/models/video.dart';
// import 'package:home_fitness/screens/achievement/activity_card.dart';
// import 'package:home_fitness/models/activity.dart';
// import 'package:home_fitness/screens/workout/levelcard.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:home_fitness/screens/workout/video_card.dart';

import '../../data/workout_videos.dart';
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
              buildWorkouts(),
              SizedBox(height: 50),
            ],
          ),
        )
      );
    }

  Widget buildWorkouts() => GestureDetector(
    onHorizontalDragEnd: swipeFunction,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: workoutVideos
            .where((video) => video.type == getCategoryName(selectedType))
            .map(
              (video) => Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: VideoCard(video: video)),
        )
            .toList(),
      ),
    ),
  );

  Widget buildCategoryLevel() => Row(
    children: WorkoutCategory.values.map(
          (type) {
        final name = getCategoryName(type);
        final fontWeight =
        selectedType == type ? FontWeight.bold : FontWeight.normal;

        return Expanded(
          child: Center(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => setState(() => selectedType = type),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  name,
                  style: TextStyle(fontWeight: fontWeight, fontSize: 16,
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
