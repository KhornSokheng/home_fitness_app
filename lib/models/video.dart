// import 'dart:math';
import 'package:video_player/video_player.dart';



class Video {
  String title;
  String type; // the workout type like Yoga, Muscle...
  String level; // Easy, Medium, or Hard
  int numView;
  int duration; //duration in minute
  String thumbnailImageUrl;
  String description;
  DateTime? releaseDate;
  final String videoUrl;
  int caloriesBurn;
  VideoPlayerController? controller;

  Video({
    required this.title,
    required this.level,
    required this.type,
    required this.duration,
    this.videoUrl =
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    this.caloriesBurn = 100,
    this.numView = 0,
    this.thumbnailImageUrl = 'assets/default_thumbnail5.png',
    this.description = 'Best for your muscle',
    this.releaseDate,
  });

  Map<String, dynamic> toJson() => {
        'title': title,
        'type': type,
        'level': level,
        'duration': duration,
        'numView': numView,
        'thumbnailImageUrl': thumbnailImageUrl,
        'description': description,
        'releaseDate': releaseDate,
        'videoUrl': videoUrl,
        'caloriesBurn': caloriesBurn
      };

  static Video fromJson(Map<String, dynamic> json) => Video(
      title: json['title'],
      type: json['type'],
      level: json['level'],
      duration: json['duration'],
      numView: json['numView'],
      thumbnailImageUrl: json['thumbnailImageUrl'],
      description: json['description'],
      releaseDate: json['releaseDate'],
      caloriesBurn: json['caloriesBurn'],
      videoUrl: json['videoUrl']);
}
