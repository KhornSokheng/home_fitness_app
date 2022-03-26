import 'package:flutter/cupertino.dart';

import '../models/video.dart';

class VideoProvider extends ChangeNotifier {
  List<Video> all_videos =[];
  // late List<Video> all_videos = [
  //   Video(title: 'Basic Yoga', level: 'Easy', type: 'Yoga',duration: 5, releaseDate:DateTime.now(),
  //
  //   ),
  //   Video(title: 'Warm-Up Stretch', level: 'Easy', type: 'Running',duration: 7, releaseDate:DateTime.now()),
  //   Video(title: '5-Minute Plank', level: 'Medium', type: 'For You',duration: 5, releaseDate:DateTime.now()),
  //   Video(title: 'Runner Warm-Up', level: 'Easy', type: 'New Workout',duration: 6, releaseDate:DateTime.now()),
  //   Video(title: 'Muscle Builder', level: 'Medium', type: 'New Workout',duration: 9, releaseDate:DateTime.now()),
  //   Video(title: '10-Minutes Bodyweight Burn', level: 'Hard', type: 'All',duration: 6, releaseDate:DateTime.now()),
  //   Video(title: 'Abs & Core', level: 'Easy', type: 'Muscle',duration: 9, releaseDate:DateTime.now()),
  //   Video(title: 'Master Yoga', level: 'hard', type: 'All',duration: 4, releaseDate:DateTime.now()),
  //   Video(title: 'Basic Yoga', level: 'Easy', type: 'For You',duration: 5, releaseDate:DateTime.now()),
  //   Video(title: 'Warm-Up Stretch', level: 'Easy', type: 'For You',duration: 7, releaseDate:DateTime.now()),
  //   Video(title: '5-Minute Plank', level: 'Medium', type: 'For You',duration: 5, releaseDate:DateTime.now()),
  //   Video(title: 'Runner Warm-Up', level: 'Easy', type: 'New Workout',duration: 6, releaseDate:DateTime.now()),
  //   Video(title: 'Muscle Builder', level: 'Medium', type: 'New Workout',duration: 9, releaseDate:DateTime.now()),
  //   Video(title: '10-Minutes Bodyweight Burn', level: 'Hard', type: 'All',duration: 6, releaseDate:DateTime.now()),
  //   Video(title: 'Abs & Core', level: 'Easy', type: 'Muscle',duration: 9, releaseDate:DateTime.now()),
  //   Video(title: 'Master Yoga', level: 'hard', type: 'All',duration: 4, releaseDate:DateTime.now()),
  // ];

  // VideoProvider({required this.all_videos});

  void updateVideos(List<Video> newVideos){
    this.all_videos = newVideos;
    notifyListeners();
  }
}
