// import 'dart:math';
import 'package:video_player/video_player.dart';

class Video {
  String? id;
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
    this.id = 'videoID',
    required this.title,
    required this.level,
    required this.type,
    required this.duration,
    this.videoUrl =
        'https://firebasestorage.googleapis.com/v0/b/home-fitness-d9553.appspot.com/o/files%2FThe%20Workout%20_%20Pencilmation%20Cartoon%20%2342.mp4?alt=media&token=134fe601-3ed1-44d9-b939-aac20244b289',
    this.caloriesBurn = 100,
    this.numView = 0,
    this.thumbnailImageUrl = 'assets/default_thumbnail5.png',
    this.description = 'Best for your muscle',
    this.releaseDate,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
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
      videoUrl: json['videoUrl'],
      id: json['id'],

  );
}
