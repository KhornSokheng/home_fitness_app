// import 'dart:math';

class Video{
  String title;
  String type; // the workout type like For You, New, Trend...
  String level;
  int numView;
  int duration; //duration in minute
  String thumbnailImageUrl;
  String description;

  final String videoUrl;
  //TODO
  int calories_burn;
  // VideoPlayerController controller;


  Video({
    required this.title,
    required this.level,
    required this.type,
    required this.duration,
    this.videoUrl = '',
    this.calories_burn = 100,
    // this.num_view = Random().nextInt(2000)+2000;
    this.numView = 786,
    this.thumbnailImageUrl = 'assets/default_thumbnail.jpg',
    this.description = 'Best for your muscle',
  });

  Map<String, dynamic> toJson() => {
    'title': title,
    'type': type,
    'level': level,
    'duration': duration,
    'numView': numView,
    'thumbnailImageUrl': thumbnailImageUrl,
    'description': description,
  };

  static Video fromJson(Map<String, dynamic> json) => Video(
    title: json['title'],
    type: json['type'],
    level: json['level'],
    duration: json['duration'],
    numView: json['numView'],
    thumbnailImageUrl: json['thumbnailImageUrl'],
    description: json['description'],
  );

}