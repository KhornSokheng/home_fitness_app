import 'package:flutter/material.dart';
import 'package:home_fitness/models/video.dart';


enum WorkoutCategory { for_you, new_workout, all }

String getCategoryName(WorkoutCategory type) {
  switch (type) {
    case WorkoutCategory.for_you:
      return 'For You';
      break;
    case WorkoutCategory.new_workout:
      return 'New Workout';
      break;
    // case WorkoutCategory.all:
    //   return 'All';
    //   break;
    default:
      return 'All';
      break;
  }
}

class WorkoutList {
  final String name;
  final List<Video> videos;
  // final String imageUrl;
  final WorkoutCategory workoutCategory;
  final Color color;

  const WorkoutList({
    required this.name,
    required this.videos,
    // required this.imageUrl,
    required this.workoutCategory,
    required this.color,
  });

  // String get totalDuration {
  //   final duration = exercises.fold(
  //     Duration.zero,
  //         (previous, element) => previous + element.duration,
  //   );
  //
  //   return duration.inMinutes.toString();
  // }
}